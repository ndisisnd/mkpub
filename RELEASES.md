# Releases

What's new for you, release by release.

## v1.1.1 — 2026-07-18

> READMEs mkpub generates for you now include a one-line credit back to mkpub itself, added automatically to every Acknowledgments section it writes.

### ✨ New
- Every README mkpub generates for you now includes a byline crediting mkpub in the Acknowledgments section, with a link back to its repo — so readers can find the tool that built the docs.

## v1.1.0 — 2026-07-17

> You no longer have to open mkpub's source to find out what it can do. Type `/mkpub` and every mode is listed right there in the prompt, and `/mkpub --help` spells out what each one does in a line. Installing is a single command on macOS, and it brings the font renderer along with it so the first thing you run doesn't stop halfway.

### ✨ New
- See every mode as you type. `/mkpub` now shows its full list of options in the prompt, so you can pick one without remembering the names or going back to the docs.
- Ask mkpub what it does. `/mkpub --help` prints each mode with a one-line description of what it writes — and it answers instantly, without reading your repo or asking you anything.
- Install on macOS in one command, from anywhere. It sets mkpub up for every project on your machine and installs the font renderer if you don't have it, so `--readme` works the first time you try it. Running it again upgrades what's already there.

### 📈 Improved
- The install instructions now say upfront that the quickest route doesn't include the font renderer, and how to add it — so you find out before a header fails to render rather than after.

### 🐛 Fixed
- Asking for everything at once no longer risks writing your README before the files it links to exist.

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
