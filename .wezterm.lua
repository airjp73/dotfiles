local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Tokyo Night (Gogh)'

-- Allows neovim to handle the CMD key
config.enable_kitty_keyboard = true
config.enable_csi_u_key_encoding = false

return config
