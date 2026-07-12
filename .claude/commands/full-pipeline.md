---
description: Run the full Track B production cascade — pillar post plus all six channels, QA'd and filed as one release.
argument-hint: "[niche] (optional if a brief already exists this session)"
allowed-tools: Agent, Read, Write, Glob, WebSearch
model: opus
---

# Full Pipeline

Run the complete Track B content cascade end to end and file the result as one coherent release.

**Input:** $ARGUMENTS

## Preflight — check state before running

This command chains the whole pipeline, so first determine where to start:

1. **Brand voice must exist.** Confirm `brand-voice-profile.md` is present. If not, stop and tell the user to run the `brand-voice` skill first. Nothing downstream is coherent without it.
2. **Do we have a brief already?** If `/content-plan` has produced a brief this session, start from `blog-writer` using that brief.
3. **Do we have signal but no brief?** If `/trend-scan` ran but no brief exists, run `content-strategist` first, then continue.
4. **Starting cold?** If a niche was given in the arguments and there's no signal yet, run the whole chain from `trend-scout`.

State which entry point you're using before proceeding.

## The cascade

Run the Track B tree (each subagent works in its own context; do not pull their intermediate work into this conversation):

1. `trend-scout` → signal summary (skip if already done)
2. `content-strategist` → content brief (skip if already done)
3. `blog-writer` → writes the pillar post + publish metadata, then fans out in parallel to the six channel writers:
   - `tiktok-scriptwriter`, `reels-scriptwriter`, `shorts-scriptwriter`, `x-writer`, `threads-writer`, `newsletter-writer`
   - then collects all six drafts and spawns `editor-qa` for the cross-channel coherence review.
4. If `editor-qa` returns a revise verdict, route each named fix back to the relevant writer and re-check before proceeding.

## File the release

Once QA approves, apply the `content-calendar` skill to file everything as one release: date + release-slug naming, grouped under one release directory with a `release.md` index accounting for every channel. A release missing a channel from its index is not done.

## Output

Report the filed release: the pillar (with metadata) and all six channel pieces, their file locations, QA verdict, and any contradictions caught and resolved. Flag any channel that came back thin so the user can re-run just that leaf.
