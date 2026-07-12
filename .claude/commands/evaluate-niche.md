---
description: Evaluate whether to create content in one or more niches (Track A). Runs the niche-scout cascade and returns a scored Niche Evaluation Scorecard.
argument-hint: "[niche or comma-separated niches] [optional target platforms]"
allowed-tools: Agent, Read, Write, WebSearch
model: opus
---

# Evaluate Niche

Score one or more candidate niches against the six-criterion rubric and produce a Niche Evaluation Scorecard with a recommendation. This is Track A — the "should we create content in this niche at all?" decision, run occasionally, not the recurring production pipeline.

**Candidate niche(s) and platforms:** $ARGUMENTS
(If multiple niches are given, they'll be scored side by side. If no platform is given, ask which platform(s) matter before proceeding — audience and saturation scores are platform-specific.)

## What to do

Delegate to the `niche-scout` subagent, passing the candidates and platforms. It orchestrates the evaluation in its own context, fanning out to three analysts:
- `audience-analyst` — audience size/growth + sustainability
- `competition-analyst` — saturation/density + format viability
- `monetization-analyst` — personal/brand fit + monetization pathways

`niche-scout` synthesizes their scored dimensions into one scorecard using the `niche-evaluator` skill.

## A note on personal/brand fit

Criterion 4 (personal/brand fit) depends on the user's own background — existing interest, credibility, embeddedness in the niche. If the arguments don't include this, surface the question to the user rather than letting the analyst guess. Per the growth research, genuine embeddedness is a real scoring factor, not a formality.

## Output

Present the completed Niche Evaluation Scorecard: all six criteria scored per candidate with justifications, and a recommendation with confidence notes and the specific evidence gaps that limit it. A "none of these" is a valid recommendation. Do not present raw scores without the recommendation.
