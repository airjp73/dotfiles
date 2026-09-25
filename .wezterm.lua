local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Tokyo Night (Gogh)'

-- Allows neovim to handle the CMD key
config.enable_kitty_keyboard = true
config.enable_csi_u_key_encoding = false

config.keys = {
  {
    key = "f",
    mods = "CMD|SHIFT",
    action = wezterm.action.SendString "\\fg" -- "<leader>fg" in vim land
  }
}

-- Tab title = basename of the active pane's current directory.
-- A title set explicitly (e.g. via the "rename tab" action) still wins.
local function basename_of_cwd(pane)
  local cwd = pane.current_working_dir
  if not cwd then
    return nil
  end
  -- Newer WezTerm gives a Url object; older gives a "file://host/path" string.
  local path = type(cwd) == 'userdata' and cwd.file_path or tostring(cwd):gsub('^file://[^/]*', '')
  path = path:gsub('/+$', '')
  if path == wezterm.home_dir then
    return '~'
  end
  return path:match('([^/]+)$') or path
end

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local title = tab.tab_title
  if title == nil or #title == 0 then
    title = basename_of_cwd(tab.active_pane) or tab.active_pane.title
  end
  return ' ' .. (tab.tab_index + 1) .. ': ' .. title .. ' '
end)

return config
