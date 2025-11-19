#!/usr/bin/env pwsh
# Email Sender Extension - Windows Installer
# Corrected to install in VS Code's required folder format:
#   publisher.name-version  → aronka.email-sender-1.0.0

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "   Email Sender Extension Installer" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

# REQUIRED FIX — this MUST match package.json (publisher + name + version)
$publisher = "aronka"
$extensionName = "email-sender"
$version = "1.0.0"

# Final folder name VS Code requires
$extensionFolder = "$publisher.$extensionName-$version"
$extensionPath = "$env:USERPROFILE\.vscode\extensions\$extensionFolder"

$repoUrl = "https://github.com/aronka2002/email-sender-extension.git"

# Check if git is installed
try {
    git --version | Out-Null
} catch {
    Write-Host "Error: Git is not installed!" -ForegroundColor Red
    exit 1
}

# Check if npm is installed
try {
    npm --version | Out-Null
} catch {
    Write-Host "Error: Node.js/npm is not installed!" -ForegroundColor Red
    exit 1
}

# Remove previous version
if (Test-Path $extensionPath) {
    Write-Host "Removing old version..." -ForegroundColor Yellow
    try {
        Remove-Item -Recurse -Force $extensionPath -ErrorAction Stop
        Write-Host "Old version removed" -ForegroundColor Green
    } catch {
        Write-Host "Failed to remove old version. Close VS Code and try again." -ForegroundColor Red
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
    Write-Host "Failed to clone repository." -ForegroundColor Red
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
Write-Host ""
