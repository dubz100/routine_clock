# Morning Path Clock

A colourful, touch-screen routine clock that helps a 3 and a 4 year old through the
weekday morning. It shows what to do **now**, what comes **next**, and how much time is
left, using pictures and a shrinking timer instead of numbers. It runs on a Raspberry Pi 4B
with the Raspberry Pi Touch Display 2 and a USB-C rechargeable battery.

| | |
|---|---|
| **Try it** | Open `prototype/index.html` in any browser. The demo bar at the bottom jumps to any time of the morning and speeds time up (10×, 60×). |
| **Concepts** | `prototype/concepts.html`: the ten first ideas, the three hybrids and why *Morning Path* won |
| **Design write-up** | `docs/design-process.md`: best practice for this age, concepts, scoring, evolution, how to introduce it to the children |
| **Build guide** | `docs/hardware-and-safety.md`: parts, battery, Pi setup and a full safety checklist |
| **Pi scripts** | `pi/kiosk.sh`, `pi/install-autostart.sh`, `pi/backlight.sh` |

## The routine it runs

| Time | Screen |
|---|---|
| 19:30 – 06:45 | 🌙 Sleepy time: near-black screen, "stay in bed", warm dawn glow for the last 15 min |
| 06:45 – 07:00 | 🤗 Good morning and cuddles |
| 07:00 – 07:15 | 👕 Get dressed and brush teeth: each child taps pants → top → bottoms → socks → teeth |
| 07:15 – 07:25 | 🥣 Breakfast: eat → drink → bowl away |
| 07:25 – 07:35 | 🎲 Play time: spin for a real-world game. Siblings take turns choosing. |
| 07:35 – 07:40 | 🧥 Time to go: coat → shoes → bag → door dance → "Bye bye house!" |

**The play jar** fixes the "we can't play" tears. When both children finish a step early,
the clock moves on and the saved minutes drop into the jar. When a step runs over, the jar
visibly shrinks. Play time is never a surprise, and it comes from the clock, not from a
stressed parent. 07:35 is a fixed anchor, so you still leave on time.

**Grown-ups:** hold the clock in the top-right corner for a second to open settings (names,
animals, sounds, spoken prompts, weekend wake time, "finish this step", reset).

Edit the times and steps in the `CFG` and `STEPS` objects near the top of the script in
`prototype/index.html`.
