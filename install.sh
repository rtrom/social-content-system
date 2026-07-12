#!/usr/bin/env bash
# Install the Social Content System skills/agents/commands into a Claude Code target.
#
# Usage:
#   ./install.sh                # install to ~/.claude (global — available in every project)
#   ./install.sh /path/to/proj  # install into a specific project's .claude/ directory
#   ./install.sh --global        # explicit global install (same as no argument)
#
# Skills, agents, and commands are copied (not symlinked) so the target keeps working
# even if this repo moves. Re-running overwrites the installed copies with this repo's.
set -euo pipefail

SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

TARGET_ARG="${1:-}"
if [[ -z "$TARGET_ARG" || "$TARGET_ARG" == "--global" ]]; then
  DEST_ROOT="$HOME"
  echo "Installing globally to ~/.claude"
else
  DEST_ROOT="$TARGET_ARG"
  echo "Installing into project: $DEST_ROOT"
  if [[ ! -d "$DEST_ROOT" ]]; then
    echo "error: target directory does not exist: $DEST_ROOT" >&2
    exit 1
  fi
fi

DEST="$DEST_ROOT/.claude"
mkdir -p "$DEST/skills" "$DEST/agents" "$DEST/commands"

copy_tree() {
  local sub="$1"
  if [[ -d "$SRC_DIR/.claude/$sub" ]]; then
    cp -R "$SRC_DIR/.claude/$sub/." "$DEST/$sub/"
    echo "  ✓ $sub"
  fi
}

echo "Copying into $DEST ..."
copy_tree skills
copy_tree agents
copy_tree commands

# CLAUDE.md only makes sense for a project-local install (it's project context).
if [[ -n "$TARGET_ARG" && "$TARGET_ARG" != "--global" ]]; then
  cp "$SRC_DIR/CLAUDE.md" "$DEST_ROOT/CLAUDE.md"
  echo "  ✓ CLAUDE.md → project root"
fi

echo ""
echo "Done. Restart Claude Code so it loads the new skills/agents/commands."
echo "Next: run the 'brand-voice' skill once before producing any content."
