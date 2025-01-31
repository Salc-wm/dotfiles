local wezterm = require('wezterm')

-- local _funcs  = require('scpts_wezterm.foo')
-- local _colors = require('scpts_wezterm.colors')

local _colors = {
    -- Background colors
    window_background = {
        black = '#0a0a0a',
        black_gray = '#0a0a0b',

        color = '#0b0022'
    },

    -- Tab title
    tab = {
        edge_background = '#0b0022',
        background = {
            default = '#1b1032',
            active = '#15131a',
            hover = '#3b3052'
        },
        foreground = {
            default = '#2f2e2e',
            active = '#c0c0c0',
            hover = '#909090'
        }
    },

    -- Bar
    bar = {
        stat_color = {
            default = '#f92a51',
            active_key = '#0a7cbf',
            leader_active = '#bb9af7'
        }, foreground_item = '#f19c21'
    }
}

local _Basename = function(s)
    return string.gsub(s, '(.*[/\\])(.*)', '%2')
end

local _Tab_title = function(tab_info)
    local title = tab_info.tab_title

    -- if the tab title is explicitly set, take that
    if title and #title > 0 then
        return title
    end

    -- Otherwise, use the title from the active pane
    return tab_info.active_pane.title  -- in that tab
end

-- * IMP!
local act, mux = wezterm.action,
                 wezterm.mux

local config = {} if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- * CONFIG!
config.default_cwd  = 'C:/Users/Admin/__'
config.default_prog = {'pwsh', '-l', "-NoLogo"}

config.front_end = "OpenGL"
config.term = "xterm-256color"
config.default_cursor_style = "BlinkingBlock"

config.max_fps = 165
config.initial_cols = 80
config.animation_fps = 1
config.cursor_blink_rate = 500

-- VARS!!
local _nerdfonts = wezterm.nerdfonts

local background = _colors.window_background
local tab_color, status_bar = _colors.tab, _colors.bar

-- Colors...
config.color_scheme = 'Lavandula'
config.colors = {
    tab_bar =
    {
        background = background.color,

        -- The active tab is the one that has focus in the window
        active_tab = {
            bg_color = '#2b2042',  -- The color of the background area for the tab
            fg_color = '#c0c0c0',  -- The color of the text for the tab

            -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
            -- label shown for this tab. The default is "Normal"
            intensity = 'Normal',

            -- Specify whether you want "None", "Single" or "Double" underline for
            -- label shown for this tab. The default is "None"
            underline = 'None',

            -- Specify whether you want the text to be italic (true) or not (false)
            italic = true  -- for this tab. The default is false.
        },

        inactive_tab = {  -- Inactive tabs are the tabs that do not have focus
            bg_color = '#1b1032',
            fg_color = '#808080'
        },

        -- You can configure some alternate styling when the mouse pointer
        inactive_tab_hover = {  -- moves over inactive tabs.
            bg_color = '#3b3052',
            fg_color = '#909090',
            italic = true
        },

        -- The new tab button that let you create new tabs
        new_tab = {
            bg_color = '#1b1032',
            fg_color = '#808080'
        },

        -- You can configure some alternate styling when the mouse pointer
        new_tab_hover = {  -- moves over the new tab button
            bg_color = '#3b3052',
            fg_color = '#909090',
            italic = true
        }
    }
}

-- Fonts...
config.font_size = 16
-- config.font = wezterm.font('CaskaydiaMono Nerd Font Mono', {weight="Regular", stretch='Normal', style=Normal})

