# Protocol: --tag

Generates GitHub repository topics — the tags under the About panel, and the main way
people find a repo they weren't already looking for.

## Terminal only

**Never write these to a file.** Print them and stop. The user pastes them into GitHub's
topics field. Don't offer to save them anywhere.

## Limits

GitHub enforces these; a topic that breaks one is silently rejected:

- **20 topics maximum.** This is the number to hit — see below.
- **Lowercase only.** `Claude-Code` becomes `claude-code`, so write it lowercase.
- **Letters, numbers, hyphens.** No spaces, dots, slashes, or underscores. `llms.txt` is
  not a valid topic; `llms-txt` is.
- **Must start with a letter or number.** `-wip` is invalid.
- **50 characters each.** Not a real constraint — a topic that long isn't searchable.

## Use all 20

Both reference repos use exactly 20/20. That's the correct read: topics are free
discovery surface, and an unused slot is a search you don't appear in. Fill all twenty.

If you can't find 20 honest topics, the shortfall is a signal you haven't thought about
adjacency yet — go back to the categories below rather than padding with junk.

## The five categories

Draw from all five. A list that's twenty flavors of one category is a list that only
reaches people who already found you.

| Category | Examples |
|---|---|
| **Language / runtime** | `python` `typescript` `react` `nextjs` `fastapi` |
| **Domain** | `compression` `design-system` `ui-design` `documentation` |
| **Ecosystem you plug into** | `mcp` `langchain` `claude-code` `cursor` `tailwindcss` `radix-ui` |
| **Vendors** | `anthropic` `openai` |
| **Concepts people search** | `rag` `llm` `prompt-engineering` `context-window` `token-optimization` `vibe-coding` |

## Tag the ecosystem, not just the implementation

The pattern worth copying from the reference repos: they tag what they *interoperate
with*, not only what they're *built from*.

Headroom tags `openai`, `langchain`, `cursor`, `fastapi` — it isn't any of those things,
it works with them. Styleseed tags `shadcn-ui`, `radix-ui`, `nextjs` for the same reason.
Somebody searching `langchain` has the problem headroom solves.

**The line this must not cross:** only tag an ecosystem the repo genuinely supports. A
`cursor` topic on something that only runs in Claude Code is a lie that costs you the
click and the trust. When in doubt, check the repo before tagging.

## Both forms of a term

Search is literal, and people type differently. Where a term has a common variant, spend
slots on both — the reference repos do (`shadcn-ui` **and** `shadcn`; `ai-ui` **and**
`ai-design`; `claude-code` **and** `claude-skills`).

Worth doubling: `readme` / `readme-generator`, `docs` / `documentation`,
`ascii-art` / `figlet`. Don't double a term nobody searches.

## Ask only on a real fork

Most tag sets have no decision in them — derive them and print them. Ask via
`AskUserQuestion` only when the scan leaves a genuine ambiguity that changes the list:

- The repo is polyglot and the primary language isn't obvious (`python` vs `typescript`
  slots).
- More than 20 honest candidates, and the cut is a positioning call.
- The project could be framed for two different audiences.

Don't ask "do you like these tags?" — that's not a decision, it's a review, and the
output is right there to read.

## Output

Print space-separated, which is what GitHub's field accepts pasted:

````
```
python agent typescript compression ai proxy mcp tokens openai cursor rag fastapi llm prompt-engineering langchain anthropic context-window claude-code token-optimization context-engineering
```
20 / 20 topics
````

Then say where they go: **Repo → About → ⚙️ → Topics**.

If strong candidates lost the cut, list them under the block as runners-up with one line
on what each would cost. The user may weigh a slot differently than you did — that's the
kind of thing they can act on without another round-trip.
