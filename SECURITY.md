# Security policy

## Reporting a vulnerability

Please don't open a public issue for a security problem. Report it privately through
[GitHub's private vulnerability reporting](https://github.com/ndisisnd/mkpub/security/advisories/new)
— it goes straight to the maintainers and stays closed until there's a fix.

Include what you can: what the issue is, how to reproduce it, and what an attacker could
do with it. A rough report is more useful than no report.

You'll get an acknowledgment as soon as a maintainer sees it. Once a fix ships, you'll be
credited in the advisory unless you'd rather not be.

## Supported versions

mkpub is distributed from `main`. Fixes land on `main`; there are no maintained release
branches. Use the latest commit.

## Scope

mkpub is a Claude Code skill — markdown instructions plus four bundled figlet fonts. It
has no server, no network listener, no credentials, and no build step. What it does at
runtime is read files in the repo you point it at, run `figlet` and `git`, fetch license
text from `spdx.org`, and write four files to the repo root.

That makes the realistic surface small, and worth being specific about:

- **What it writes.** mkpub creates `README.md`, `LICENSE.md`, `SECURITY.md`, and
  `llms.txt` at the repo root. It should never write outside the target repo. A path that
  escapes the repo root is a bug worth reporting.
- **What it reads.** The scan step reads repo files to gather context. If it reads
  something outside the repo, or surfaces the contents of a file that shouldn't be in
  generated output (`.env`, a key, a token), that's a bug worth reporting.
- **What it fetches.** License text comes from `raw.githubusercontent.com/spdx/`. Badge
  URLs point at `badgen.net` and render on GitHub's image proxy. Fonts are bundled, so
  nothing is fetched to render a header.
- **The bundled fonts.** `refs/fonts/*.flf` are third-party data files parsed by figlet.
  They came from [xero/figlet-fonts](https://github.com/xero/figlet-fonts). If one is
  malformed or tampered with, figlet parses it — report anything suspicious there.

mkpub runs with whatever permissions the agent running it has. It doesn't request or
store any of its own.

## Disclosure

Report privately, and please hold off on publishing until a fix is out. Fixed issues are
published as a GitHub advisory with credit to the reporter.
