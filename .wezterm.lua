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

return config
