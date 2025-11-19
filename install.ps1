#!/usr/bin/env pwsh
# Email Sender Extension - Windows Installer

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "   Email Sender Extension Installer" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

$publisher = "aronka"
$extensionName = "email-sender"
$version = "1.0.1"

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

# Remove ALL previous versions
Write-Host "Checking for previous versions..." -ForegroundColor Yellow
$oldVersions = Get-ChildItem "$env:USERPROFILE\.vscode\extensions" -Directory | Where-Object { $_.Name -like "$publisher.$extensionName-*" }
if ($oldVersions) {
    foreach ($old in $oldVersions) {
        Write-Host "Removing $($old.Name)..." -ForegroundColor Yellow
        try {
            Remove-Item -Recurse -Force $old.FullName -ErrorAction Stop
        } catch {
            Write-Host "Failed to remove $($old.Name). Close VS Code and try again." -ForegroundColor Red
            exit 1
        }
    }
    Write-Host "Old versions removed" -ForegroundColor Green
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

# Kill VS Code processes to ensure clean reload
Write-Host ""
Write-Host "Attempting to restart VS Code processes..." -ForegroundColor Yellow
$codeProcesses = Get-Process "Code" -ErrorAction SilentlyContinue
if ($codeProcesses) {
    Write-Host "Found running VS Code instances. Closing them..." -ForegroundColor Yellow
    Stop-Process -Name "Code" -Force -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 2
}

Write-Host ""
Write-Host "================================================================" -ForegroundColor Green
Write-Host "        Installation Complete!" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""
Write-Host "Installed at: $extensionPath" -ForegroundColor Cyan
Write-Host ""
Write-Host "Next Steps:" -ForegroundColor Yellow
Write-Host "   1. Open VS Code (or it will restart automatically)" -ForegroundColor White
Write-Host "   2. Press Ctrl+Shift+P" -ForegroundColor White
Write-Host "   3. Type 'Send Email' or 'Email: Send Email'" -ForegroundColor White
Write-Host ""
Write-Host "Troubleshooting:" -ForegroundColor Yellow
Write-Host "   - If command not found, run: Developer: Reload Window (Ctrl+Shift+P)" -ForegroundColor White
Write-Host "   - Check: Developer: Show Running Extensions" -ForegroundColor White
Write-Host ""