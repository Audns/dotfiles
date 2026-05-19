local terminal = "ghostty"
local dotfiles = os.getenv("HOME") .. "/dotfiles"

-- Function to get the highest workspace ID
local function getLastWorkspaceId()
    local workspaces = hl.get_workspaces()
    local max_id = 0

    for _, ws in ipairs(workspaces) do
        if ws.id and ws.id > max_id then
            max_id = ws.id
        end
    end

    return max_id
end

-- Focus the last/highest numbered workspace
hl.bind("SUPER + D", function()
    local id = getLastWorkspaceId()
    if id > 0 then
        hl.dispatch(hl.dsp.focus({ workspace = id }))
    end
end)

-- Move window to the last/highest numbered workspace
hl.bind("SUPER + SHIFT + D", function()
    local id = getLastWorkspaceId()
    if id > 0 then
        hl.dispatch(hl.dsp.window.move({ workspace = id }))
    end
end)

---------------------------------

hl.bind("SUPER + A", hl.dsp.focus({ workspace = "empty" }))
hl.bind("SUPER + SHIFT + A", hl.dsp.window.move({workspace = "empty"}))
hl.bind("SUPER + B", hl.dsp.exec_cmd("zen-browser"))
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + C", hl.dsp.window.kill())
hl.bind("SUPER + E", hl.dsp.focus({workspace = "previous"}))
hl.bind("SUPER + F", hl.dsp.exec_cmd("luncher -m launcher"))
hl.bind("SUPER + G", hl.dsp.exec_cmd(dotfiles .. "/hypr/script/tmuxpayload.sh"))
hl.bind("SUPER + M", hl.dsp.window.fullscreen({
  mode = "maximized",
  action = "toggle",
}))
hl.bind("SUPER + SHIFT + M", hl.dsp.window.fullscreen({
  mode = "fullscreen",
  action = "toggle",
}))
hl.bind("SUPER + N", hl.dsp.exec_cmd("luncher -m switcher"))
hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd("luncher -m switcher --pull"))
hl.bind("SUPER + Q", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + R", hl.dsp.exec_cmd("thunar ~"))
hl.bind("SUPER + T", hl.dsp.layout("togglesplit"))
hl.bind("SUPER + ALT + H", hl.dsp.window.swap({ direction = "l" }))
hl.bind("SUPER + ALT + L", hl.dsp.window.swap({ direction = "r" }))
hl.bind("SUPER + ALT + K", hl.dsp.window.swap({ direction = "u" }))
hl.bind("SUPER + ALT + J", hl.dsp.window.swap({ direction = "d" }))
hl.bind("SUPER + U", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + V", hl.dsp.window.float({action = "toggle"}))
hl.bind("SUPER + X", hl.dsp.exec_cmd("brave --disable-features=WaylandWindowDecorations"))
hl.bind("SUPER + SHIFT + U", hl.dsp.exec_cmd(dotfiles .. "/hypr/script/lock_and_suspend.sh"))
hl.bind("SUPER + Z", hl.dsp.exec_cmd("luncher"))
hl.bind("SUPER + SLASH", hl.dsp.exec_cmd(dotfiles .. "/hypr/script/sort.sh"))
hl.bind("SUPER + BACKSLASH", hl.dsp.exec_cmd("keepassxc"))
hl.bind("SUPER + W", hl.dsp.exec_cmd("luncher -m clipboard"))
hl.bind("SUPER + SHIFT + ESCAPE", hl.dsp.exit())

-- Move focus bindings
hl.bind("SUPER + LEFT",  hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + H",     hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + RIGHT", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + L",     hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + UP",    hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + K",     hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + DOWN",  hl.dsp.focus({ direction = "d" }))
hl.bind("SUPER + J",     hl.dsp.focus({ direction = "d" }))

-- Workspace number bindings
hl.bind("SUPER + 1", hl.dsp.focus({workspace = 1}))
hl.bind("SUPER + 2", hl.dsp.focus({workspace = 2}))
hl.bind("SUPER + 3", hl.dsp.focus({workspace = 3}))
hl.bind("SUPER + 4", hl.dsp.focus({workspace = 4}))
hl.bind("SUPER + 5", hl.dsp.focus({workspace = 5}))
hl.bind("SUPER + 6", hl.dsp.focus({workspace = 6}))
hl.bind("SUPER + 7", hl.dsp.focus({workspace = 7}))
hl.bind("SUPER + 8", hl.dsp.focus({workspace = 8}))
hl.bind("SUPER + 9", hl.dsp.focus({workspace = 9}))
hl.bind("SUPER + 0", hl.dsp.focus({workspace = 10}))

-- Move to workspace bindings
hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({workspace = 1}))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({workspace = 2}))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({workspace = 3}))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({workspace = 4}))
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({workspace = 5}))
hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move({workspace = 6}))
hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move({workspace = 7}))
hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({workspace = 8}))
hl.bind("SUPER + SHIFT + 9", hl.dsp.window.move({workspace = 9}))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({workspace = 10}))

-- Special workspace
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special({name = "magic"}))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({workspace = "special:magic"}))

-- Mouse workspace scrolling
hl.bind("SUPER + mouse_down", hl.dsp.focus({workspace = "e-1"}))
hl.bind("SUPER + mouse_up", hl.dsp.focus({workspace = "e+1"}))

-- Ctrl+Alt workspace switching
hl.bind("CTRL + ALT + LEFT", hl.dsp.focus({workspace = "e-1"}))
hl.bind("CTRL + ALT + RIGHT", hl.dsp.focus({workspace = "e+1"}))

-- Tab/grave workspace switching
hl.bind("SUPER + TAB", hl.dsp.focus({workspace = "e+1"}))
hl.bind("SUPER + GRAVE", hl.dsp.focus({workspace = "e-1"}))
hl.bind("SUPER + SHIFT + J", hl.dsp.focus({workspace = "e+1"}))
hl.bind("SUPER + SHIFT + K", hl.dsp.focus({workspace = "e-1"}))

-- Move windows between monitors
hl.bind("SUPER + SHIFT + L", hl.dsp.exec_cmd(dotfiles .. "/hypr/script/move_next.sh"))
hl.bind("SUPER + SHIFT + H", hl.dsp.exec_cmd(dotfiles .. "/hypr/script/move_pre.sh"))

-- Mouse bindings
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), {mouse = true})
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), {mouse = true})

-- Resize active window bindings
hl.bind("SUPER + CTRL + L", hl.dsp.window.resize({ x = 20, y = 0,   relative = true }), { repeating = true })
hl.bind("SUPER + CTRL + H", hl.dsp.window.resize({ x = -20, y = 0,  relative = true }), { repeating = true })
hl.bind("SUPER + CTRL + J", hl.dsp.window.resize({ x = 0,   y = 20, relative = true }), { repeating = true })
hl.bind("SUPER + CTRL + K", hl.dsp.window.resize({ x = 0,   y = -20, relative = true }), { repeating = true })

-- Media keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

-- Screenshot bindings
hl.bind("CTRL + Print", hl.dsp.exec_cmd("FILE=$HOME/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png && grim -g \"$(slurp)\" $FILE && wl-copy < $FILE && notify-send \"Screenshot\" \"Screenshot Saved & Copied\""))
hl.bind("Print", hl.dsp.exec_cmd("FILE=$HOME/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png && grim $FILE && wl-copy < $FILE && notify-send \"Full Screenshot\" \"Screenshot Saved & Copied\""))
