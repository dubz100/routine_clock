#!/usr/bin/env bash
# Add the clock to the desktop autostart. Supports labwc (current Raspberry Pi OS)
# and wayfire (earlier Bookworm images).
set -euo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"
chmod +x "$DIR/kiosk.sh"

if command -v labwc >/dev/null 2>&1; then
  mkdir -p ~/.config/labwc
  touch ~/.config/labwc/autostart
  grep -q "kiosk.sh" ~/.config/labwc/autostart || echo "$DIR/kiosk.sh &" >> ~/.config/labwc/autostart
  echo "Added to ~/.config/labwc/autostart"
elif [ -f ~/.config/wayfire.ini ]; then
  if ! grep -q "kiosk.sh" ~/.config/wayfire.ini; then
    grep -q "^\[autostart\]" ~/.config/wayfire.ini || printf '\n[autostart]\n' >> ~/.config/wayfire.ini
    sed -i "/^\[autostart\]/a routine_clock = $DIR/kiosk.sh" ~/.config/wayfire.ini
  fi
  echo "Added to ~/.config/wayfire.ini"
else
  mkdir -p ~/.config/autostart
  cat > ~/.config/autostart/routine-clock.desktop <<DESKTOP
[Desktop Entry]
Type=Application
Name=Morning Path Clock
Exec=$DIR/kiosk.sh
DESKTOP
  echo "Added ~/.config/autostart/routine-clock.desktop"
fi
echo "Reboot to start the clock automatically."
