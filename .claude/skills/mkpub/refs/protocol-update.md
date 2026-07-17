# Protocol: --update

Refreshes the four files against the current state of the repo.

`--update` is a diff, not a rewrite. The user already has these files and has probably
edited them by hand. Preserving that is the job.

## Steps

1. **Check what exists.** Report the four-file status before touching anything.
2. **Read all four in full.** You can't tell what drifted without knowing what they claim.
3. **Re-scan the repo** — the gather step in SKILL.md.
4. **Diff claims against reality.** Per file, below.
5. **Apply only what drifted.** Missing files get created — that's `--init` for those
   files, so run their protocol.
6. **Report by file.** If nothing drifted, say that. Don't make cosmetic edits to look
   busy.

## The rule

**A claim that's still true doesn't get rewritten**, even if you'd phrase it differently.
The user's wording is not drift. Style preferences are not drift. Drift is when the file
says something the repo no longer supports.

You are looking for false statements, not improvable ones.

## Per file

### README.md

Check, in rough order of how often it rots:

- **Install commands** — does the command still exist and still work
- **Version numbers** — against the manifest and tags
- **Modes, flags, commands, skills** — added, removed, or renamed since the file was
  written. Compare against the real definitions, not the README's own list.
- **File tree** — regenerate it if one is present; don't hand-patch
- **Links** — dead internal links, moved files, renamed anchors
- **Scaffolds** — did the user fill in Acknowledgments? Leave it alone if so. Still empty?
  Leave the scaffold comment in place. Don't nag and don't fill it in yourself.

Leave prose alone unless it's now false.

### LICENSE.md

- **Copyright year** — extend the range if the repo has commits in a newer year
  (`2024` → `2024–2026`). This is usually the only legitimate edit.
- **Holder** — only if it's clearly wrong.
- **License type** — **never change without asking.** Relicensing has legal consequences
  and can require every contributor's consent. If the manifest's `license` field and
  `LICENSE.md` disagree, surface the conflict and ask which is authoritative. Don't
  reconcile it silently.

### SECURITY.md

- **Contact channel** — does the link or address still resolve
- **Supported versions** — against current tags. This is the section that rots fastest;
  a table claiming support for a branch that's been dead a year is a real problem.
- **Scope** — did the project grow a network surface, credentials, or user data since
  this was written? If so it needs rewriting, not patching.

### llms.txt

- **Every link** — verify each path with `ls`. Dead links are this file's whole failure
  mode.
- **New entry points** — new skills, new refs, new docs worth indexing
- **Descriptions** — still accurate for what each file now does

## Conflicts

When a file contradicts the repo, the **repo is authoritative** — except for anything
the user chose rather than derived. License type, tagline, positioning, and audience are
choices. If one of those looks wrong, ask; don't correct it.
