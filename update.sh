#!/bin/bash
# Email Sender Extension - Update Script for Mac/Linux
# Run this to update to the latest version from GitHub

set -e

# Colors
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

echo ""
echo -e "${CYAN}╔════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║   🔄 Email Sender Extension Updater      ║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════╝${NC}"
echo ""

EXTENSION_PATH="$HOME/.vscode/extensions/email-sender-1.0.0"

# Check if extension is installed
if [ ! -d "$EXTENSION_PATH" ]; then
    echo -e "${RED}❌ Extension not found!${NC}"
    echo -e "${YELLOW}Please install it first using install.sh${NC}"
    exit 1
fi

echo -e "${CYAN}📍 Extension location: $EXTENSION_PATH${NC}"
echo ""

# Navigate to extension directory
cd "$EXTENSION_PATH"

# Fetch latest changes
echo -e "${CYAN}📥 Fetching updates from GitHub...${NC}"
git fetch origin > /dev/null 2>&1

# Check if updates are available
LOCAL_COMMIT=$(git rev-parse HEAD)
REMOTE_COMMIT=$(git rev-parse origin/main)

if [ "$LOCAL_COMMIT" = "$REMOTE_COMMIT" ]; then
    echo -e "${GREEN}✓ Already up to date!${NC}"
    echo ""
    exit 0
fi

# Pull latest changes
echo -e "${CYAN}🔄 Pulling latest changes...${NC}"
git pull origin main > /dev/null 2>&1
echo -e "${GREEN}✓ Code updated successfully${NC}"

# Update dependencies
echo ""
echo -e "${CYAN}📦 Updating dependencies...${NC}"
npm install --silent > /dev/null 2>&1
echo -e "${GREEN}✓ Dependencies updated${NC}"

# Success
echo ""
echo -e "${GREEN}╔════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║         ✅ Update Complete!               ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${YELLOW}🚀 Please restart VS Code to use the updated version!${NC}"
echo ""