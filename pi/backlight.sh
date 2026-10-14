#!/usr/bin/env bash
# Set the display backlight as a percentage: backlight.sh 5   or   backlight.sh 100
# Works when the display exposes /sys/class/backlight (Touch Display 2 normally does).
#
# Dim at bedtime and brighten at wake-up with root's crontab (sudo crontab -e):
#   30 19 * * *   /home/pi/routine_clock/pi/backlight.sh 5
#   40 6  * * 1-5 /home/pi/routine_clock/pi/backlight.sh 100
#   55 6  * * 0,6 /home/pi/routine_clock/pi/backlight.sh 100
# (Change the path to match your user. The weekend line matches a 07:00 weekend wake.)
set -euo pipefail
PCT="${1:?usage: backlight.sh <percent>}"
for dev in /sys/class/backlight/*; do
  [ -e "$dev/max_brightness" ] || continue
  max=$(cat "$dev/max_brightness")
  val=$(( max * PCT / 100 ))
  [ "$val" -lt 1 ] && [ "$PCT" -gt 0 ] && val=1
  echo "$val" > "$dev/brightness"
  echo "$(basename "$dev"): $val / $max"
done
