---
name: niche-evaluator
description: Scores candidate niches against a fixed six-criterion rubric and produces a Niche Evaluation Scorecard with a recommendation. Use when deciding whether to create content in a niche, comparing candidate niches, or periodically re-checking an active niche. Backs Track A and the niche-scout subagent.
---

# Niche Evaluator

Produces a **scorecard** — a fixed-shape comparison of one or more candidate niches against six criteria, ending in a recommendation with confidence notes, not just raw scores. The rubric is fixed so the *process* is identical every run; that repeatability is the whole point of scoring rather than eyeballing.

Reason with the `creator-growth-patterns` skill throughout — several criteria (format viability, personal fit) are direct applications of its principles.

## The rubric

Score every candidate on all six criteria. Each is scored 1–5 with a one-line justification tied to evidence, never a bare number. The criteria are a flat set — all six are mandatory; a scorecard missing any criterion for any candidate is incomplete.

1. **Audience size & growth trajectory** — how large and how fast-growing the addressable audience is on the target platform(s). Evidence: audience/growth data (Virlo), search interest trend.

2. **Competitive saturation / creator density** — how crowded the niche already is. High density lowers the score. Evidence: creator density and hashtag saturation (Virlo).

3. **Format viability** — does the niche support a recurring, repeatable, *low-production* format — the "Thursday deep cleaning vlogs" pattern? A niche that only supports expensive one-off content scores low. Apply `creator-growth-patterns` principle 2 and 3 here.

4. **Personal / brand fit** — existing interest, credibility, authentic embeddedness. Apply `creator-growth-patterns` principle 1: niche-embedded beats generalist, so genuine embeddedness scores high and "we could learn it" scores low.

5. **Monetization pathways** — affiliate categories, plausible brand-deal fit, product potential. Apply `creator-growth-patterns` principle 4: score the *presence and alignment* of pathways, noting that monetization should follow audience, not lead.

6. **Sustainability** — is there enough material to post consistently for 6–12 months without running dry? Evidence: breadth of sub-topics, recurring-event potential, the user's own depth in the niche.

## Procedure

1. **Confirm candidates and platform(s).** List the niches under evaluation and the target platform(s). Completion: every candidate named, target platform(s) fixed.

2. **Gather evidence per criterion.** For each candidate, collect the evidence each criterion calls for (delegate research noise to the `niche-scout` subagent / Virlo and Niche tools where available; web search for market context). Completion: every candidate has evidence gathered for all six criteria — no criterion left to a guess. This exhaustiveness bar is deliberate: a criterion scored without evidence is the failure this skill prevents.

3. **Score and justify.** Assign each candidate a 1–5 on each criterion with a one-line evidence-tied justification. Completion: 6 justified scores per candidate, none bare.

4. **Write the scorecard.** Render using [`scorecard-template.md`](scorecard-template.md).

5. **Recommend.** End with a recommendation and confidence notes — which niche, why, and how confident given evidence gaps. A tie or a "none of these" is a valid recommendation. Completion: recommendation names a niche (or explicitly declines all), cites the criteria that drove it, and states confidence with the specific gaps that limit it. Raw scores alone do not satisfy this step.
