#!/bin/bash
# Email Sender Extension - Mac/Linux Installer
# Run this script to install the extension directly from GitHub

set -e

# Colors
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
WHITE='\033[1;37m'
GRAY='\033[0;90m'
NC='\033[0m' # No Color

echo ""
echo -e "${CYAN}╔════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║   📧 Email Sender Extension Installer    ║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════╝${NC}"
echo ""

EXTENSION_PATH="$HOME/.vscode/extensions/aronka.email-sender-1.0.0"
REPO_URL="https://github.com/aronka2002/email-sender-extension.git"

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ Error: Git is not installed!${NC}"
    echo -e "${YELLOW}Please install Git first${NC}"
    exit 1
fi

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo -e "${RED}❌ Error: Node.js/npm is not installed!${NC}"
    echo -e "${YELLOW}Please install Node.js from: https://nodejs.org/${NC}"
    exit 1
fi

# Remove old version if exists
if [ -d "$EXTENSION_PATH" ]; then
    echo -e "${YELLOW}🗑️  Removing old version...${NC}"
    rm -rf "$EXTENSION_PATH"
    echo -e "${GREEN}✓ Old version removed${NC}"
fi

# Clone repository
echo ""
echo -e "${CYAN}📥 Cloning from GitHub...${NC}"
if git clone "$REPO_URL" "$EXTENSION_PATH" > /dev/null 2>&1; then
    echo -e "${GREEN}✓ Repository cloned successfully${NC}"
else
    echo -e "${RED}❌ Failed to clone repository. Check your internet connection.${NC}"
    exit 1
fi

# Install dependencies
echo ""
echo -e "${CYAN}📦 Installing dependencies...${NC}"
cd "$EXTENSION_PATH"
if npm install --silent > /dev/null 2>&1; then
    echo -e "${GREEN}✓ Dependencies installed successfully${NC}"
else
    echo -e "${RED}❌ Failed to install dependencies.${NC}"
    exit 1
fi

# Success message
echo ""
echo -e "${GREEN}╔════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║        ✅ Installation Complete!          ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${CYAN}📍 Installed at: $EXTENSION_PATH${NC}"
echo ""
echo -e "${YELLOW}🚀 Next Steps:${NC}"
echo -e "${WHITE}   1. Restart VS Code${NC}"
echo -e "${WHITE}   2. Press Cmd+Shift+P (Mac) or Ctrl+Shift+P (Linux)${NC}"
echo -e "${WHITE}   3. Type 'Send Email'${NC}"
echo -e "${WHITE}   4. Start sending emails!${NC}"
echo ""
echo -e "${CYAN}💡 Tip: Set up Gmail App Password first!${NC}"
echo -e "${GRAY}   Visit: https://myaccount.google.com/apppasswords${NC}"
echo ""