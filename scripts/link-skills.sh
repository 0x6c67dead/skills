#!/usr/bin/env bash
set -euo pipefail

# Symlinks every skill in this repo into the local skill directories used by
# each harness:
#   - ~/.zcode/skills: ZCode
#   - ~/.agents/skills: Agent Skills-compatible harnesses
# Each entry is a symlink into this repo, so a `git pull` is all that's needed
# to keep installed skills up to date. Re-run after adding/renaming skills.

REPO="$(cd "$(dirname "$0")/.." && pwd)"
DESTS=("$HOME/.zcode/skills" "$HOME/.agents/skills")

names=()
srcs=()
while IFS= read -r -d '' skill_md; do
  src="$(dirname "$skill_md")"
  names+=("$(basename "$src")")
  srcs+=("$src")
done < <(find "$REPO/skills" -name SKILL.md -print0)

for DEST in "${DESTS[@]}"; do
  mkdir -p "$DEST"

  for i in "${!names[@]}"; do
    name="${names[$i]}"
    src="${srcs[$i]}"
    target="$DEST/$name"

    if [ -e "$target" ] && [ ! -L "$target" ]; then
      echo "warning: $target exists and is not a symlink into this repo; skipping (remove it and re-run to link)" >&2
      continue
    fi

    ln -sfn "$src" "$target"
    echo "linked $name -> $src ($DEST)"
  done
done
