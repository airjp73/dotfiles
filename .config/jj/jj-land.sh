#!/usr/bin/env bash
# Land a squash-merged PR from the bottom of a jj stack, rebasing the
# survivors onto the new trunk.
#   jj land            # auto-picks the bottom-most bookmark in the current stack
#   jj land <bookmark> # lands a specific bookmark
set -euo pipefail

merged="${1:-}"

if [ -z "$merged" ]; then
  # Bottom-most bookmark in the current stack (nearest trunk).
  candidates="$(jj bookmark list -r 'roots(stack())' -T 'name ++ "\n"')"
  count="$(printf '%s' "$candidates" | grep -c . || true)"
  case "$count" in
    0) echo "jj land: no bookmarks in the current stack" >&2; exit 1 ;;
    1) merged="$candidates"; echo "jj land: auto-selected bottom bookmark '$merged'" ;;
    *) echo "jj land: stack has multiple bottom bookmarks:" >&2
       printf '  %s\n' $candidates >&2
       echo "specify one explicitly: jj land <bookmark>" >&2; exit 1 ;;
  esac
fi

jj git fetch --branch main            # advance trunk; keep the merged bookmark alive locally
jj rebase -s "all:${merged}+" -d 'trunk()'  # reparent the next PR (children of the merged tip) onto trunk
jj abandon "trunk()..${merged}"       # drop the now-merged commits
jj git fetch                          # pull the remote branch deletion + prune
jj bookmark delete "${merged}"        # clean up the local bookmark
