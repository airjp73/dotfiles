// Menu: Open Project
// Description: Open a project from ~/dev folder
// Shortcut: cmd shift .

import "@johnlindquist/kit"

const projectDirPath = "~/dev";

const projects = ls(projectDirPath).map((dir) => {
  const fullPath = path.join(projectDirPath, dir);
  return {
    name: dir,
    value: fullPath,
    description: fullPath,
  };
});

const project = await arg("Select project:", projects);

exec(`open -a iTerm ${project}`)
edit(project);