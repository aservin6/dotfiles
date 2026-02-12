-- Pull in the wezterm API
local wezterm = require("wezterm")
local session_manager = require("wezterm-session-manager/session-manager")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.
wezterm.on("save_session", function(window)
	session_manager.save_state(window)
end)
wezterm.on("load_session", function(window)
	session_manager.load_state(window)
end)
wezterm.on("restore_session", function(window)
	session_manager.restore_state(window)
end)

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font = wezterm.font("JetBrains Mono Nerd Font")
config.font_size = 16
config.color_scheme = "nord"

config.window_background_opacity = 0.8
config.use_fancy_tab_bar = false
config.tab_max_width = 16
config.show_new_tab_button_in_tab_bar = false
config.show_tabs_in_tab_bar = false
config.enable_tab_bar = false

config.colors = {
	tab_bar = {
		background = "rgba(30, 30, 46, 0.8)", -- catppuccin mocha-like transparent bg
		inactive_tab = {
			bg_color = "#313244",
			fg_color = "#dfdfdf",
		},
	},
}

-- Keybinds
-- config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }
-- config.keys = {
-- 	-- splitting
-- 	{
-- 		mods = "LEADER",
-- 		key = "-",
-- 		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
-- 	},
-- 	{
-- 		mods = "LEADER",
-- 		key = "=",
-- 		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
-- 	},
--
-- 	-- zoom
-- 	{
-- 		mods = "LEADER",
-- 		key = "m",
-- 		action = wezterm.action.TogglePaneZoomState,
-- 	},
--
-- 	-- rotate panes
-- 	{
-- 		mods = "LEADER",
-- 		key = "Space",
-- 		action = wezterm.action.RotatePanes("Clockwise"),
-- 	},
-- 	-- show the pane selection mode, but have it swap the active and selected panes
-- 	{
-- 		mods = "LEADER",
-- 		key = "0",
-- 		action = wezterm.action.PaneSelect({
-- 			mode = "SwapWithActive",
-- 		}),
-- 	},
--
-- 	-- activate copy mode or vim mode
-- 	{
-- 		key = "Enter",
-- 		mods = "LEADER",
-- 		action = wezterm.action.ActivateCopyMode,
-- 	},
--
-- 	-- Pane navigation like vim (use CTRL + h/j/k/l)
-- 	{ key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Left") },
-- 	{ key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Down") },
-- 	{ key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up") },
-- 	{ key = "l", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Right") },
-- 	-- Close pane
-- 	{ key = "x", mods = "LEADER", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
-- 	-- New tab
-- 	{ key = "t", mods = "LEADER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
--
-- 	-- Alt+number to jump to tab by index
-- 	{ key = "1", mods = "ALT", action = wezterm.action.ActivateTab(0) },
-- 	{ key = "2", mods = "ALT", action = wezterm.action.ActivateTab(1) },
-- 	{ key = "3", mods = "ALT", action = wezterm.action.ActivateTab(2) },
-- 	{ key = "4", mods = "ALT", action = wezterm.action.ActivateTab(3) },
-- 	{ key = "5", mods = "ALT", action = wezterm.action.ActivateTab(4) },
-- 	{ key = "6", mods = "ALT", action = wezterm.action.ActivateTab(5) },
-- 	{ key = "7", mods = "ALT", action = wezterm.action.ActivateTab(6) },
-- 	{ key = "8", mods = "ALT", action = wezterm.action.ActivateTab(7) },
-- 	{ key = "9", mods = "ALT", action = wezterm.action.ActivateTab(8) },
--
-- 	-- Change tab name
-- 	{
-- 		key = ",",
-- 		mods = "LEADER",
-- 		action = wezterm.action.PromptInputLine({
-- 			description = "Enter new name for tab",
-- 			action = wezterm.action_callback(function(window, _, line)
-- 				if line then
-- 					window:active_tab():set_title(line)
-- 				end
-- 			end),
-- 		}),
-- 	},
--
-- 	-- Attach to muxer
-- 	{
-- 		key = "a",
-- 		mods = "LEADER",
-- 		action = wezterm.action.AttachDomain("unix"),
-- 	},
--
-- 	-- Detach from muxer
-- 	{
-- 		key = "d",
-- 		mods = "LEADER",
-- 		action = wezterm.action.DetachDomain({ DomainName = "unix" }),
-- 	},
--
-- 	-- Rename current session; analagous to command in tmux
-- 	{
-- 		key = "$",
-- 		mods = "LEADER|SHIFT",
-- 		action = wezterm.action.PromptInputLine({
-- 			description = "Enter new name for session",
-- 			action = wezterm.action_callback(function(window, pane, line)
-- 				if line then
-- 					wezterm.mux.rename_workspace(window:mux_window():get_workspace(), line)
-- 				end
-- 			end),
-- 		}),
-- 	},
--
-- 	-- Show list of workspaces
-- 	{
-- 		key = "s",
-- 		mods = "LEADER",
-- 		action = wezterm.action.ShowLauncherArgs({ flags = "WORKSPACES" }),
-- 	},
--
-- 	-- Session manager bindings
-- 	{
-- 		key = "s",
-- 		mods = "LEADER|SHIFT",
-- 		action = wezterm.action({ EmitEvent = "save_session" }),
-- 	},
-- 	{
-- 		key = "L",
-- 		mods = "LEADER|SHIFT",
-- 		action = wezterm.action({ EmitEvent = "load_session" }),
-- 	},
-- 	{
-- 		key = "R",
-- 		mods = "LEADER|SHIFT",
-- 		action = wezterm.action({ EmitEvent = "restore_session" }),
-- 	},
-- }
--
-- -- Sessions
-- config.unix_domains = {
-- 	{
-- 		name = "unix",
-- 	},
-- }

-- Finally, return the configuration to wezterm:
return config
