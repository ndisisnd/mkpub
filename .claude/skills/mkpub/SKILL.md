---
name: mkpub
description: Generates and updates a repository's four public-facing docs — README.md, LICENSE.md, SECURITY.md, and llms.txt — from a scan of the repo itself. The README uses a figlet-rendered centered header and badgen badges. Use when the user says "write a README", "generate docs for this repo", "add a license", "add a security policy", "add llms.txt", "/mkpub", or asks to document a repository or skill for release.
argument-hint: "[--init] [--readme] [--license] [--security] [--llms] [--update] [--desc] [--tag] [--help]"
---

# mkpub

Writes the four files a public repo needs before strangers land on it: `README.md`,
`LICENSE.md`, `SECURITY.md`, `llms.txt`. Built for skill repos, works on any repo.

This file routes. The actual instructions live in `refs/protocol-*.md` — read the
protocol for each mode you're running, and read nothing else.

## Modes

**Writes files:**

| Invocation | What it does | Protocol |
|---|---|---|
| `/mkpub` or `/mkpub --init` | All four files, README written last | every protocol below — see Step 3 for order |
| `/mkpub --readme` | `README.md` — figlet header, badges, seven sections | `refs/protocol-readme.md` |
| `/mkpub --license` | `LICENSE.md` — asks which license first, never infers | `refs/protocol-license.md` |
| `/mkpub --security` | `SECURITY.md` — reporting channel and supported versions | `refs/protocol-security.md` |
| `/mkpub --llms` | `llms.txt` — an index for agents landing in the repo | `refs/protocol-llms.md` |
| `/mkpub --update` | Re-scans and refreshes only what actually drifted | `refs/protocol-update.md` |

**Prints to the terminal only — writes nothing:**

| Invocation | What it does | Protocol |
|---|---|---|
| `/mkpub --desc` | A GitHub repo description, ready to paste | `refs/protocol-desc.md` |
| `/mkpub --tag` | GitHub topic tags, ready to paste | `refs/protocol-tag.md` |
| `/mkpub --help` | This menu | none — see below |

Flags combine: `/mkpub --readme --llms` runs both protocols. `--init` does **not** include
`--desc` or `--tag` — they produce no files, so there's nothing for an init to create.

`refs/voice.md` is shared, and `protocol-readme.md` requires it. It does **not** apply to
`--desc` or `--tag`, which have their own register.

### `--help`

List every mode from both tables above — one line each, invocation then its "What it does"
text, writes-files modes first — then stop. Drop the Protocol column; it's internal. Close
with the one-liner that flags combine and that `/mkpub` alone means `--init`.

`--help` short-circuits everything: no scan, no questions, no files, no protocol reads. It
wins over any flag combined with it — `/mkpub --readme --help` prints the menu and does not
write a README.

## Hard rules

These hold across every mode.

1. **Always use AskUserQuestion for decisions.** Never guess a license, a GitHub slug, or
   a tagline. Batch into one call, up to 4 questions.
2. **Gather context before asking.** A question you could have answered by reading the
   repo is a wasted question.
3. **Never invent facts.** No fabricated benchmarks, no invented contributors, no install
   command you haven't verified. If it isn't derivable, scaffold it.
4. **Never clobber.** Existing files get read first and merged or skipped, not
   overwritten.
5. **`--desc` and `--tag` never touch the filesystem.** They print and stop. Don't write
   the output anywhere, don't offer to, don't ask where it should go. GitHub's description
   and topics fields are the destination and only the user can paste into them.
6. **`--help` is free.** It answers from this file alone. Reaching for a tool to serve a
   `--help` is a bug.

## Step 1 — Gather context

Every mode except `--help` starts here. Read whichever exist, in this order. Stop once you
can describe the repo in two sentences.

```
README.md  README.rst  docs/README.md      # existing prose — highest signal
CLAUDE.md  AGENTS.md  .cursorrules         # what the repo tells agents about itself
ARCHITECTURE.md  DESIGN.md  docs/          # how it works
package.json  pyproject.toml  Cargo.toml   # name, version, deps, bin, scripts
.claude/skills/*/SKILL.md                  # if it's a skill repo, these ARE the product
CHANGELOG.md  LICENSE*  SECURITY*          # prior art, current license
```

**If none exist**, scan instead, then read the entry points you find:

```bash
find . -type f -not -path '*/node_modules/*' -not -path '*/.git/*' \
  -not -path '*/dist/*' -not -path '*/.venv/*' | head -100
```

An empty repo is fine — say so and ask what the user is building. Don't invent it.

**Always collect** — these drive badges, install, llms.txt links, and copyright:

```bash
git remote get-url origin 2>/dev/null   # → owner/repo slug
git log -1 --format=%cd 2>/dev/null     # → is this repo alive, what year
git config user.name 2>/dev/null        # → copyright holder
```

## Step 2 — Ask

One `AskUserQuestion` call covering everything the scan couldn't answer, across all modes
you're running. Ask once, up front — don't interrupt the user per file.

Use `preview` on options whenever the choice is visual. **Render the preview for real
before you ask** — figlet the actual repo name in each font and paste the output into the
option's `preview`. Don't describe what a font looks like; show it.

The questions each mode needs are listed in its protocol. Across the four, the recurring
ones are license (always ask), header font, GitHub slug when there's no remote, and
audience.

## Step 3 — Run the protocols

Read each protocol file and follow it. In `--init`, order matters: README last, because
it links to the other three.

## Collisions

Never clobber. When a target file exists:

1. Read it.
2. **Substantive** (real prose, not boilerplate) → ask: **merge** (keep their prose,
   restructure around it) / **replace** / **skip**.
3. **A stub** (empty, one heading, a generator default) → replace it, and say so.

The user's own words are the most valuable thing in an existing README. Merging means
their sentences survive and only the scaffolding changes.

## Scaffolding

Some sections can't be written honestly. Write the heading, write an HTML comment saying
exactly what belongs there, move on:

```markdown
## Acknowledgments

<!-- mkpub: not generatable — who or what actually helped. People, prior art,
     libraries you leaned on. Delete this section if there's nothing to say. -->
```

Scaffold, never fabricate: acknowledgments, benchmarks, performance numbers,
testimonials, contributor lists, roadmap dates, demo GIFs, screenshots, live URLs.

**Report every scaffold to the user when you finish.** That list is the handoff — it's
the difference between a done README and one with invisible holes in it.
