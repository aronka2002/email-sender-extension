#!/usr/bin/env pwsh
# Email Sender Extension - Update Script
# Run this to update to the latest version from GitHub

Write-Host ""
Write-Host "╔════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║   🔄 Email Sender Extension Updater      ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

$extensionPath = "$env:USERPROFILE\.vscode\extensions\email-sender-1.0.0"

# Check if extension is installed
if (-not (Test-Path $extensionPath)) {
    Write-Host "❌ Extension not found!" -ForegroundColor Red
    Write-Host "Please install it first using install.ps1" -ForegroundColor Yellow
    exit 1
}

Write-Host "📍 Extension location: $extensionPath" -ForegroundColor Cyan
Write-Host ""

# Navigate to extension directory
Push-Location $extensionPath

try {
    # Fetch latest changes
    Write-Host "📥 Fetching updates from GitHub..." -ForegroundColor Cyan
    git fetch origin 2>&1 | Out-Null
    
    # Check if updates are available
    $localCommit = git rev-parse HEAD
    $remoteCommit = git rev-parse origin/main
    
    if ($localCommit -eq $remoteCommit) {
        Write-Host "✓ Already up to date!" -ForegroundColor Green
        Write-Host ""
        Pop-Location
        exit 0
    }
    
    # Pull latest changes
    Write-Host "🔄 Pulling latest changes..." -ForegroundColor Cyan
    git pull origin main 2>&1 | Out-Null
    Write-Host "✓ Code updated successfully" -ForegroundColor Green
    
    # Update dependencies
    Write-Host ""
    Write-Host "📦 Updating dependencies..." -ForegroundColor Cyan
    npm install --silent 2>&1 | Out-Null
    Write-Host "✓ Dependencies updated" -ForegroundColor Green
    
    # Success
    Write-Host ""
    Write-Host "╔════════════════════════════════════════════╗" -ForegroundColor Green
    Write-Host "║         ✅ Update Complete!               ║" -ForegroundColor Green
    Write-Host "╚════════════════════════════════════════════╝" -ForegroundColor Green
    Write-Host ""
    Write-Host "🚀 Please restart VS Code to use the updated version!" -ForegroundColor Yellow
    Write-Host ""
    
} catch {
    Write-Host "❌ Update failed: $_" -ForegroundColor Red
    exit 1
} finally {
    Pop-Location
}