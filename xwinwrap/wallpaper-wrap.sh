killall -9 xwinwrap

wp=$(cat /home/will/.config/xwinwrap/wallpaper-save)

# RL
xwinwrap -g 3840x1080+0+0 -un -fdt -ni -b -nf -ov -- /home/will/.config/xwinwrap/wallpaper-live WID $wp &
