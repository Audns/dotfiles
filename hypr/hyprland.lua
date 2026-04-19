local home = os.getenv("AUDNS_DOT")or""

require("bindings")
require("autostart")
require("decoration")
require("input")
require("monitors")
require("windowrule")

-- Cursor Settings
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Qt Settings
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_SCALE_FACTOR", "1.0")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

-- GTK & General
hl.env("GTK_THEME", "Adwaita:dark")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- NVIDIA Specifics
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("_GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")
