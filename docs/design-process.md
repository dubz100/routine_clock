# Morning Path Clock: design process

A routine clock for two children aged 3 and 4, running on a Raspberry Pi 4B with the
Raspberry Pi Touch Display 2. It covers best practice, the concepts, two rounds of
downselection and evolution, and the final design that the HTML prototype
(`prototype/index.html`) implements.

---

## 1. The problem, reframed

The weekday routine:

| Time | Step |
|---|---|
| 19:30 – 06:45 | Sleep (stay in bed) |
| 06:45 – 07:00 | Wake up and cuddles |
| 07:00 – 07:15 | Get dressed and brush teeth (upstairs) |
| 07:15 – 07:25 | Breakfast |
| 07:25 – 07:35 | Quick games, if there's time |
| 07:35 – 07:40 | Leave the house |

What goes wrong today:

1. **The parent is the clock.** Every reminder comes from a grown-up's voice. Reminders turn
   into nagging, nagging turns into stress, and the children push back against the
   person rather than the plan.
2. **3 and 4 year olds can't feel time.** "Five minutes" means nothing to them. Most
   can't read a clock yet. Many can count to five or ten and can see that a shape got
   smaller.
3. **Losing play time is a surprise.** The children learn there's no play time at the
   moment it's taken away, and it comes from a parent. It feels like a punishment, not a
   result of the morning's pace.
4. **There are two children.** They move at different speeds, and at this age any
   comparison quickly becomes "it's not fair" or tears.

**Design goal:** make the clock the authority, make time something you can see, make play
time a visible result of how the morning goes, and stay kind while doing it.

---

## 2. Best practice for 3 and 4 year olds

These come from widely used early-years and parenting guidance: visual schedules and
Now/Next boards (used in nurseries and special-educational-needs settings), visual
timers of the "Time Timer" kind, okay-to-wake clocks, positive parenting programmes
(labelled praise, choices, warnings before transitions) and public-health advice on
screen time and light at night (WHO, NHS, AAP).

| # | Principle | Why it matters at 3–4 | What it means for the clock |
|---|---|---|---|
| P1 | **Pictures, not words or numbers** | Pre-readers recognise pictures straight away | Every step has one big picture. Children never need to read digits. |
| P2 | **Now & Next only** | Working memory is small. A full schedule is too much to take in. | One big NOW, one small NEXT. The whole morning shows only as a simple path. |
| P3 | **Make time visible and shrinking** | Children understand "less" before they understand minutes | A Time-Timer-style disc that shrinks, plus "minute dots" they can count |
| P4 | **Warn before transitions** | Sudden changes cause meltdowns | Gentle 2-minute warning (chime, pulsing disc, "Two more minutes!") |
| P5 | **Externalise the rule** | "The clock says" takes the fight away from the parent | Steps change on the clock, with chimes. Parents become helpers. |
| P6 | **Break tasks into small steps** | "Get dressed" is too big an instruction | Tappable step bubbles: pants, top, bottoms, socks, teeth |
| P7 | **Autonomy and choice** | Control is what 3–4 year olds crave | Children tick their own steps, choose their animal, and spin to pick the game |
| P8 | **Immediate, labelled, positive feedback** | Rewards work best when instant and specific | A star, a chime and confetti the moment a child finishes. Spoken praise names what they did. |
| P9 | **Cooperate, don't compete** | Sibling comparison causes tears | Shared path and shared play jar. Separate lanes, but no "winner". A child who finishes first is asked to help. |
| P10 | **Natural consequences you can see** | Fair and predictable beats arbitrary | The play jar fills when they're quick and shrinks when they dawdle, so play time is never a surprise |
| P11 | **Kind language, no shame** | Shame increases resistance | No red, no crosses, no "late". Overtime says "Time's up! Let's finish." |
| P12 | **Calm, not entertaining** | Screen time guidance for under-5s is about 1 hour a day or less. The clock must not become a toy. | Glanceable display, short animations, no videos. Suggested games are *real-world* games. |
| P13 | **Protect sleep** | Bright or blue light at night disturbs sleep | Night mode is near-black and dims itself after 12 seconds. 15-minute warm "dawn" glow before wake-up. A clear sun signal at 06:45. |
| P14 | **Consistency** | The routine is learned through repetition | Same colours, sounds and pictures for each step, every day |

Two more rules came from the "parents get stressed" part of the brief:

- **Parents get a quiet signal.** A small "on track / 3 min behind" chip by the clock, which
  children ignore. Parents learn about a slip early, without announcing it.
- **Parents can step in without breaking the system.** A hidden grown-up panel (hold the
  clock for about a second) can finish a step without giving stars, e.g. when a child is poorly.

---

## 3. Round 1: ten concepts

