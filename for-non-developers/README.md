# For non-developers (Claude.ai, individual plan)

This folder is the point-and-click hand-off — no git, no terminal, no `.claude/` files.
It's for someone using **Claude.ai** (browser/desktop) on a **Free/Pro/Max** account.

## What's here
- **`START-HERE.md`** — the plain-language guide to give them (enable setting → upload
  skills → set brand voice → use it).
- **`skills-to-upload/`** — 17 upload-ready zips, one per skill. Each zip contains the
  skill folder at its root (e.g. `brand-voice/SKILL.md`) with forward-slash paths, which
  is what Claude.ai's uploader requires.
- **`social-content-skills-handoff.zip`** — everything above in one file. **Send this.**
- **`build-skill-zips.ps1`** — regenerates the zips + bundle. Run it after editing any
  skill under `.claude/skills/`:  `./for-non-developers/build-skill-zips.ps1`

## How to hand it off
1. Send them **`social-content-skills-handoff.zip`** (email, Drive, USB, etc.).
2. They unzip it → they get `START-HERE.md` and the 17 skill zips.
3. They follow `START-HERE.md`.

## Why individual uploads (not one bulk import)
On individual Claude.ai plans, skills are per-user and are added one zip at a time —
there's no admin/bulk install. The subagents and slash commands in this repo are
**Claude Code only** and don't apply here; on Claude.ai the skills carry the whole
workflow and Claude auto-selects the right one from a plain-language request.

## The one caveat worth knowing
The `brand-voice` skill writes a profile file during a chat. Cross-chat file persistence
isn't guaranteed on individual Claude.ai, so `START-HERE.md` recommends doing content
work inside a **Project** and pasting the profile into the project's instructions, so
every new chat already carries the voice.
