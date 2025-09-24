local wezterm = require("wezterm")
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider 
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider
local action = wezterm.action

local config = wezterm.config_builder()

-- Toggle background image with Lua variable or WT_BG env var
local default_use_background_image = false
local use_background_image = os.getenv("WT_BG") == "true" or (os.getenv("WT_BG") == nil and default_use_background_image)

-- Merge tables
local merge_tables = function(first_table, second_table)
  for k, v in pairs(second_table) do
    first_table[k] = v
  end
  return first_table
end

-- Extract tab bar colors from theme
local extract_tab_bar_colors_from_theme = function(theme_name)
  local wez_theme = wezterm.color.get_builtin_schemes()[theme_name]
  return {
    window_frame_colors = {
      active_titlebar_bg = wez_theme.background,
      inactive_titlebar_bg = wezterm.color.parse(wez_theme.background):darken(0.8),
    },
    tab_bar_colors = {
      inactive_tab_edge = wezterm.color.parse(wez_theme.background):darken(0.8),
      active_tab = {
        bg_color = wez_theme.brights[3],
        fg_color = wez_theme.background,
      },
      inactive_tab = {
        bg_color = wez_theme.background,
        fg_color = wez_theme.foreground,
      },
      inactive_tab_hover = {
        bg_color = wezterm.color.parse(wez_theme.background):lighten(0.1),
        fg_color = wezterm.color.parse(wez_theme.foreground):lighten(0.2),
      },
      new_tab = {
        bg_color = wez_theme.background,
        fg_color = wez_theme.foreground,
      },
      new_tab_hover = {
        bg_color = wez_theme.brights[3],
        fg_color = wez_theme.background,
      },
    },
  }
end

-- Theme settings
local tab_bar_theme = extract_tab_bar_colors_from_theme("nord")

-- Basic config
config = {
  hide_tab_bar_if_only_one_tab = true,
  force_reverse_video_cursor = true,
  leader = { key = 'z', mods = 'CTRL'},
  window_decorations = "RESIZE",
  window_close_confirmation = 'AlwaysPrompt',
  font = wezterm.font('JuliaMono', { weight = "Regular" }),
  send_composed_key_when_left_alt_is_pressed = true,

  keys = {
    { mods = "CMD", key = "LeftArrow",  action = action.SendKey({ mods = "CTRL", key = "a" }) },
    { mods = "CMD", key = "RightArrow", action = action.SendKey({ mods = "CTRL", key = "e" }) },
    { mods = "CMD", key = "Backspace",  action = action.SendKey({ mods = "CTRL", key = "u" }) },
    { mods = "CMD", key = "UpArrow",    action = action.ScrollToPrompt(-1) },
    { mods = "CMD", key = "DownArrow",  action = action.ScrollToPrompt(1) },
  },

  color_scheme = "nord",
  adjust_window_size_when_changing_font_size = false,
  window_frame = merge_tables({
    font = wezterm.font("FiraMono Nerd Font Mono", { weight = "ExtraBold" }),
  }, tab_bar_theme.window_frame_colors),

  colors = {
    tab_bar = tab_bar_theme.tab_bar_colors,
  },

  audible_bell = "Disabled",
}

-- Conditionally apply background image
if use_background_image then
  config.window_background_image = '/Users/pepe/Documentos/imagenes/ceive/cortegadaAzul.jpg'
  config.background = {
    {
      source = { File = '/Users/pepe/Documentos/imagenes/ceive/cortegadaAzul.jpg' },
      horizontal_align = 'Center',
      vertical_align = 'Middle',
    },
  }
  -- Optional: opacity tweak
  -- config.window_background_opacity = 0.9
end

return config

