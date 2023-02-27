killall -9 xwinwrap

wp1=$(cat /home/will/.config/xwinwrap/custom1)
wp2=$(cat /home/will/.config/xwinwrap/custom2)

# RL
# xwinwrap -g 3840x1080+0+0 -un -fdt -ni -b -nf -ov -- /home/will/.config/xwinwrap/wallpaper-live WID $wp &

# Waves
xwinwrap -g 1920x1080+0+0 -un -fdt -ni -b -nf -ov -- /home/will/.config/xwinwrap/wallpaper-live WID $wp2 &
xwinwrap -g 1920x1080+1920+0 -un -fdt -ni -b -nf -ov -- /home/will/.config/xwinwrap/wallpaper-live WID $wp1 &
