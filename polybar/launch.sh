#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar main 2>&1 | tee -a /tmp/polybar1.log & disown
polybar side1 2>&1 | tee -a /tmp/polybar2.log & disown
polybar side2 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."

## Terminate already running bar instances
#killall -q polybar
#
## Wait until the processes have been shut down
#while pgrep -x polybar >/dev/null; do sleep 1; done
#
#if type "xrandr"; then
#  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#      MONITOR=$m polybar --reload main &
#      MONITOR=$m polybar --reload side &
#  done
#else
#  polybar --reload example &
#fi

