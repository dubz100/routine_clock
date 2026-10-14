# Hardware, power and safety

The aim is a clock that lives on a shelf in the children's room overnight (on charge), and
can be carried downstairs in the morning on battery. It charges over USB-C and is safe for
3 and 4 year olds to touch and carry around.

> Product specs change. Check the current datasheet for anything below before you buy.

---

## 1. Parts

| Part | Notes |
|---|---|
| Raspberry Pi 4 Model B (you have it) | 2 GB is plenty |
| Raspberry Pi Touch Display 2, 7" (you have it) | 720×1280, natively portrait. Connects by DSI ribbon and takes 5 V from the Pi's GPIO header. Use the Pi 4 cable from the box. |
| **UPS / battery board with USB-C charging** | Recommended: a Pi-specific UPS such as the **PiSugar 3 Plus** (≈5000 mAh LiPo, USB-C in, works with Pi 4B, built-in real-time clock, protection circuits). It must do **pass-through charging**, so the Pi keeps running when you plug in or unplug. |
| Official Raspberry Pi 15 W USB-C power supply | For docking and charging. Plugs into the UPS's USB-C input. |
| Small speaker | The Pi 4 and Touch Display 2 have no speaker. Use a small USB-powered speaker, or a MAX98357A I2S amp board with a 3 W speaker *inside* the case. |
| Heatsink | Stick-on aluminium heatsinks or a heatsink plate. The case is closed, so this matters. |
| Enclosure | See §3. 3D-printed PETG/ASA, or a bought Touch Display 2 case with an enclosed back. |
| microSD card, 16–32 GB, A1 rated | Raspberry Pi OS with desktop (64-bit) |

### Why a UPS board instead of a normal power bank?
- Most power banks briefly cut their output when you plug the charger in or pull it out.
  The Pi reboots every time.
- Many power banks go to sleep when the current is low.
- A Pi UPS board is designed for exactly this: it charges from USB-C while powering the Pi,
  switches over without a gap, and reports battery level.
- Boards like the PiSugar include a **real-time clock (RTC)**. The Pi 4 has none, so after a
  power loss without Wi-Fi it doesn't know the time. For an okay-to-wake clock, a wrong time
  is a real failure.

If you do use an off-the-shelf power bank, choose one sold by a reputable retailer, with
UKCA/CE marking, a 5 V / 3 A USB-C output and pass-through charging. Test unplugging and
replugging it before trusting it overnight.

### Battery life (rough estimate)
| Load | Power |
|---|---|
| Pi 4 idle, Wi-Fi on, Chromium showing a mostly static page | ~3 W |
| Touch Display 2 backlight at full / dimmed | ~1.5–2 W / ~0.5 W |
| Total in the morning | **~4.5–5 W** |

5000 mAh × 3.7 V ≈ 18.5 Wh, minus conversion losses gives about **2.5–3 hours** of
portable use. The morning needs about an hour, so this is comfortable. Dock it at night.

Ways to stretch it (`/boot/firmware/config.txt`):
```ini
arm_freq=1000          # underclock: runs cooler, uses less power, still smooth for this page
dtoverlay=disable-bt   # Bluetooth not needed
```
Dimming the backlight at night (see `pi/backlight.sh`) saves the most.

---

## 2. Software setup

1. Flash **Raspberry Pi OS with desktop (64-bit)** with Raspberry Pi Imager. Set Wi-Fi, a
   user and the timezone (Europe/London) in the Imager settings.
2. Rotate the display to landscape. Touch Display 2 is portrait by default. Use
   *Screen Configuration* in the desktop, or follow Raspberry Pi's Touch Display 2 docs for
   the `video=DSI-1:...,rotate=` kernel setting. The prototype also works in portrait.
3. Install emoji and clone the project:
   ```bash
   sudo apt update && sudo apt install -y fonts-noto-color-emoji git
   git clone https://github.com/dubz100/routine_clock.git ~/routine_clock
   ```
