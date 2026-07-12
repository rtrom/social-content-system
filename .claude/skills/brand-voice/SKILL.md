---
name: brand-voice
description: Establishes, loads, and applies the brand voice profile — tone, banned phrases, audience, do's and don'ts — every content skill writes against. Use when the user wants to define, capture, or update their brand voice; when starting content work with no voice profile yet on record; or when another skill needs to load the voice profile as its tone reference.
---

# Brand Voice

The **voice profile** is the single source of truth for how everything sounds. Every content skill — briefs, blog posts, captions, scripts, newsletters — writes against it. Nothing downstream is coherent if the voice underneath it drifts, so this skill runs before any writing and its output is the reference the others point at.

The profile lives in a **file** so it can be referenced *dynamically and on demand*: any later skill, later chat, or subagent resolves it from a known location when it needs it, rather than needing it handed down. This skill owns three routines: **resolve** (find and load the profile — the one other skills call), **capture** (create or rebuild it), and **apply** (enforce it on a draft).

## Where the profile lives

Canonical file: **`brand-voice-profile.md`**, saved in the working directory / project root. Its first line is `# Brand Voice Profile`, which identifies it even if a copy was saved under another name.

## Routine: resolve (load on demand)

This is the entry point other skills use — *"load the brand voice profile."* Find the profile and read it into context, in this order:

1. If the profile is already loaded in the current context this session, use it as-is.
2. Otherwise read **`brand-voice-profile.md`** from the working directory / project root.
3. If not there, search the working directory for a markdown file whose first line is `# Brand Voice Profile` and use that.
4. If it still cannot be found, **switch to the capture routine**, create it, then continue. Never proceed against an invented voice.

Completion: the profile's rules are loaded in context (or freshly captured), ready for a writing or apply step to reference.

## Routine: capture (create or rebuild)

Build the profile *with* the user — do not invent voice traits for them. Voice is theirs to declare; your job is to elicit it precisely and reflect it back. Work through the steps in order; each populates one section of the profile.

1. **Gather samples.** Ask the user for 2–4 pieces of existing writing that sound the way they want to sound — captions, emails, blog intros, anything. If they have none, ask them to name 2–3 accounts or writers whose voice they admire and *why*. Completion: at least two concrete voice anchors captured (samples or named admired sources with reasons), or the user has explicitly confirmed none exist and wants to proceed on adjectives alone.

2. **Extract the register.** From the samples, name the observable traits back to the user for confirmation — sentence length, formality, humor, use of slang, first vs. second person, emoji, punctuation habits. Do not accept vague adjectives alone; tie each to something in a sample ("short, fragment-heavy sentences — like your line 'No fluff. Just the method.'"). Completion: 4–6 register traits, each confirmed by the user and each grounded in a sample or an explicit user statement.

3. **Fix the banned list.** Ask directly what the user never wants to sound like — corporate filler, hype words, clichés, specific phrases they hate. Push for specifics; "unprofessional" is not a banned phrase, "leverage synergies" is. Completion: an explicit banned-phrases list AND a banned-register note (the *category* of thing to avoid, e.g. "no engagement-bait questions"), both confirmed.

4. **Set the do's and don'ts.** Convert everything above into a short list of imperative rules a writer can check a draft against — "Do open with a concrete detail, not a thesis"; "Don't use more than one exclamation mark per post." Completion: 5–10 checkable rules, each phrased as a testable instruction, not an aspiration.

5. **Name the audience.** One or two sentences on who the content is for — their situation, what they want, their sophistication level. Voice is relative to a reader. Completion: audience captured specifically enough that a writer could picture one person.

6. **Emit the profile.** Write the profile to **`brand-voice-profile.md`** in the working directory / project root, using the structure in [`profile-template.md`](profile-template.md) and starting with the `# Brand Voice Profile` header line. Read the user the finished profile in full and get explicit confirmation before saving. Completion: file written to the canonical location, and the user has confirmed it reads true — not merely that the sections are filled.

7. **Make it persist (environments without a durable working directory).** If the profile file will not survive into future sessions — e.g. Claude.ai / Cowork, where each chat has its own workspace — tell the user so and give them the durable option: create (or reuse) a **Project** and paste the profile into the Project's instructions/knowledge, so every future chat resolves the same voice. Also offer them the raw profile text to keep. Completion: the user knows how their profile will be available next session, not just this one.

## Routine: apply (enforce on a draft)

First **resolve** the profile (above). Then enforce every rule on the draft in hand. This is flat reference — every rule applied, not a sequence:

- Check the draft against every do and don't in the profile.
- Scan for every banned phrase and every banned *register* pattern, not just literal string matches.
- Confirm the register traits hold — length, person, formality, punctuation habits.
- Confirm the audience framing fits.

Completion: every rule in the profile has been checked against the draft, and each violation is either fixed or flagged to the user with the specific rule it breaks. A general "looks on-brand" does not satisfy this — name the rules checked.

## No profile on record

If **resolve** finds nothing and **apply** was requested, do not guess the voice. Run **capture** first, then apply. Writing against an invented voice is the one failure this skill exists to prevent.
