# Social Content System — Setup & Usage

This system does two jobs: it helps you decide **whether** a content niche is worth pursuing (Track A), and it **produces** a full set of social content from one blog post (Track B). It works two ways — a technical path in Claude Code and a point-and-click path in Cowork. You only need the one that fits you.

---

## Pull down & install (Claude Code)

Clone the private repo, then choose how you want the skills available:

```bash
git clone git@github.com:rtrom/social-content-system.git
cd social-content-system
```

**Option A — use the repo itself as your project.** Just open this folder in Claude Code. Everything under `.claude/` is already wired up; nothing to copy.

**Option B — install into another project or globally.** Run the install script:

```bash
# macOS / Linux / Git Bash
./install.sh                 # global: copies into ~/.claude (available in every project)
./install.sh /path/to/proj   # into a specific project's .claude/ (also drops CLAUDE.md)
```

```powershell
# Windows PowerShell
./install.ps1                      # global: ~/.claude
./install.ps1 -Target C:\path\proj # into a specific project
```

The script copies `skills/`, `agents/`, and `commands/` into the target's `.claude/` directory (and `CLAUDE.md` to the project root for project installs). **Restart Claude Code afterward** so it loads them. Re-run the script anytime you `git pull` to update.

---

## What's in the box

- **17 skills** (`skills/`) — the actual workflow logic. These are the brains; everything else just wraps them.
- **14 subagents** (`agents/`) — Claude Code only. They run the skills as a coordinated team.
- **4 slash commands** (`commands/`) — Claude Code only. Shortcuts that kick off the workflows.
- **CLAUDE.md** — project context for Claude Code.
- **mcp.json.example** — optional trend-data tool config.

---

## The one thing to do first (both paths)

Everything depends on your **brand voice profile**. Before producing anything, run the `brand-voice` skill and answer its questions — it walks you through describing how you want to sound and saves a profile file. Every other skill reads it. If you skip this, the system will stop and ask for it.

---

## Path 1 — Cowork (point-and-click, no files to edit)

This is the simpler path.

1. **Install the skills.** In Cowork, go to **Customize > Skills** and add each of the 17 skills. (No file editing — just install them.)
2. **Optional — add trend data.** Go to **Customize > Connectors > Add custom connector** and paste the Virlo (and optionally Niche) server URL, then authenticate. Sign up at dev.virlo.ai first. Skip this to start; the system works without it, just with less live trend data.
3. **Set your brand voice.** Ask Claude: *"Help me set up my brand voice."* Answer its questions. Done once.
4. **Use it in plain language.** You don't need the subagents or commands — Cowork picks the right skill automatically. Just ask:
   - *"Should I make content about [niche]? Evaluate it."* → runs the niche evaluation.
   - *"Find what's trending in [niche]."* → gathers trend signal.
   - *"Write a full content set about [topic]."* → produces the blog post and all the social posts.

The skills are wired to hand off to each other, so a single request can walk through multiple steps on its own.

---

## Path 2 — Claude Code (technical, full cascade)

This path uses the subagents and slash commands for parallel, isolated execution.

1. **Requirements.** Claude Code v2.1.172+ (for nested subagents). Update with `claude install` or `npm i -g @anthropic-ai/claude-code` if unsure.
2. **Install the files.** Copy into your project (or home dir for cross-project use):
   - `skills/` → `.claude/skills/`
   - `agents/` → `.claude/agents/`
   - `commands/` → `.claude/commands/`
   - `CLAUDE.md` → project root
   - Note: subagent/skill files are loaded at session start — **restart Claude Code after copying them in.**
3. **Optional — trend tools.** Rename `mcp.json.example` to `.mcp.json`, fill in your Virlo/Niche credentials.
4. **Set your brand voice.** Run the `brand-voice` skill once.
5. **Run the workflows:**

   **Track A — evaluate a niche:**
   ```
   /evaluate-niche stay-at-home-parent-cleaning tiktok,reels
   ```

   **Track B — produce content (three steps, so you can review between each):**
   ```
   /trend-scan [niche]        → see what's trending, pick a direction
   /content-plan [chosen angle] → review the content brief
   /full-pipeline             → produce + QA + file the whole release
   ```
   Or run `/full-pipeline [niche]` cold to chain the whole thing at once.

---

## How a Track B run flows

```
trend-scout  →  content-strategist  →  blog-writer  ──┬─→ tiktok-scriptwriter
 (signal)         (the brief)          (the pillar)   ├─→ reels-scriptwriter
                                                       ├─→ shorts-scriptwriter
                                                       ├─→ x-writer
                                                       ├─→ threads-writer
                                                       └─→ newsletter-writer
                                                              │
                                                         editor-qa
                                                    (checks all together)
```

The blog post is written first; every social post is derived from it, not researched separately. That's what keeps all eight channels telling one consistent story. The final QA pass reads everything together to catch any contradiction before it's filed.

---

## Notes

- **The Virlo and Niche tools are third-party**, not verified by Anthropic. They act within whatever account you authenticate. Create the accounts yourself and check pricing before relying on them daily.
- **Sharing:** on Team/Enterprise plans, skills have a built-in Share button. Otherwise skills are just folders — zip and send, and the recipient installs them the same way.
- **The brand voice profile is the foundation.** If content ever starts sounding off, re-run `brand-voice` to update it — every skill picks up the change automatically.