4. Turn off screen blanking: `sudo raspi-config` → *Display Options* → *Screen Blanking* → *No*.
5. Start the clock automatically: run `bash ~/routine_clock/pi/install-autostart.sh`
   (adds `pi/kiosk.sh` to the desktop's autostart). It opens Chromium full screen at
   `prototype/index.html#kiosk`. `#kiosk` hides the demo bar and uses real time.
6. Optional night dimming: `pi/backlight.sh` plus the cron lines in that file.
7. If you use a PiSugar, install its power manager so the RTC syncs the system clock at boot
   and you can see battery level.

**Offline fonts (optional):** the page asks Google Fonts for *Baloo 2* and *Lexend*, and
falls back to system fonts when offline. To bundle them, download the two families
(both are under the SIL Open Font License) into `prototype/fonts/` and replace the
`<link>` with `@font-face` rules.

**Sound autoplay:** browsers block sound until someone taps. `kiosk.sh` passes
`--autoplay-policy=no-user-gesture-required` so the 06:45 wake chime can play.

---

## 3. Safety checklist

### Battery and charging
- [ ] Use only a battery with a **protection circuit / BMS** (PiSugar boards and reputable
      power banks have one). **Never use bare, unprotected lithium cells** or loose 18650s.
- [ ] Battery fully **enclosed and only reachable with a screwdriver**.
- [ ] **No coin/button cells anywhere in the build.** They are a severe swallowing hazard for
      toddlers. (The Pi 4 has no RTC coin cell. The PiSugar RTC runs from its main battery.)
- [ ] Charge on a hard surface, **never on or in a bed**, under a pillow or covered by soft toys.
- [ ] Use the official or a certified USB-C supply. Throw away damaged cables.
- [ ] If the battery swells, gets hot or smells, unplug it and stop using it.

### Cables and placement
- [ ] Overnight, the clock sits on a shelf or chest of drawers **out of reach from the bed
      (ideally 1 m or more away)**. Keep the charging cable short and tidied away. Children
      should not be able to reach a cable from bed, because of the strangulation risk.
- [ ] No cable is needed in the morning, which is the point of the battery.

### Enclosure
- [ ] **Fully enclosed.** No exposed circuit boards, pins or ribbon cables. Children poke.
- [ ] **Security screws** (Torx or tri-wing) so it can't be opened with a coin or butter knife.
- [ ] **No small detachable parts.** Anything that could come off (feet, buttons, the
      handle) must be bigger than a small-parts test cylinder (≈32 mm across) or be
      fixed so it can't come off.
- [ ] **Rounded corners and edges** (≥3 mm radius). Integrated **carry handle**. Rubber
      **bumper** around the screen edge.
- [ ] **Screen protector film** on the glass. It helps hold fragments together if dropped.
- [ ] Material: **PETG or ASA**, not PLA. PLA softens around 55–60 °C and the Pi gets warm.
- [ ] Total weight about 600 g or less so a 3 year old can carry it with two hands.

### Heat
- [ ] Heatsink on the Pi. Vent slots at the bottom and top of the case for airflow.
      Slots narrower than a child's finger (≤5 mm).
- [ ] After an hour running in the closed case, the outside should feel **warm, not hot**
      (aim below about 40 °C). Check the SoC with `vcgencmd measure_temp`. Underclock
      if it's above about 70 °C.

### Light, sound and screen time
- [ ] Night mode is near-black and dims itself. Also lower the backlight at 19:30 with
      `pi/backlight.sh` so it isn't lighting the room.
- [ ] Speaker volume capped quietly in hardware (small speaker, low amp gain) as well as in
      software. Chimes are soft and short.
- [ ] The clock shows no videos or games. It is glanceable, and screen time stays tiny.

### Privacy
- [ ] No camera, no microphone, no accounts. The page works fully offline and stores only
      names, avatar choices and today's progress, on the device itself.
- [ ] Wi-Fi is used only to keep the time accurate (and is optional with an RTC).

---

## 4. Enclosure sketch

```
        ┌────────── carry handle (moulded in, no separate parts) ──────────┐
   ╭────┴──────────────────────────────────────────────────────────────────┴────╮
   │  rubber bumper                                                             │
   │   ┌──────────────────────────────────────────────────────────────────┐     │
   │   │                    7" Touch Display 2 (landscape)                │     │
   │   │                    + screen protector film                       │     │
   │   └──────────────────────────────────────────────────────────────────┘     │
   ╰──┬───────────────────────────────────────────────────────────────────┬────╯
      │  back shell: Pi 4 + heatsink, UPS board, speaker grille,           │
      │  vent slots ≤5 mm, Torx screws, USB-C port recessed at the back    │
      └──── tilted stand at 15–20°, rubber feet glued into recesses ───────┘
```
