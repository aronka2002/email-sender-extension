#!/usr/bin/env pwsh
# Email Sender Extension - Uninstall Script
# Run this to completely remove the extension

Write-Host ""
Write-Host "╔════════════════════════════════════════════╗" -ForegroundColor Red
Write-Host "║   🗑️  Email Sender Extension Uninstaller  ║" -ForegroundColor Red
Write-Host "╚════════════════════════════════════════════╝" -ForegroundColor Red
Write-Host ""

$extensionPath = "$env:USERPROFILE\.vscode\extensions\email-sender-1.0.0"

# Check if extension is installed
if (-not (Test-Path $extensionPath)) {
    Write-Host "✓ Extension is not installed" -ForegroundColor Green
    Write-Host ""
    exit 0
}

Write-Host "📍 Found extension at: $extensionPath" -ForegroundColor Cyan
Write-Host ""

# Confirm uninstall
$confirm = Read-Host "Are you sure you want to uninstall? (y/N)"
if ($confirm -ne 'y' -and $confirm -ne 'Y') {
    Write-Host "❌ Uninstall cancelled" -ForegroundColor Yellow
    exit 0
}

Write-Host ""
Write-Host "🗑️  Removing extension..." -ForegroundColor Yellow

try {
    Remove-Item -Recurse -Force $extensionPath -ErrorAction Stop
    
    Write-Host ""
    Write-Host "╔════════════════════════════════════════════╗" -ForegroundColor Green
    Write-Host "║      ✅ Uninstall Complete!               ║" -ForegroundColor Green
    Write-Host "╚════════════════════════════════════════════╝" -ForegroundColor Green
    Write-Host ""
    Write-Host "The extension has been removed successfully." -ForegroundColor White
    Write-Host "Please restart VS Code." -ForegroundColor Yellow
    Write-Host ""
    
} catch {
    Write-Host ""
    Write-Host "❌ Failed to remove extension" -ForegroundColor Red
    Write-Host "Please close VS Code and try again, or manually delete:" -ForegroundColor Yellow
    Write-Host "$extensionPath" -ForegroundColor Gray
    Write-Host ""
    exit 1
}