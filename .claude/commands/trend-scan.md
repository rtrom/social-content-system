---
description: Scan the chosen niche for current trend signal (Track B step 1). Runs the trend-scout subagent and returns a signal summary.
argument-hint: "[niche] [optional platforms, e.g. tiktok,reels]"
allowed-tools: Agent, Read, Write, WebSearch
model: sonnet
---

# Trend Scan

Gather current trend signal for the niche, as the first step of the Track B content pipeline.

**Niche and platforms:** $ARGUMENTS
(If no platforms are given, default to all three short-form video platforms: TikTok, Instagram Reels, YouTube Shorts.)

## What to do

Delegate to the `trend-scout` subagent, passing the niche and platforms above. Let it do the full signal-gathering in its own context — do not pull raw trend data into this conversation.

`trend-scout` will:
1. Pull rising trend data across the target platforms (Virlo MCP tools if connected, web search for context).
2. Filter to signal using the `trend-research` skill's three tests (in-niche/adjacent, rising-not-peaked, format-actionable).
3. Return a signal summary of 3–7 trends, each with a description, why it's rising, and an angle hook.

## Output

Present the signal summary. Then stop and let the user pick a direction — do **not** auto-run `/content-plan`. The user chooses which trend/angle to pursue before the brief is written.

If fewer than 3 trends survived filtering, say so plainly rather than padding with weak signal.
