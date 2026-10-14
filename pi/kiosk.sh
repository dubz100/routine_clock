#!/usr/bin/env bash
# Launch the Morning Path Clock full screen on the Raspberry Pi.
# #kiosk hides the demo bar and uses the real time.
set -euo pipefail
DIR="$(cd "$(dirname "$0")/.." && pwd)"
URL="file://$DIR/prototype/index.html#kiosk"

# Chromium is called chromium on recent Raspberry Pi OS and chromium-browser on older releases.
BROWSER="$(command -v chromium || command -v chromium-browser)"

exec "$BROWSER" \
  --kiosk "$URL" \
  --noerrdialogs --disable-infobars --no-first-run \
  --disable-session-crashed-bubble --disable-features=Translate \
  --autoplay-policy=no-user-gesture-required \
  --check-for-update-interval=31536000
