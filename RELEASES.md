# Releases

What's new for you, release by release.

## v1.0.0 — 2026-07-17

> mkpub is here. Point it at a repository and it writes the four files a stranger needs when they land on your project cold — a README, a license, a security policy, and an index for AI agents — by reading the repo itself rather than asking you to describe it. It was built for skill repos, where the product is markdown and there's no package to point at, but it works anywhere.

### ✨ New
- Generate a complete README with one command. You get a centered title, a live badge row, and seven sections covering what your project does, how to install it, how it works, how to update it, an FAQ, the license, and acknowledgments — so a newcomer can orient themselves without asking you.
- Add a license without leaving your editor. mkpub asks which one you want rather than guessing, because relicensing later can require every contributor's consent.
- Add a security policy with a reporting channel that actually resolves, so someone who finds a vulnerability knows where to send it.
- Publish an `llms.txt` index, so AI agents landing in your repo know which files to open and which to ignore instead of burning their context window on a guess.
- Refresh your docs as the project moves with a single update command. It re-scans and fixes only what actually drifted — dead links, stale version numbers, renamed skills, last year's copyright — and leaves wording you chose alone.
- Run any combination of the above, or all four at once. Running mkpub with no arguments sets up everything from scratch.

### 📈 Improved
- Your existing words are safe. If a file already exists, mkpub asks whether to merge, replace, or skip — and merging keeps your prose while changing only the scaffolding around it.
- Nothing is invented. Where a section can't be written honestly — acknowledgments, benchmarks, screenshots — mkpub leaves a note about what belongs there and tells you what it scaffolded, rather than filling the gap with something plausible you'd have to find and correct later.
- Questions stay rare. mkpub reads your repo first and only asks about what it genuinely couldn't work out, batched into a single prompt instead of one interruption per file.
- Your header looks the same on every machine. The four title fonts ship with the skill, so there's no silent fallback to a different-looking font on a machine that's missing one.