| # | Concept | How time is shown | Strengths | Weaknesses |
|---|---|---|---|---|
| C1 | **Traffic Light** (okay-to-wake style) | Whole screen red/amber/green | Very simple, great at night | Says nothing about *what* to do. Red feels like "bad". |
| C2 | **Now & Next Board** | Two picture cards plus a bar | Matches early-years practice. Very clear. | Flat. Little motivation. No overview of the morning. |
| C3 | **Time-Timer Disc** | Coloured wedge that shrinks | Best way to make time tangible | One activity at a time. No sense of the whole. |
| C4 | **Morning Path** (board game) | Characters walk a path of picture stops | Shows the whole morning as a journey. Fun. | Can get busy. Needs proportional spacing to be honest about time. |
| C5 | **Morning Train** | Carriages = steps, the train moves to the station | Kids love trains. Carriage length = duration. | Linear metaphor wears thin. Hard to show tasks running long. |
| C6 | **Rocket Mission** | Each step fuels the rocket, which launches at 07:40 | Exciting finale. Turns leaving the house into a celebration. | Over-stimulating. "Mission failed" risk. |
| C7 | **Garden Grows** | Each finished step grows a flower | Gentle and positive | Slow payoff. Says nothing about time remaining. |
| C8 | **Mascot Buddy** | A pet character does the routine with them | Children copy the character. Emotional pull. | Mascot "moods" can become guilt-tripping. |
| C9 | **Play Jar** (mechanic) | Minutes of play shown as a filling jar | Directly fixes the play-time sadness. Fair. | A mechanic, not a full interface |
| C10 | **Superhero Cards** | Mission cards per step | Strong narrative for some children | Needs story buy-in. Can feel gendered. |

---

## 4. Downselect 1

Scored 1–5 against weighted criteria taken from the principles and the brief.

| Criterion (weight) | C1 | C2 | C3 | C4 | C5 | C6 | C7 | C8 | C9 | C10 |
|---|---|---|---|---|---|---|---|---|---|---|
| Understood by a 3 year old (×3) | 5 | 5 | 4 | 4 | 4 | 3 | 3 | 4 | 3 | 2 |
| Makes time visible (×3) | 2 | 3 | 5 | 4 | 4 | 3 | 1 | 2 | 3 | 2 |
| Readable from across the room (×2) | 5 | 4 | 5 | 3 | 3 | 3 | 2 | 3 | 3 | 2 |
| Motivating without competition (×2) | 1 | 2 | 2 | 4 | 4 | 5 | 4 | 4 | 4 | 4 |
| Fixes the play-time sadness (×3) | 1 | 1 | 2 | 3 | 3 | 2 | 2 | 2 | 5 | 2 |
| Calm / low stimulation (×2) | 5 | 5 | 5 | 3 | 3 | 1 | 4 | 3 | 4 | 2 |
| Easy to build on a Pi (×1) | 5 | 5 | 5 | 3 | 3 | 2 | 3 | 2 | 5 | 3 |
| **Weighted total (max 80)** | **51** | **54** | **62** | **56** | **56** | **44** | **41** | **46** | **60** | **37** |

**Taken forward:** C3 Time-Timer Disc, C9 Play Jar, C4 Path, C5 Train, C2 Now & Next.

**Dropped, but kept for parts:**
- C1 Traffic Light becomes the **night mode** (it really is the best night-time signal).
- C6 Rocket's best idea, a celebration when you leave, becomes the **"Bye bye house!"**
  finale and the door dance.
- C8 Mascot becomes **the children's own animals** travelling along the path. They're the
  heroes, and there's no character whose mood can guilt-trip them.
- C7 and C10 dropped.

---

## 5. Evolution: three hybrids

### A. Morning Path
NOW card with a big shrinking disc, a small NEXT card, a proportional path along the top
with both children's animals walking it, a play jar, and one lane per child with tappable
step bubbles.

### B. Morning Train
The whole screen is a train track. Each step is a carriage whose length is its duration.
The current carriage is large with a steam-puff timer. The play carriage at the end gets
longer or shorter depending on pace. Arriving at the station = leaving the house.

### C. Rocket Countdown
A big fuel tank fills as steps are done. Each child has their own fuel line. At 07:40
the rocket "launches" (you leave). Play time = spare fuel.

### Walking each one through real mornings

| Scenario | A. Path | B. Train | C. Rocket |
|---|---|---|---|
| Normal morning | Clear. NOW is obvious from across the room. | Clear, but the current step is smaller | Exciting, but the tank doesn't say *what* to do |
| Slow dressing (overtime) | Disc empties, the play jar visibly shrinks and the play segment on the path squashes. Kind wording. | Play carriage shrinks. Fine. | Tank "leaks", which reads as failure |
| Super quick morning | Jar fills past 10 with "+4 min" floating up. Great. | Long play carriage. Good. | Spare fuel is abstract |
| One child sick / away | Grown-up finishes the step. Works. | Works | Unbalanced fuel lines look like losing |
| Night waking at 03:00 | Near-black moon, sleeping animals, sunrise bar | Train in a shed. Fine. | Weak |
| Readable on a 7" screen at 3 m | Best. One big shape and colour. | Busy, thin carriages | Good |
| Over-stimulation risk | Low | Medium | High |

---

## 6. Downselect 2: Morning Path wins

