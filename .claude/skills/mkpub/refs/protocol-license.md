# Protocol: --license

Writes `LICENSE.md`.

## Steps

1. **Check for an existing license** — `LICENSE`, `LICENSE.md`, `LICENSE.txt`, the
   `license` field in `package.json` / `pyproject.toml`. If one exists, read it and
   confirm rather than assume.
2. **Ask via AskUserQuestion. Always.** Licensing is a legal choice with consequences the
   user has to live with. Never pick one silently, not even when `package.json` says
   `"license": "MIT"` — that field is frequently a leftover default.
3. Resolve the copyright line.
4. Write the full text to `LICENSE.md`.
5. Update the README's License section and any license badge to match.

## The question

Recommendation first, labelled `(Recommended)`. Recommend by repo type:

| Repo type | Recommend | Because |
|---|---|---|
| Skill repo, library, CLI, template | **MIT** | Shortest permissive license, near-universal in this space, no adoption friction |
| Anything with patent exposure, or a corporate contributor | **Apache-2.0** | Same permissions as MIT plus an explicit patent grant |
| A project whose whole point is staying open | **GPL-3.0** | Copyleft — forks must also open-source |
| Prose, docs, design tokens, non-code content | **CC BY 4.0** | A content license; software licenses fit content badly |

Offer four options. Write each description in terms of what it lets other people do, not
in license jargon — the user is choosing a policy, not reciting SPDX.

> ✅ "Anyone can use, fork, and ship it commercially; they just keep your copyright notice."
> ❌ "A permissive license with minimal conditions on redistribution."

## The copyright line

Every license needs a year and a holder. Resolve in this order and **ask if it comes out
ambiguous** — a wrong name in a license file is worse than a question:

```bash
git config user.name          # holder
git log -1 --format=%cd       # year — most recent commit
git log --reverse -1 --format=%cd   # first year, for a range
```

- **Year**: the current year for a new project. `2024–2026` if the repo spans years.
- **Holder**: a person's name, or an organization if the repo is org-owned. Not a
  username, not an email. If git config gives you a handle rather than a name, ask.
- Never write `<year>` or `[fullname]` placeholders into the file. That's not a license;
  it's a template someone forgot to fill in.

## Texts

Do not paraphrase, reformat, or "clean up" license text. Reproduce it exactly — the
wording is the legal instrument. Only the year and holder get substituted.

- **MIT** and **BSD-3-Clause** are short enough to write from memory; double-check the
  clause count and the all-caps warranty disclaimer.
- **Apache-2.0**, **GPL-3.0**, **MPL-2.0**, **CC BY 4.0** are long. Fetch the canonical
  text rather than reciting it:

```bash
curl -sL https://raw.githubusercontent.com/spdx/license-list-data/main/text/Apache-2.0.txt
```

Any SPDX identifier works in that URL. If the fetch fails, tell the user and link them to
`https://spdx.org/licenses/` — do not approximate a 200-line legal text from memory.

## MIT reference

```
MIT License

Copyright (c) [year] [holder]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## A note on LICENSE.md

GitHub detects the license from `LICENSE`, `LICENSE.md`, or `LICENSE.txt` equally, so the
`.md` extension costs nothing and renders. But GitHub's detector matches on exact text —
so don't add a heading, a preamble, or markdown formatting above the license body. The
file contains the license and nothing else.
