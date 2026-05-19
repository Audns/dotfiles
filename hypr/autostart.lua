-- Exec once commands

hl.on("hyprland.start", function()
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("~/second/codespace/simple_project/Waybar/build/waybar")
  hl.exec_cmd("rustbox start -i \"4ef5c9cd-72f6-40d1-8048-7db76eb5882a\" -e 19")
  hl.exec_cmd("mako")
  hl.exec_cmd("fcitx5")
  hl.exec_cmd("luncher --daemon")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)
