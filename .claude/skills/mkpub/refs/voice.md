# Voice

Read this before writing README prose. Three rules, in priority order.

## Scope

**README prose only.** Not `--desc`, not `--tag`.

A GitHub description is a different register — dense, clipped, and fragments are correct
there. `Library, proxy, MCP server.` is a good description and a bad README sentence.
Applying rule 1 to a description flattens exactly the density that makes it work. See
`protocol-desc.md`, which overrides this file.

Rule 3 (matter-of-fact) is the one thing that carries everywhere: no invented numbers, no
intensifiers doing work an actual claim should do.

## 1. Human-readable and conversational

Write it the way you'd explain the project to someone who just sat down next to you.
Full sentences. Normal words. A second-person "you" when you mean the reader.

The test: read the sentence out loud. If you'd never say it out loud, rewrite it.

> ✅ mkpub reads your repo, asks what it can't figure out, and writes the four files.
> ❌ mkpub facilitates automated generation of repository documentation artifacts.

## 2. Not casual, not formal

You're a competent colleague, not a hype account and not a legal department.

**Not casual** — no exclamation marks, no emoji in prose, no "Let's dive in!", no
"Boom 💥", no rhetorical questions used as headers, no jokes that cost the reader a
second read.

**Not formal** — no "herein", no "one may observe", no "it should be noted that", no
passive voice used to sound impressive, no third-person self-reference ("the authors").

> ✅ Badges break when the repo has no GitHub remote, so mkpub asks for the slug first.
> ❌ Badges break when there's no remote — annoying, right?! So we just ask. 🎯
> ❌ In the absence of a configured remote, the slug is solicited from the operator.

## 3. Matter-of-fact

Say what the thing does. Don't sell it. The reader decides if it's good.

Cut every intensifier: *blazingly fast, powerful, seamless, effortless, revolutionary,
game-changing, simply, just, easily, robust, elegant, beautiful, magic*. If a claim
survives without its adjective, the adjective was doing nothing. If it doesn't survive,
the claim was the adjective.

Numbers are allowed only if you measured them. "60% fewer tokens" needs a benchmark in
the repo. "Much faster" needs deleting.

> ✅ The font is bundled, so the header renders the same on every machine.
> ❌ The font is bundled for a seamless, blazingly fast experience across any environment.

## Structure follows the same rules

- **Headers say what the section is**, in the words a reader would search for.
  "How it works", not "Under the Hood ⚡".
- **Lead with the thing.** First sentence of every section answers the header. Context
  after, not before.
- **Prose over bullets** for anything with a because in it. Bullets are for lists of
  parallel facts — flags, files, options — not for chopped-up paragraphs.
- **Tables for enumerable facts only** — flags, files, versions. Explanation goes in the
  sentence next to the table, not inside a cell.
- **Show, then explain.** A code block the reader can paste, then one sentence on what it
  did. Not three paragraphs of preamble.

## The bar

A stranger lands on the README cold. In thirty seconds they should know what this is,
whether it's for them, and what to type first. Every sentence that doesn't serve that
is a sentence to cut.
