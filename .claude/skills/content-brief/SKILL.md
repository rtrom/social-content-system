---
name: content-brief
description: Compresses a chosen trend and angle into the single coherence anchor — core message, key points, CTA, tone notes — that every channel writer works from. Use when a trend and angle are chosen and a content run needs its shared brief before any drafting. Backs the content-strategist subagent and the /content-plan command. Every channel skill reads the brief this produces.
---

# Content Brief

Produces the **anchor**: one short brief that every downstream writer — blog, three video channels, X, Threads, newsletter — binds to. The brief exists so eight channels tell *one* story, not eight. It is the single source of truth for what this release is about; if the anchor is vague, every channel drifts a different direction and the QA pass finds contradictions. Get this right before any channel skill runs.

Load and write against the brand voice profile (`brand-voice` **resolve** routine — capture it first if none exists) — the anchor carries tone forward so each writer inherits it rather than re-deriving it.

The brief lives in a **file** so it can be referenced *dynamically and on demand*: any later channel skill, later chat, or subagent resolves it from a known location when it needs it, rather than needing it handed down.

## Where the brief lives

Canonical file: **`content-brief.md`** in the working directory while a run is in progress. When the release is filed (`content-calendar`), it is saved into the release directory as `YYYY-MM-DD_<release-slug>_brief.md`, sharing the release's date and slug so it groups with the channel outputs. Either way it starts with the `# Content Brief` header and carries the Release slug, Date, and Niche, so any writer can resolve it even if a copy was saved under another name.

In environments without a durable working directory (Claude.ai / Cowork, where each chat has its own workspace), keep a content run inside one chat or **Project** so the brief stays resolvable to the channel writers, or paste it in when starting a new chat.

## Resolve (load on demand)

This is the entry point other skills call — *"load the content brief."* `repurposing` (the shared derivation method every channel writer applies) and `blog-outline` call it before drafting. Find the anchor and read it into context, in order:

1. If the brief is already loaded in context for this run, use it.
2. Read the release directory's brief file — `calendar/<date>_<slug>/<date>_<slug>_brief.md` — if the release is filed.
3. Otherwise read **`content-brief.md`** from the working directory.
4. Otherwise search the working directory for a markdown file whose first line is `# Content Brief` and use that.
5. If none exists, the anchor has not been written yet — run this skill's procedure to create it first, or in an automated cascade stop and flag it. **Never invent the anchor**; an improvised core message is the divergence this skill exists to prevent.

## What the anchor contains

Five parts, and no more — the brief is a compression, not a document. Each part is what a downstream writer cannot invent for themselves without risking divergence:

1. **Core message** — one sentence. The single claim this whole release makes. If you cannot say it in one sentence, the angle is not chosen yet. This is the load-bearing part: every channel's piece must be recognizably *this* message.

2. **Key points** — 3–5 supporting points, ordered by importance. Every channel draws from this same set; none invents its own. Fewer channels use fewer points (a video may use one), but they pull from *these*, so nothing contradicts.

3. **CTA** — the one action the release asks the reader to take. Consistent across channels even when its *phrasing* adapts per platform. One release, one ask.

4. **Tone notes** — the voice cues specific to *this* piece, on top of the standing brand voice — e.g. "more urgent than usual," "lean into the personal angle." Not a restatement of the brand-voice profile; the delta from it for this release.

5. **Angle hook** — the specific entry point that makes this message land now (usually inherited from the `trend-research` signal). The reason this is worth posting this week.

## Procedure

1. **Confirm the trend and angle.** Take the chosen trend and angle (from `trend-research`) and the niche. Completion: one trend and one angle fixed — not a shortlist. If several are still open, the strategist must choose one before the brief can be written.

2. **Write the anchor.** Fill all five parts using [`brief-template.md`](brief-template.md) and write the result to the canonical brief file — **`content-brief.md`**, starting with the `# Content Brief` header — so downstream skills can resolve it. Completion: all five parts present; core message is exactly one sentence; key points pull from the trend and niche, not from thin air; file written to the canonical location.

3. **Pressure-test coherence.** Before releasing the brief downstream, check: could all eight channels be built from this without any needing to invent a fact or a stance the brief does not contain? If a channel would have to improvise the core claim, the brief is underspecified — fix it now. Completion: the brief answers "what is this release about, what does it say, what does it ask" with no gaps a writer would have to fill by guessing.

## Next in the chain

Once the anchor is written, apply the `blog-outline` skill to structure the pillar post — the first and fullest expression of this brief, from which every other channel is later repurposed.
