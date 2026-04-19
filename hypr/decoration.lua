hl.config {
    ["general.gaps_in"] = 1,
    ["general.gaps_out"] = 0,
    ["general.border_size"] = 0,
    ["general.col.active_border"] = "rgba(333333ff)",
    ["general.col.inactive_border"] = "rgba(1c1c1cff)",
    ["general.resize_on_border"] = false,
    ["general.allow_tearing"] = false,
    ["general.layout"] = "dwindle",

    ["decoration.active_opacity"] = 1.0,
    ["decoration.inactive_opacity"] = 1.0,
    ["decoration.shadow.enabled"] = false,
    ["decoration.shadow.range"] = 4,
    ["decoration.shadow.render_power"] = 3,
    ["decoration.shadow.color"] = "rgba(1a1a1aee)",
    ["decoration.blur.enabled"] = false,
    ["decoration.blur.size"] = 3,
    ["decoration.blur.passes"] = 1,
    ["decoration.blur.vibrancy"] = 0.1696,

    ["animations.enabled"] = false,

    ["dwindle.preserve_split"] = true,

    ["master.new_status"] = "master",

    ["misc.force_default_wallpaper"] = -1,
    ["misc.disable_hyprland_logo"] = true,
    ["misc.disable_splash_rendering"] = true,

    ["ecosystem.no_update_news"] = true,
}

-- Animation bezier curves
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Animations
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear" })
