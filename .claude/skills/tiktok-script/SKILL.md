---
name: tiktok-script
description: Writes the TikTok video script — spoken and on-screen content — derived from the pillar post using TikTok's hook formulas, beat structure, length, and sound conventions. Use when a pillar post is ready and a TikTok script is needed. Backs the tiktok-scriptwriter subagent. Pairs with tiktok-caption for the published post.
---

# TikTok Script

Writes the **derivative** that TikTok publishes: the spoken words and on-screen text of the video. This is the script only — the caption, hashtags, and on-screen callouts that publish alongside it are the `tiktok-caption` skill's job. The two together are one post; a subagent uses both.

Apply the `repurposing` skill against the finished pillar and `content-brief` anchor — the script is a restructured, compressed derivation, not a fresh take. Load and write against the brand voice profile (`brand-voice` **resolve** routine).

## What makes it TikTok

TikTok rewards the first second and a native, unpolished register (apply `creator-growth-patterns` principle 3). The conventions — hook formulas, beat structure, length, sound norms — are the reference in [`tiktok-script-reference.md`](tiktok-script-reference.md). Load it while drafting.

## Procedure

1. **Derive from the pillar.** Apply `repurposing`: restructure hook-first (payoff leads), compress to the core message plus one key point. Completion: script traces to pillar; no claim invented.

2. **Open on the hook.** The first line earns the next second — apply a hook formula from the reference. Completion: the first spoken/on-screen line is a hook, not a preamble.

3. **Write the beats.** Structure the body on the beat pattern in the reference; mark on-screen text vs. spoken lines. Completion: script hits the beat structure and stays within the length convention.

4. **Note sound/trend fit.** Flag where a trending sound or format applies (from the `trend-research` signal). Completion: sound/format note present or explicitly marked not-applicable.

Once the script is done, apply `tiktok-caption` for the published post text.
