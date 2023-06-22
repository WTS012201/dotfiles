#!/usr/bin/env bash
killall polybar

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
sleep 3
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar main 2>&1 | tee -a /tmp/polybar1.log & disown
polybar side1 2>&1 | tee -a /tmp/polybar2.log & disown
polybar side2 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."