-- Window...
config.window_decorations = 'RESIZE'
config.window_close_confirmation = 'AlwaysPrompt'
config.window_background_gradient = {
    orientation = 'Horizontal',  -- Can be "Vertical" or "Horizontal". Specifies the direction
    colors = {
        background.black,
        background.black_gray,

        background.black,
        background.black_gray,

        background.black,
        background.black_gray,

        background.black
    },

    -- Instead of specifying `colors`, you can use one of a number of
    -- predefined, preset gradients. A list of presets is shown in a section below.
    -- preset = "Warm",

    -- Specifies the interpolation style to be used.
    interpolation = 'CatmullRom',  -- "Linear", "Basis" and "CatmullRom" as supported.

    -- How the colors are blended in the gradient.
    blend = 'Rgb',  -- "Rgb", "LinearRgb", "Hsv" and "Oklab" are supported.

    segment_size = 16,
    segment_smoothness = 1.0
}

-- Dim inactive panes
config.inactive_pane_hsb = {saturation = 0.24, brightness = 0.5}

-- Tab bar
config.use_fancy_tab_bar, config.tab_bar_at_bottom = false, true
config.status_update_interval = 1000
config.tab_max_width = 11

-- The filled in variant of the < symbol | filled in variant of the > symbol
local SOLID_LEFT_ARROW  = _nerdfonts.ple_flame_thick_mirrored
local SOLID_RIGHT_ARROW = _nerdfonts.ple_flame_thick

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local color_tab = {tab_color.background, tab_color.foreground}
    local background, foreground = color_tab[1], color_tab[2]

    local backgroundState = background.default
    local foregroundState = foreground.default

    if tab.is_active then
        backgroundState, foregroundState = background.active, foreground.active
    elseif hover then
        backgroundState, foregroundState = background.hover, foreground.hover
    end

    local edge_foreground = backgroundState
    local title = _Tab_title(tab)

    -- Ensure that the titles fit in the available space,
    title = wezterm.truncate_right(title, max_width - 5)  -- and that we have room for the edges.

    return {
        {Background = {Color = tab_color.edge_background}},
        {Foreground = {Color = edge_foreground}},
        {Text = SOLID_LEFT_ARROW},

        {Background = {Color = backgroundState}},
        {Foreground = {Color = foregroundState}},
        {Text = title},

        {Background = {Color = tab_color.edge_background}},
        {Foreground = {Color = edge_foreground}},
        {Text = SOLID_RIGHT_ARROW}
    }
end)

wezterm.on('update-status', function(window, pane)
    local status_color = status_bar.stat_color

    -- Workspace name
    local stat = window:active_workspace()
    local stat_color = status_color.default

    -- It's a little silly to have workspace name all the time
    -- Utilize this to display LDR or current key table name
    if window:active_key_table() then
        stat = window:active_key_table()
        stat_color = status_color.active_key
    end

    if window:leader_is_active() then
        stat = 'LDR'
        stat_color = status_color.leader_active
    end

    -- CWD and CMD could be nil (e.g. viewing log using Ctrl-Alt-l). Not a big deal, but check in case
    local cwd = pane:get_current_working_dir()
    local cmd = pane:get_foreground_process_name()

    cwd = cwd and _Basename(cwd) or ''
    cmd = cmd and _Basename(cmd):match('(.*)%.(.*)') or ''  -- Current command

    -- Time
    local time = wezterm.strftime('%H:%M')

    -- Left status (left of the tab line)
    window:set_left_status(wezterm.format({
        {Foreground = {Color = stat_color}},
        {Text = ' '},
        {Text = _nerdfonts.weather_small_craft_advisory .. ' ' .. stat},
        {Text = _nerdfonts.oct_chevron_right}
    }))

    window:set_right_status(wezterm.format({  -- Right status
        {Text = _nerdfonts.pom_away .. ' ( ͡o ͜ʖ ͡o)' .. cwd},
        {Text = '| '},
        {Foreground = {Color = status_bar.foreground_item}},
        {Text = _nerdfonts.md_zip_disk .. ' ' .. cmd}, 'ResetAttributes',
        {Text = ' | '},
        {Text = _nerdfonts.fa_clock_o .. ' ' .. time}
    }))
end)

-- Outhers...
config.default_workspace = 'Home'

return config
