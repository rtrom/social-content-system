---
name: brand-voice
description: Establishes and applies the brand voice profile — tone, banned phrases, audience, do's and don'ts — every content skill writes against. Use when the user wants to define, capture, or update their brand voice; when starting content work with no voice profile yet on record; or when another skill needs the voice profile as its tone reference.
---

# Brand Voice

The **voice profile** is the single source of truth for how everything sounds. Every content skill — briefs, blog posts, captions, scripts, newsletters — writes against it. Nothing downstream is coherent if the voice underneath it drifts, so this skill runs before any writing and its output is the reference the others point at.

Two branches: **capture** (no profile exists yet, or the user wants to rebuild it) and **apply** (a profile exists; enforce it on a draft). Detect which by checking whether a voice profile is on record for this user.

## Branch: capture

Build the profile *with* the user — do not invent voice traits for them. Voice is theirs to declare; your job is to elicit it precisely and reflect it back. Work through the steps in order; each populates one section of the profile.

1. **Gather samples.** Ask the user for 2–4 pieces of existing writing that sound the way they want to sound — captions, emails, blog intros, anything. If they have none, ask them to name 2–3 accounts or writers whose voice they admire and *why*. Completion: at least two concrete voice anchors captured (samples or named admired sources with reasons), or the user has explicitly confirmed none exist and wants to proceed on adjectives alone.

2. **Extract the register.** From the samples, name the observable traits back to the user for confirmation — sentence length, formality, humor, use of slang, first vs. second person, emoji, punctuation habits. Do not accept vague adjectives alone; tie each to something in a sample ("short, fragment-heavy sentences — like your line 'No fluff. Just the method.'"). Completion: 4–6 register traits, each confirmed by the user and each grounded in a sample or an explicit user statement.

3. **Fix the banned list.** Ask directly what the user never wants to sound like — corporate filler, hype words, clichés, specific phrases they hate. Push for specifics; "unprofessional" is not a banned phrase, "leverage synergies" is. Completion: an explicit banned-phrases list AND a banned-register note (the *category* of thing to avoid, e.g. "no engagement-bait questions"), both confirmed.

4. **Set the do's and don'ts.** Convert everything above into a short list of imperative rules a writer can check a draft against — "Do open with a concrete detail, not a thesis"; "Don't use more than one exclamation mark per post." Completion: 5–10 checkable rules, each phrased as a testable instruction, not an aspiration.

5. **Name the audience.** One or two sentences on who the content is for — their situation, what they want, their sophistication level. Voice is relative to a reader. Completion: audience captured specifically enough that a writer could picture one person.

6. **Emit the profile.** Write the profile to `brand-voice-profile.md` using the structure in [`profile-template.md`](profile-template.md). Read the user the finished profile and get explicit confirmation before saving. Completion: file written, and the user has confirmed it reads true — not merely that the sections are filled.

## Branch: apply

A profile exists. Load `brand-voice-profile.md` and enforce it on the draft in hand. This branch is flat reference — every rule applied, not a sequence:

- Check the draft against every do and don't in the profile.
- Scan for every banned phrase and every banned *register* pattern, not just literal string matches.
- Confirm the register traits hold — length, person, formality, punctuation habits.
- Confirm the audience framing fits.

Completion: every rule in the profile has been checked against the draft, and each violation is either fixed or flagged to the user with the specific rule it breaks. A general "looks on-brand" does not satisfy this — name the rules checked.

## No profile on record

If the **apply** branch is requested but no `brand-voice-profile.md` exists, do not guess the voice. Switch to the **capture** branch first, then apply. Writing against an invented voice is the one failure this skill exists to prevent.
