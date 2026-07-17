# Protocol: --desc

Generates a GitHub repository description — the one line under the repo name, and the
text that shows up in GitHub search results and social cards.

## Terminal only

**Never write this to a file.** Not to the README, not to a scratch file, not to
`package.json`. Print it in your response and stop. The user pastes it into GitHub's
description field themselves.

Don't offer to save it. Don't ask where to put it. There is nowhere to put it.

## voice.md does not apply here

`refs/voice.md` governs README prose — full sentences, conversational, no fragments. A
GitHub description is the opposite register: dense, clipped, fragments are correct. It's
a search index entry that a human happens to read.

> ✅ `Library, proxy, MCP server.`
> ❌ `You can use it as a library, run it as a proxy, or connect it as an MCP server.`

Read this file instead of `voice.md` for `--desc`. The two conflict on purpose.

## Limits

- **350 characters**, hard — GitHub truncates past it. Aim 180–290.
- Plain text. No markdown; links and `**bold**` render literally.
- Emoji render but cost characters and read as noise. Skip them.

## The formula

Both reference descriptions follow the same three beats. Use them in this order:

**1 — Open with the thing.** Verb-first or noun-phrase-first. Never a category preamble.

> ✅ `Compress tool outputs, logs, files, and RAG chunks before they reach the LLM.`
> ✅ `Design engine for Claude Code, Codex & Cursor — teaches design judgment, not just data.`
> ❌ `A powerful tool that helps you compress...`
> ❌ `A Python library for...`

If there's a differentiator, put it in this beat with an em-dash: *teaches design
judgment, **not just data***. That clause is doing the positioning work.

**2 — Countables.** The beat that separates a real description from a pitch. Numbers you
counted, inventory you can point at.

> ✅ `74 rules, 48 components, 7 brand skins (Toss/Stripe/Linear/Notion/Raycast/Arc/Vercel), 15 /ss-* skills`
> ✅ `20% fewer tokens for coding agents, 60-95% fewer tokens for JSON, same answers`

Name the brands, presets, or integrations in parentheses — every one is a search term
someone types. This is where keyword density comes from honestly.

**Every number must be one you counted from the repo.** `ls`, `grep -c`, read the manifest.
A performance number needs a benchmark in the repo. No benchmark, no number — use
inventory instead.

**3 — Close on the surfaces, the hook, or the license.**

> ✅ `Library, proxy, MCP server.` — the forms it comes in
> ✅ `Stop shipping AI UI that looks generated. MIT.` — the outcome, then the license

Append `MIT.` (or the real license) only if the license is a selling point — permissive
on something people would expect to be paid. Don't append `GPL-3.0.` as a lure.

## Keywords

GitHub indexes this text. A term that isn't in the description or the topics is a term
nobody finds you by. So the words matter — but only real ones.

Work in the ecosystem names the project genuinely touches (`MCP`, `RAG`, `Claude Code`,
`Cursor`). Don't stuff a framework the project doesn't support; a description that
promises Cursor support the repo doesn't have is a bug report waiting to happen.

## Ask

A description is a positioning choice, so generate **three variants at different angles**
and ask via `AskUserQuestion`. Put the full text in each option's `preview` with its
character count — the user is choosing between texts, so show the texts.

The three angles that reliably differ:

| Angle | Opens with |
|---|---|
| **Function** | What it does, verb-first. Safest default. |
| **Problem** | The thing that's wrong without it. |
| **Inventory** | What you get — leads with the countables. |

## Output

Print the chosen one in a fenced block for clean copying, with the count:

````
```
Compress tool outputs, logs, files, and RAG chunks before they reach the LLM.
20% fewer tokens for coding agents, 60-95% fewer tokens for JSON, same answers.
Library, proxy, MCP server.
```
185 / 350 characters
````

Then tell them where it goes: **Repo → About → ⚙️ → Description**. Paste as one line;
the wrap above is for reading only.
