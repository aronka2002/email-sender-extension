#!/bin/bash
# Email Sender Extension - Uninstall Script for Mac/Linux
# Run this to completely remove the extension

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
GRAY='\033[0;90m'
NC='\033[0m' # No Color

echo ""
echo -e "${RED}╔════════════════════════════════════════════╗${NC}"
echo -e "${RED}║   🗑️  Email Sender Extension Uninstaller  ║${NC}"
echo -e "${RED}╚════════════════════════════════════════════╝${NC}"
echo ""

EXTENSION_PATH="$HOME/.vscode/extensions/email-sender-1.0.0"

# Check if extension is installed
if [ ! -d "$EXTENSION_PATH" ]; then
    echo -e "${GREEN}✓ Extension is not installed${NC}"
    echo ""
    exit 0
fi

echo -e "${CYAN}📍 Found extension at: $EXTENSION_PATH${NC}"
echo ""

# Confirm uninstall
read -p "Are you sure you want to uninstall? (y/N): " confirm
if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
    echo -e "${YELLOW}❌ Uninstall cancelled${NC}"
    exit 0
fi

echo ""
echo -e "${YELLOW}🗑️  Removing extension...${NC}"

# Remove extension directory
if rm -rf "$EXTENSION_PATH" 2>/dev/null; then
    echo ""
    echo -e "${GREEN}╔════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║      ✅ Uninstall Complete!               ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${WHITE}The extension has been removed successfully.${NC}"
    echo -e "${YELLOW}Please restart VS Code.${NC}"
    echo ""
else
    echo ""
    echo -e "${RED}❌ Failed to remove extension${NC}"
    echo -e "${YELLOW}Please close VS Code and try again, or manually delete:${NC}"
    echo -e "${GRAY}$EXTENSION_PATH${NC}"
    echo ""
    exit 1
fi