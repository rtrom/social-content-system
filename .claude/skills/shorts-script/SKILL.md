---
name: shorts-script
description: Writes the YouTube Shorts video script — spoken and on-screen content — derived from the pillar post, following Shorts conventions where they diverge from TikTok. Use when a pillar post is ready and a Shorts script is needed. Backs the shorts-scriptwriter subagent. Pairs with shorts-caption.
---

# Shorts Script

Writes the script for the YouTube Shorts video — spoken words and on-screen text. The publish text (YouTube SEO title, description, tags) is the `shorts-caption` skill's job; together they are one post.

The scripting method is the shared short-form one: apply `repurposing` against the pillar and `content-brief` anchor (hook-first restructure, compress), load and write against the brand voice profile (`brand-voice` **resolve** routine), hook first, beats within length. This skill covers only where **Shorts diverges** — the divergences are in [`shorts-divergences.md`](shorts-divergences.md).

## Procedure

1. **Derive from the pillar.** Apply `repurposing`: hook-first, compress to core message plus one key point. Completion: script traces to pillar; nothing invented.

2. **Apply the Shorts divergences.** Load the divergences reference; adjust for YouTube's ecosystem (search-and-suggested surfacing, audience arriving from a channel, loop behavior). Completion: each divergence applied or judged not-applicable.

3. **Write hook + beats.** Shorts punishes a slow open even harder; front-load ruthlessly. Completion: first line is a hook; body hits the beats within length.

Once the script is done, apply `shorts-caption` for the YouTube publish metadata.
