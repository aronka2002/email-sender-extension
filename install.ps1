#!/usr/bin/env pwsh
# Email Sender Extension - Windows Installer
# Run this script to install the extension directly from GitHub

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "   Email Sender Extension Installer" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

$extensionPath = "$env:USERPROFILE\.vscode\extensions\email-sender-1.0.0"
$repoUrl = "https://github.com/aronka2002/email-sender-extension.git"

# Check if git is installed
try {
    git --version | Out-Null
} catch {
    Write-Host "Error: Git is not installed!" -ForegroundColor Red
    Write-Host "Please install Git from: https://git-scm.com/download/win" -ForegroundColor Yellow
    exit 1
}

# Check if npm is installed
try {
    npm --version | Out-Null
} catch {
    Write-Host "Error: Node.js/npm is not installed!" -ForegroundColor Red
    Write-Host "Please install Node.js from: https://nodejs.org/" -ForegroundColor Yellow
    exit 1
}

# Remove old version if exists
if (Test-Path $extensionPath) {
    Write-Host "Removing old version..." -ForegroundColor Yellow
    try {
        Remove-Item -Recurse -Force $extensionPath -ErrorAction Stop
        Write-Host "Old version removed" -ForegroundColor Green
    } catch {
        Write-Host "Failed to remove old version. Please close VS Code and try again." -ForegroundColor Red
        exit 1
    }
}

# Clone repository
Write-Host ""
Write-Host "Cloning from GitHub..." -ForegroundColor Cyan
try {
    git clone $repoUrl $extensionPath 2>&1 | Out-Null
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Repository cloned successfully" -ForegroundColor Green
    } else {
        throw "Git clone failed"
    }
} catch {
    Write-Host "Failed to clone repository. Check your internet connection." -ForegroundColor Red
    exit 1
}

# Install dependencies
Write-Host ""
Write-Host "Installing dependencies..." -ForegroundColor Cyan
try {
    Push-Location $extensionPath
    npm install --silent 2>&1 | Out-Null
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Dependencies installed successfully" -ForegroundColor Green
    } else {
        throw "npm install failed"
    }
    Pop-Location
} catch {
    Write-Host "Failed to install dependencies." -ForegroundColor Red
    Pop-Location
    exit 1
}

# Success message
Write-Host ""
Write-Host "================================================================" -ForegroundColor Green
Write-Host "        Installation Complete!" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""
Write-Host "Installed at: $extensionPath" -ForegroundColor Cyan
Write-Host ""
Write-Host "Next Steps:" -ForegroundColor Yellow
Write-Host "   1. Restart VS Code" -ForegroundColor White
Write-Host "   2. Press Ctrl+Shift+P" -ForegroundColor White
Write-Host "   3. Type 'Send Email'" -ForegroundColor White
Write-Host "   4. Start sending emails!" -ForegroundColor White
Write-Host ""
Write-Host "Tip: Set up Gmail App Password first!" -ForegroundColor Cyan
Write-Host "Visit: https://myaccount.google.com/apppasswords" -ForegroundColor Gray
Write-Host ""