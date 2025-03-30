#!/bin/bash
# Quick installation script for Arch Linux Installer
# Author: Radin Rabiee (RadinRabiee)
# Date: Sunday - 2025 30 March

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
NC='\033[0m'

echo -e "${BLUE}=======================================================${NC}"
echo -e "${GREEN}Arch Linux Installer - Installation${NC}"
echo -e "${BLUE}=======================================================${NC}"

# Make scripts executable
chmod +x src/installer.sh
chmod +x src/utils.sh

echo -e "${GREEN}Installation complete!${NC}"
echo -e "You can now run the installer with: ./src/installer.sh"

exit 0
