#!/usr/bin/env bash
#
# mkpub installer — installs the mkpub skill globally for Claude Code on macOS.
#
#   Local clone:  ./install.sh
#   Remote:       curl -fsSL https://raw.githubusercontent.com/ndisisnd/mkpub/main/install.sh | bash
#
set -euo pipefail

REPO="ndisisnd/mkpub"
SKILL="mkpub"
DEST="${HOME}/.claude/skills/${SKILL}"

bold=$'\033[1m'; dim=$'\033[2m'; red=$'\033[31m'; green=$'\033[32m'; yellow=$'\033[33m'; off=$'\033[0m'
say()  { printf '%s\n' "$*"; }
ok()   { printf '%s✓%s %s\n' "$green" "$off" "$*"; }
warn() { printf '%s!%s %s\n' "$yellow" "$off" "$*"; }
die()  { printf '%s✗%s %s\n' "$red" "$off" "$*" >&2; exit 1; }

[ "$(uname -s)" = "Darwin" ] || die "This installer is macOS only. On Linux, copy the skill directory to ~/.claude/skills/${SKILL} and install figlet with your package manager."

command -v git >/dev/null 2>&1 || die "git is required but not installed."

# ---------------------------------------------------------------- locate source
# Running from a clone (install.sh sits next to .claude/skills/mkpub) uses that
# copy. Piped from curl there is no source on disk, so clone one to a temp dir.
SRC=""
if [ -n "${BASH_SOURCE[0]:-}" ] && [ -f "${BASH_SOURCE[0]}" ]; then
  HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  [ -f "${HERE}/.claude/skills/${SKILL}/SKILL.md" ] && SRC="${HERE}/.claude/skills/${SKILL}"
fi

TMP=""
cleanup() { [ -n "$TMP" ] && rm -rf "$TMP"; return 0; }  # return 0: trap status is the exit status
trap cleanup EXIT

if [ -z "$SRC" ]; then
  say "${dim}Fetching ${REPO}…${off}"
  TMP="$(mktemp -d)"
  git clone --depth 1 --quiet "https://github.com/${REPO}.git" "${TMP}/repo" \
    || die "Could not clone https://github.com/${REPO}.git"
  SRC="${TMP}/repo/.claude/skills/${SKILL}"
fi

[ -f "${SRC}/SKILL.md" ] || die "No SKILL.md found at ${SRC} — the source tree looks wrong."

# ------------------------------------------------------------------- install it
if [ -e "$DEST" ]; then
  warn "Replacing the existing install at ${DEST}"
  rm -rf "$DEST"
fi

mkdir -p "$(dirname "$DEST")"
cp -R "$SRC" "$DEST"
ok "Installed ${bold}${SKILL}${off} to ${DEST}"

# ---------------------------------------------------------------------- figlet
# Required for the README header. mkpub errors out rather than falling back to a
# font that renders differently, so a missing figlet is worth flagging loudly.
if command -v figlet >/dev/null 2>&1; then
  ok "figlet found ($(command -v figlet))"
elif command -v brew >/dev/null 2>&1; then
  say "${dim}Installing figlet via Homebrew…${off}"
  if brew install figlet; then
    ok "figlet installed"
  else
    warn "figlet install failed. Run 'brew install figlet' yourself — README headers need it."
  fi
else
  warn "figlet is missing and Homebrew isn't installed."
  say "  ${dim}Install Homebrew from https://brew.sh, then: brew install figlet${off}"
  say "  ${dim}Without figlet, --readme will stop rather than render a wrong header.${off}"
fi

say ""
say "Run ${bold}/mkpub --help${off} in Claude Code to see the modes."
