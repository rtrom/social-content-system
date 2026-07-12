---
name: blog-outline
description: Structures the pillar blog post — heading pattern, SEO conventions — and the publish metadata (meta title, meta description, URL slug) that ships with it. Use when a content brief is set and the pillar post needs its outline and metadata before drafting. Backs the blog-writer subagent. The URL slug it sets names the whole release.
---

# Blog Outline

Structures the **pillar** — the full blog post that is the source every other channel later derives from. The pillar is written first and fullest; captions, scripts, and the newsletter are all compressions or restructurings of it, never independent takes. So the pillar's outline must be complete enough that the whole release can be repurposed out of it without any channel going back to raw research.

Built from the `content-brief` anchor and written against `brand-voice-profile.md`. The core message and key points come from the brief — the outline gives them structure and SEO shape, it does not invent new claims.

## The outline

Standard pillar structure — adapt depth to the topic, keep the skeleton:

- **H1 / title** — carries the core message and the primary keyword. One H1.
- **Intro** — the angle hook (from the brief) in the first two sentences; states what the reader will get. No throat-clearing.
- **H2 sections** — one per key point from the brief, in the brief's importance order. Each H2 is a self-contained unit — this matters because repurposing pulls whole sections into derivatives, so a section that only makes sense in sequence repurposes badly.
- **H3s** — sub-points within an H2 where a point has parts.
- **Conclusion + CTA** — restates the core message and lands the brief's CTA.

### SEO conventions

- One primary keyword, placed in H1, intro, at least one H2, and the meta title.
- Secondary keywords in H2s where natural — never stuffed.
- Headings are descriptive and scannable, phrased as what the reader gets, not clever.
- Internal-link opportunities noted where relevant.

## Publish metadata

The pillar ships with metadata that is itself content, not an afterthought. Produce all three:

1. **Meta title** — under ~60 characters, contains the primary keyword, readable as a search result.
2. **Meta description** — under ~155 characters, carries the angle hook, earns the click without clickbait.
3. **URL slug** — short, keyword-bearing, hyphenated, no filler words. **This slug names the entire release** (see `content-calendar`), so set it deliberately — every derivative file inherits it.

## Procedure

1. **Load the brief.** Take the `content-brief` anchor. Completion: core message, key points, CTA, angle hook all in hand.

2. **Build the outline.** Map every key point to an H2 in importance order; write the intro hook and conclusion CTA. Completion: every brief key point appears as a section; no section introduces a claim absent from the brief.

3. **Write the metadata.** Produce meta title, meta description, and URL slug to the length limits above. Completion: all three present and within limits; slug is release-ready.

4. **Emit.** Render using [`outline-template.md`](outline-template.md). Completion: outline and all three metadata fields filled; the slug is recorded for the release.

## Next in the chain

Once the pillar post is outlined and drafted, apply the `repurposing` skill to derive every channel's content from it — the derivatives never go back to raw research, they come from this pillar.
