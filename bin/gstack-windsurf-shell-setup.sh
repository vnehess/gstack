#!/bin/zsh
# Source this file to add gstack-windsurf to your PATH and create aliases
# Usage: source ~/Repositories/gstack/bin/gstack-windsurf-shell-setup.sh

GSTACK_DIR="${HOME}/Repositories/gstack"
PLM_DIR="${HOME}/Repositories/PLM"

# Add to PATH if not already there
if [[ ":$PATH:" != *":$GSTACK_DIR/bin:"* ]]; then
    export PATH="$GSTACK_DIR/bin:$PATH"
fi

# Main alias
alias gstack='gstack-windsurf'

# Shortcuts for common operations
alias gsf='gstack-windsurf goto-org'      # gsf mydevorg
alias gss='gstack-windsurf screenshot'    # gss /tmp/page.png
alias gsb='gstack-windsurf browse'        # gsb goto <url>

echo "gstack-windsurf configured:"
echo "  Commands: gstack, gsf (goto-org), gss (screenshot), gsb (browse)"
echo "  GSTACK_DIR: $GSTACK_DIR"
echo "  PLM_DIR: $PLM_DIR"
