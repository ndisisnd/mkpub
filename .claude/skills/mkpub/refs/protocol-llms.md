# Protocol: --llms

Writes `llms.txt` at the repo root.

## Steps

1. Inventory the repo's real entry points — the files an agent would need to read to use
   or modify this project.
2. Resolve the GitHub slug; links are absolute when a remote exists (see [Links](#links)).
3. Write the file in the format below.
4. Add the llms.txt pointer to the README header if `--readme` ran or `README.md` exists.

## What llms.txt is

A map for an agent that just landed in the repo and has a limited context window. It
answers three questions: what is this, what should I read, and what should I not read.

It is **not** a README for robots, not a sitemap, and not documentation. It's an index.
The [spec](https://llmstxt.org) is loose; the format below is the useful part of it.

The failure mode to design against: an agent reads llms.txt, still doesn't know which
file to open, and greps the whole repo anyway. Every line either narrows that search or
is dead weight.

## Format

Markdown, in this order. H1 and blockquote are the only required parts.

```markdown
# Project Name

> One sentence. What this is and what it does.

Two or three sentences of orientation an agent can't get from the file tree —
the mental model, the one constraint that isn't obvious from reading the code.

## Docs

- [README](README.md): what it does, install, how it works
- [Skill definition](.claude/skills/name/SKILL.md): the router — start here to modify behavior

## Reference

- [Voice rules](.claude/skills/name/refs/voice.md): prose constraints for generated output

## Optional

- [License](LICENSE.md): MIT
```

## The link line

`- [Title](url): description` — the description is the whole point. It tells an agent
whether opening the file is worth the tokens.

> ✅ `- [SKILL.md](.claude/skills/mkpub/SKILL.md): mode router — dispatches to refs/protocol-*.md`
> ❌ `- [SKILL.md](.claude/skills/mkpub/SKILL.md): the skill file`

Write descriptions for a reader deciding what to skip. "The skill file" is what the path
already said.

## Sections

- **Docs** — the primary path. What you'd hand someone on day one.
- **Reference** — deeper material, read on demand.
- **Optional** — explicitly cuttable. Per the spec, an agent under context pressure drops
  this section first. Put license, changelog, and contributing here.

Skip any section that would be empty. Three well-described links beat twelve links.

## Links

**With a GitHub remote**, use absolute raw URLs — an agent fetching llms.txt over HTTP
can't resolve a relative path:

```
https://raw.githubusercontent.com/<owner>/<repo>/main/README.md
```

**Without one**, use repo-relative paths and note that the file is local-only.

Either way, **verify every path exists before writing it.** A dead link in llms.txt sends
an agent looking for a file that isn't there, which is worse than omitting it. Check with
`ls` or `find`, not from memory.

## Scale

Under 40 lines for most repos. If it's longer than the README, it's not an index anymore.

Large or documentation-heavy projects sometimes also ship `llms-full.txt` — the full docs
concatenated into one fetchable blob. Only suggest it if the repo has substantial prose
docs already; don't scaffold an empty one.
