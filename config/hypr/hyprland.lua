-- Hyprland Lua config — converted from hyprland.conf
-- v1 animation style: subtle bezier, no extra bounce

-- ── Programs ──────────────────────────────────────────
local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "fuzzel"
local mainMod     = "SUPER"

-- ── Environment ──────────────────────────────────────
hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("QT_FONTFAMILY", "Cool jazz")
hl.env("GTK_THEME", "catppuccin-mocha-blue-standard+default")
hl.env("GTK_ICON_THEME", "Tela circle dracula")

-- ── Monitor ──────────────────────────────────────────
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 1,
})

-- ── Autostart ────────────────────────────────────────
hl.on("hyprland.start", function()
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("/home/prateek/.local/bin/hyprpaper-start")
    hl.exec_cmd("systemctl --user start nexex.service")
    hl.exec_cmd("/home/prateek/.local/bin/clipwatch.sh")
    hl.exec_cmd("wayneko --type neko --layer overlay --follow-pointer true &")
    hl.exec_cmd("quickshell --config spotlight --daemonize")
end)

-- ── General settings ─────────────────────────────────
hl.config({
    general = {
        gaps_in         = 0,
        gaps_out        = 0,
        border_size     = 2,
        resize_on_border = true,
        allow_tearing   = false,
        layout          = "dwindle",
        col = {
            active_border   = "rgba(595959aa)",
            inactive_border = "rgba(595959aa)",
        },
    },

    decoration = {
        rounding       = 0,
        rounding_power = 2,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 2,
            color        = 0xee1a1a1a,
        },
        blur = {
            enabled   = true,
            size      = 8,
            passes    = 3,
            new_optimizations = true,
            ignore_opacity = false,
            vibrancy  = 0.1696,
        },
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
    },

    cursor = {
        no_warps = true,
    },

    animations = {
        enabled = true,
    },

    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",
        follow_mouse = 1,
        sensitivity  = 0,
        touchpad = {
            natural_scroll = false,
        },
    },
})

-- ── Gestures ─────────────────────────────────────────
hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})

-- ── Curves & Animations ──────────────────────────────
-- v1: single myBezier for all window anims (open/close/resize/move)
hl.curve("myBezier", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })
-- Smooth for fades/border
hl.curve("smooth", { type = "bezier", points = { {0.25, 0.15}, {0.25, 1} } })

-- Fluid spring for resize (windows = move/resize)
hl.curve("fluid", { type = "spring", mass = 1, stiffness = 30, dampening = 18 })
hl.animation({ leaf = "windows",    enabled = true, speed = 2, spring = "fluid" })
-- v1 bezier for open/close
hl.animation({ leaf = "windowsIn",  enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })
hl.animation({ leaf = "border",     enabled = true, speed = 4, bezier = "smooth" })
hl.animation({ leaf = "fade",       enabled = true, speed = 4, bezier = "smooth" })
hl.animation({ leaf = "fadeIn",     enabled = true, speed = 4, bezier = "smooth" })
hl.animation({ leaf = "fadeOut",    enabled = true, speed = 3, bezier = "smooth" })

-- ── Keybinds ─────────────────────────────────────────
-- Apps
hl.bind(mainMod .. " + Q", function() hl.exec_cmd(terminal) end)
-- hl.bind(mainMod .. " + SPACE", function() hl.exec_cmd("/home/prateek/ex9/ex9-launcher") end) -- removed ex9
hl.bind(mainMod .. " + E", function() hl.exec_cmd(fileManager) end)
hl.bind(mainMod .. " + L", function() hl.exec_cmd("hyprlock") end)
hl.bind("ALT + SPACE", function() hl.exec_cmd("/home/prateek/projects/spotlight/toggle-spotlight") end)
hl.bind(mainMod .. " + P", function() hl.exec_cmd("/home/prateek/.local/bin/ocr-screen") end)
hl.bind(mainMod .. " + F1", function() hl.exec_cmd("/home/prateek/.local/bin/toggle-touchpad") end)

-- Window management
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- Exit
hl.bind(mainMod .. " + M", function() hl.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit") end)

-- Focus movement
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Workspace switching + move window to workspace
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Drag / resize with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Middle click close
hl.bind("mouse:274", hl.dsp.window.close())

-- Multimedia keys (locked = works when locked, repeating = held)
hl.bind("XF86AudioRaiseVolume", function() hl.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+") end, { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", function() hl.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-") end,      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        function() hl.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle") end,     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     function() hl.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle") end,   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  function() hl.exec_cmd("brightnessctl -e4 -n2 set 5%+") end,                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",function() hl.exec_cmd("brightnessctl -e4 -n2 set 5%-") end,                  { locked = true, repeating = true })

-- Playerctl (locked only)
hl.bind("XF86AudioNext",  function() hl.exec_cmd("playerctl next") end,       { locked = true })
hl.bind("XF86AudioPause", function() hl.exec_cmd("playerctl play-pause") end, { locked = true })
hl.bind("XF86AudioPlay",  function() hl.exec_cmd("playerctl play-pause") end, { locked = true })
hl.bind("XF86AudioPrev",  function() hl.exec_cmd("playerctl previous") end,   { locked = true })

-- Screenshots (Lua callbacks instead of hl.dsp.exec_cmd)
hl.bind("Print", function() hl.exec_cmd("/home/prateek/.local/bin/screenshot full") end)
hl.bind("SHIFT + Print", function() hl.exec_cmd("/home/prateek/.local/bin/screenshot region") end)
hl.bind("SHIFT + ALT + Print", function() hl.exec_cmd("/home/prateek/.local/bin/screenshot window") end)

-- Custom scripts
hl.bind("SUPER + TAB",          function() hl.exec_cmd("qs ipc -p /usr/local/share/nexex call overview toggle") end)
hl.bind(mainMod .. " + G",      function() hl.exec_cmd("/home/prateek/.local/bin/toggle-gaps") end)
hl.bind(mainMod .. " + B",      function() hl.exec_cmd("/home/prateek/.local/bin/toggle-shader") end)
hl.bind("ALT + B",              function() hl.exec_cmd("/home/prateek/.local/bin/toggle-eink") end)
hl.bind(mainMod .. " + W",      function() hl.exec_cmd("/home/prateek/.local/bin/nexland-wallpaper-shift") end)
hl.bind(mainMod .. " + F",      function() hl.exec_cmd("qs ipc --config spotlight call spotlight toggle") end)

-- ── Window Rules ─────────────────────────────────────
hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name  = "float-cava-htop",
    match = {
        class = "kitty",
        title = "(cava|htop|btop|nvtop)",
    },
    float = true,
})

-- ── Device config (example) ──────────────────────────
-- hl.device({
--     name        = "epic-mouse-v1",
--     sensitivity = -0.5,
-- })
