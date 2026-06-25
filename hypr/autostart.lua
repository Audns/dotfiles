-- Exec once commands

hl.on("hyprland.start", function()
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("~/second/codespace/Waybar/build/waybar")
  hl.exec_cmd("rustbox start")
  hl.exec_cmd("mako")
  hl.exec_cmd("fcitx5")
  hl.exec_cmd("luncher --daemon")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)