**A. Morning Path** won because it is the only option that keeps the two best early-years
tools (Now/Next and a visual timer) as the biggest things on screen, while the path and
jar add the motivation and fairness the brief asks for.

What it took from the others:
- **From Train:** path segments are *proportional to time*, and the play segment
  visibly squashes or stretches. The whole morning always adds up to 55 minutes, so play
  absorbs every overrun. Children can see cause and effect.
- **From Rocket:** a finale. When both children finish shoes, coat and bag there's a
  "Door dance!", and at 07:40 "Bye bye house!" with confetti. Leaving always ends on a high,
  even on days with no play time.
- **From Traffic Light:** night mode.

---

## 7. Final evolution: Morning Path v2 (what the prototype does)

**Screen anatomy (landscape, 1280×720):**

```
┌───────────── morning path (proportional, animals walk it) ─────────┬─ 7:04 ─┐
│ [🤗 wake][👕 dress    ][🥣 breakfast][🎲 play     ][🧥]              │On track│
├──────────────────────────────────────────────┬──────────────────────┴────────┤
│   ◔ big shrinking disc   NOW                 │ NEXT 🥣 Breakfast  at 7:15    │
│      with picture        Get dressed         ├───────────────────────────────┤
│                          and brush teeth     │ ▮ play jar   10 minutes of    │
│                          ● ● ● ● ● ● ● ●     │              play time        │
├──────────────────────────┬───────────────────┴───────────────────────────────┤
│ 🦊 Fox ⭐ (🩲)(👕)(👖)(🧦)(🪥) │ 🐼 Panda ⭐ (🩲)(👕)(👖)(🧦)(🪥)                │
└──────────────────────────┴───────────────────────────────────────────────────┘
```

**How the morning works:**

| Step | Behaviour |
|---|---|
| Night (19:30–06:45) | Near-black screen with a moon, sleeping animals and a moon→sun progress bar. Tapping wakes the screen briefly ("Stay in bed"), then it dims again after 12 s. In the last 15 minutes the sky warms like dawn ("Nearly time!"). |
| 06:45 Wake & cuddles | Sun chime, "Good morning! You can get up now." Fixed 15 minutes. |
| Get dressed + teeth | Each child taps their own 5 step bubbles. Finishing all 5 gives a star. When **both** finish, there's a celebration and the clock **moves on early**. The minutes saved go into the play jar ("+4 minutes of play time!"). |
| Breakfast | Same, with 3 steps: eat, drink, bowl away |
| Play | Lasts until 07:35, however much time is left. The "chooser" alternates daily ("Fox picks today"). Spin picks a real-world game: Freeze Dance, Animal Walks, Hide the Teddy… |
| 07:35 Time to go | **Fixed anchor.** Even if breakfast is still going, the clock moves to coat, shoes, bag. When both are done: "Ready to go! Door dance!" |
| 07:40 | "Bye bye house! Have a great day." Day screen shows today's stars. |
| Weekend | Okay-to-wake only (07:00 by default, can be changed), then "It's the weekend! No rush today." |

**Overtime:** if a task runs past its planned time, the disc turns into a soft striped ring,
the picture wobbles, the words say "Time's up! Let's finish." and the play jar wobbles with
"Oh no, play time is shrinking!". No red, no buzzer, no blame. The consequence is visible
and comes from the clock, not the parent.

**Sound:** short, soft sine-wave chimes generated in code (no audio files). Optional spoken
prompts ("Two more minutes", "Well done Fox and Panda!") use the browser's speech engine.

**Deliberately left out:**
- Screen games or videos. The clock suggests *real* games.
- Numbers as the main timer. Digits are small and meant for grown-ups.
- Red, crosses, sad faces, buzzers.
- Leaderboards or "who was first".
- Any camera, microphone, cloud account or data collection.

---

## 8. Introducing it to the children

How you launch it matters as much as the design:

1. **Unbox it together at the weekend.** Let each child choose their animal and say hello.
   Call it "the Morning Clock" and say "the clock tells us what's next".
2. **Practise as a game** using the demo bar (jump to 07:00, play at 10× speed) and act out
   a pretend morning. Let them tick the bubbles.
3. **First week:** celebrate loudly when they finish ("You did your socks all by yourself!").
   Point at the clock, not yourself: "What does the clock say?"
4. **Talk about the jar** before breakfast: "Look, you filled the jar, 14 minutes of play!"
5. **On slow days,** stay neutral and point at the jar: "The jar got smaller today. Shall we
   try to fill it tomorrow?" Then still do the door dance.
6. **After 3–4 weeks,** when the routine has stuck, you can drop the stars and keep the
   jar and the path.

---

## 9. Possible next steps

- **Your own voices:** record a parent saying each prompt (much stronger than a synthetic voice).
- **Big physical buttons** (arcade buttons on GPIO) for "I'm done!", for children who struggle with the touch screen.
- **Bedtime routine** (bath → pyjamas → teeth → story) using the same engine.
- **Sick day / holiday** toggle in the grown-up panel.
- **Offline fonts** bundled in the repo (see hardware notes).
