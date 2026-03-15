# gstack-windsurf — Windsurf IDE Integration for gstack

This directory contains modifications and additions to make gstack work seamlessly within the Windsurf IDE (Cascade) for Salesforce development workflows.

## Files

### `gstack-windsurf`
Main wrapper script that provides Salesforce-aware browser automation:
- `goto-org [org-alias]` — Navigate to your Salesforce org
- `goto-record <record-id> [org-alias]` — Navigate to a specific record
- `record-screenshot <record-id> [org-alias]` — Navigate and screenshot a record
- `screenshot [path]` — Take screenshot of current page
- `browse <args...>` — Pass through to gstack browse binary

### `gstack-windsurf-shell-setup.sh`
Shell setup script that adds convenient aliases:
- `gstack` — Main command
- `gsf` — goto-org shortcut
- `gss` — screenshot shortcut  
- `gsb` — browse shortcut

## Installation

From Windsurf Cascade chat:
```bash
# Clone your fork (after forking on GitHub)
git clone https://github.com/YOUR_USERNAME/gstack.git ~/Repositories/gstack

# Install and build
cd ~/Repositories/gstack && ./setup

# Use from any project directory
~/Repositories/gstack/windsurf/gstack-windsurf goto-org mydevorg
```

## Salesforce Authentication

The script integrates with `sf` CLI to get session tokens automatically:
```bash
# Ensure you're authenticated
sf org login -a mydevorg

# The wrapper will use your active session
~/Repositories/gstack/windsurf/gstack-windsurf record-screenshot a0AHp000010KISjMAO
```

## Usage Examples

### Screenshot a record page:
```bash
~/Repositories/gstack/windsurf/gstack-windsurf browse goto "https://415-dev-ed.my.salesforce.com/a0AHp000010KISjMAO"
sleep 10
~/Repositories/gstack/windsurf/gstack-windsurf screenshot /tmp/record.png
```

### QA workflow:
```bash
# Navigate and check console
~/Repositories/gstack/windsurf/gstack-windsurf browse goto "https://415-dev-ed.lightning.force.com"
~/Repositories/gstack/windsurf/gstack-windsurf browse console --errors

# Get snapshot for interaction
~/Repositories/gstack/windsurf/gstack-windsurf browse snapshot -i
~/Repositories/gstack/windsurf/gstack-windsurf browse click @e5
```

## Differences from Original gstack

- **Location**: Original uses `~/.claude/skills/`, this uses `~/Repositories/gstack`
- **Authentication**: Added Salesforce `sid` cookie injection from `sf` CLI
- **Commands**: Added `goto-record` and `record-screenshot` helpers
- **IDE**: Optimized for Windsurf/Cascade environment

## Contributing Back

This is a fork-specific addition. To contribute improvements back to the original gstack:
1. Make changes in `windsurf/` directory
2. Test within Windsurf
3. Submit PR to `garrytan/gstack` with Windsurf-specific documentation
