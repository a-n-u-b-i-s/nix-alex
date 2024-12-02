local wezterm = require("wezterm")
local scheme = wezterm.get_builtin_color_schemes()["tokyonight_night"]

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

function basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

function convert_home_dir(path)
	local cwd = path
	local home = os.getenv("HOME")
	cwd = cwd:gsub("^" .. home .. "/", "~/")
	if cwd == "" then
		return path
	end
	return cwd
end

function convert_useful_path(dir)
	local cwd = convert_home_dir(dir)
	return basename(cwd)
end

-- selene: allow(unused_variable)
---@diagnostic disable-next-line: unused-local
local function create_tab_title(tab, tabs, panes, config, hover, max_width)
	local user_title = tab.active_pane.user_vars.panetitle
	if user_title ~= nil and #user_title > 0 then
		return tab.tab_index + 1 .. ":" .. user_title
	end
	-- pane:get_foreground_process_info().status

	local title = wezterm.truncate_right(basename(tab.active_pane.foreground_process_name), max_width)
	if title == "" then
		local dir = string.gsub(tab.active_pane.title, "(.*[: ])(.*)]", "%2")
		dir = convert_useful_path(dir)
		title = wezterm.truncate_right(dir, max_width)
	end

	local copy_mode, n = string.gsub(tab.active_pane.title, "(.+) mode: .*", "%1", 1)
	if copy_mode == nil or n == 0 then
		copy_mode = ""
	else
		copy_mode = copy_mode .. ": "
	end
	return copy_mode .. tab.tab_index + 1 .. ":" .. title
	-- return tab.tab_id .. ""
end

---------------------------------------------------------------
--- wezterm on
---------------------------------------------------------------
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = create_tab_title(tab, tabs, panes, config, hover, max_width)

	-- selene: allow(undefined_variable)
	local solid_left_arrow = ""
	-- selene: allow(undefined_variable)
	local solid_right_arrow = ""
	-- https://github.com/wez/wezterm/issues/807
	-- local edge_background = scheme.background
	-- https://github.com/wez/wezterm/blob/61f01f6ed75a04d40af9ea49aa0afe91f08cb6bd/config/src/color.rs#L245
	local edge_background = "#2e3440"
	local background = scheme.ansi[1]
	local foreground = scheme.ansi[5]

	if tab.is_active then
		background = scheme.brights[1]
		foreground = scheme.brights[8]
	elseif hover then
		background = scheme.cursor_bg
		foreground = scheme.cursor_fg
	end
	local edge_foreground = background

	return {
		-- { Attribute = { Intensity = "Bold" } },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = solid_left_arrow },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = " " .. title .. " " },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = solid_right_arrow },
		{ Attribute = { Intensity = "Normal" } },
	}
end)

-- config.font = wezterm.font({
-- 	family = "BerkeleyMonoVariable Nerd Font",
-- 	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
-- })
config.font_size = 14.0
-- config.font_shaper = "Harfbuzz"
config.line_height = 1.0
config.color_scheme = "tokyonight_night"
config.colors = {
	tab_bar = {
		background = "#1f2335",
	},
}
config.check_for_updates = false
config.term = "wezterm"
config.scrollback_lines = 999999
config.hyperlink_rules = {}
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.adjust_window_size_when_changing_font_size = false
config.warn_about_missing_glyphs = false
config.selection_word_boundary = " \t\n{}[]()\"'`"
config.window_padding = {
	left = "1cell",
	right = "1cell",
	top = "0.4cell",
	bottom = "0",
}
config.term = "xterm-256color"
config.default_cursor_style = "SteadyBar"
config.keys = {
	{
		key = "k",
		mods = "CMD",
		action = wezterm.action.ClearScrollback("ScrollbackAndViewport"),
	},
	{
		key = "E",
		mods = "CTRL|SHIFT",
		action = wezterm.action.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}
config.window_background_opacity = 0.75
config.macos_window_background_blur = 75
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.use_fancy_tab_bar = false

config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"

return config
