# Protocol: --security

Writes `SECURITY.md`. GitHub reads this path and surfaces it as the repo's "Report a
vulnerability" policy, so the filename is fixed.

## Steps

1. Check for an existing `SECURITY.md`, `.github/SECURITY.md`, or `docs/SECURITY.md`.
2. Resolve a reporting channel — see [Contact](#contact).
3. Resolve supported versions from tags or the manifest — see [Supported versions](#supported-versions).
4. Write the policy.

## What this file is for

One reader: somebody who found a vulnerability and needs to know where to send it without
posting it publicly. Everything that doesn't serve that reader is padding.

The policy is general — the same shape fits nearly every repo. Don't invent a threat
model, a bug-bounty program, a CVE process, or a security team the project doesn't have.
A small repo's honest policy is four short sections.

## Contact

The one field that must be real. Resolve in this order:

1. **GitHub private vulnerability reporting** — the default recommendation. It's free,
   built in, and needs no address. Link:
   `https://github.com/<owner>/<repo>/security/advisories/new`
2. An email address already published in the repo (`package.json` author, an existing
   SECURITY file, CODE_OF_CONDUCT).
3. **Ask.** Offer private advisories (recommended), an email address, or "no private
   channel — public issues only."

Never guess an address. Never write `security@<project>.com` unless that mailbox exists.
A dead security contact is a security problem.

Note that private reporting must be enabled in repo settings before the advisory link
works — mention this to the user, since it's off by default.

## Supported versions

```bash
git tag --sort=-v:refname | head -5
```

Only claim support you'll honor. For an unversioned project — most skill repos — say so
plainly:

```markdown
## Supported versions

This project is distributed from `main`. Fixes land on `main`; there are no
maintained release branches. Use the latest commit.
```

For a tagged project, a two-column table of version and supported ✅/❌ is enough.

## Response times

State a window only if the user commits to one. Otherwise use a best-effort sentence
without a number in it. An unmet 48-hour promise is worse than no promise.

## Template

```markdown
# Security policy

## Reporting a vulnerability

Please don't open a public issue for a security problem. Report it privately through
[GitHub's private vulnerability reporting](https://github.com/OWNER/REPO/security/advisories/new)
— it goes straight to the maintainers and stays closed until there's a fix.

Include what you can: what the issue is, how to reproduce it, and what an attacker
could do with it. A rough report is more useful than no report.

You'll get an acknowledgment as soon as a maintainer sees it. Once a fix ships,
you'll be credited in the advisory unless you'd rather not be.

## Supported versions

[table, or the from-main sentence]

## Scope

[What the project actually touches — see below.]

## Disclosure

Report privately, and please hold off on publishing until a fix is out. Fixed issues
are published as a GitHub advisory with credit to the reporter.
```

## Scope

The section worth tailoring, because it's the one the reader can't infer. Say what the
project touches — that's what determines what a vulnerability in it even looks like.

Base it on the scan, not on a guess. Two honest sentences beat a generic list:

> mkpub runs locally, writes files into the repo you point it at, and fetches license
> text from spdx.org. It has no server, no network listener, and no credentials. The
> realistic surface is what it writes and what it fetches.

If the project *does* have a server, credentials, or user data, say that instead — and
don't downplay it.
