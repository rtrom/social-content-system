---
name: content-calendar
description: The convention for dating, naming, and filing produced content so a release lands as one coherent, findable unit. Use when a content run is finished and its outputs need to be organized, scheduled, or added to the calendar; and when another skill needs the naming or filing convention.
---

# Content Calendar

A finished content run is one **release** — a pillar post plus all its derivatives — that must file as a single coherent unit, not scattered loose files. This skill is the convention for dating, naming, and organizing so any release is findable later and a channel's piece is never orphaned from its siblings.

## Naming convention

Every artifact in a release shares one slug and date so they sort and group together:

```
YYYY-MM-DD_<release-slug>_<channel>.md
```

- **Date** is the intended publish date, not the creation date.
- **Release slug** is the pillar post's URL slug (from `blog-outline`), so every derivative traces to its pillar by name alone.
- **Channel** is one of: `blog`, `tiktok`, `reels`, `shorts`, `x`, `threads`, `newsletter`. Short-form video channels file the script and caption together in one file (script above, caption below a divider), since they publish as one post.

## Filing

Group a release under one directory named for its date and slug:

```
calendar/YYYY-MM-DD_<release-slug>/
  <all channel files>
  release.md   <- index
```

The `release.md` index lists every channel piece in the release, its status (`draft` / `approved` / `scheduled` / `published`), and the intended publish date/time per channel where they stagger. Completion: the index accounts for *every* channel produced in the run — a release with a missing channel in its index is not filed. This exhaustiveness is the point: it is how a repurposed derivative never gets lost from its pillar.

## Scheduling notes

Where channels stagger rather than publish at once, record the offset in `release.md` (e.g. blog first, video same day, newsletter +2 days). Do not invent a cadence the user has not set — if no schedule is given, file all pieces against the single release date and flag that timing is unset.
