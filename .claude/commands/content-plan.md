---
description: Turn a chosen trend/angle into the content brief every channel works from (Track B step 2). Runs content-strategist.
argument-hint: "[chosen trend or angle] (optional; uses latest signal summary if omitted)"
allowed-tools: Agent, Read, Write
model: opus
---

# Content Plan

Compress a chosen trend and angle into the **content brief** — the single coherence anchor every downstream channel writer binds to.

**Chosen trend/angle:** $ARGUMENTS
(If omitted, use the trend the user just selected from the most recent `/trend-scan` signal summary. If no signal summary exists in this session, tell the user to run `/trend-scan [niche]` first.)

## Preflight

The brief and everything downstream depend on the brand voice profile. Before delegating, confirm `brand-voice-profile.md` exists. If it does not, stop and tell the user to run the `brand-voice` skill first — do not let the strategist invent a voice.

## What to do

Delegate to the `content-strategist` subagent, passing the chosen trend/angle. It will:
1. Fix ONE trend and ONE angle (not a shortlist).
2. Load the brand voice profile.
3. Write the five-part brief per the `content-brief` skill (core message, key points, CTA, tone notes, angle hook) and set the release slug.
4. Pressure-test coherence — could all eight channels be built from this brief without inventing anything?

## Output

Present the finished brief for the user to review. Then stop — do **not** auto-run `/full-pipeline`. The brief is the highest-leverage artifact in the system; let the user confirm it reads right before committing the whole cascade to it.
