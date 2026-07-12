---
name: reels-script
description: Writes the Instagram Reels video script — spoken and on-screen content — derived from the pillar post, following Reels conventions where they diverge from TikTok (aesthetic, audio sourcing). Use when a pillar post is ready and a Reels script is needed. Backs the reels-scriptwriter subagent. Pairs with reels-caption.
---

# Reels Script

Writes the script for the Instagram Reels video — spoken words and on-screen text. Caption and hashtags are the `reels-caption` skill's job; together they are one post.

The scripting *method* is the same as short-form video generally: apply `repurposing` against the pillar and `content-brief` anchor (restructure hook-first, compress), load and write against the brand voice profile (`brand-voice` **resolve** routine), open on a hook, structure in beats within a ~15–60s length. Rather than restate those shared mechanics, this skill covers only where **Reels diverges from TikTok** — the divergences are the reference in [`reels-divergences.md`](reels-divergences.md).

## Procedure

1. **Derive from the pillar.** Apply `repurposing`: hook-first restructure, compress to core message plus one key point. Completion: script traces to pillar; nothing invented.

2. **Apply the Reels divergences.** Load the divergences reference and adjust aesthetic, audio sourcing, and register accordingly — do not simply reuse a TikTok script. Completion: each divergence in the reference has been applied or explicitly judged not-applicable for this video.

3. **Write hook + beats.** Same beat spine as short-form video; Reels-appropriate hook. Completion: first line is a hook; body hits the beats within length.

Once the script is done, apply `reels-caption` for the published post text.
