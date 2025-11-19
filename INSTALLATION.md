# 🖥️ Cross-Platform Installation Guide

Your extension works on **Windows, Mac, and Linux**! Here's a quick reference:

---

## 🪟 Windows

### One-Line Install

```powershell
irm https://raw.githubusercontent.com/aronka2002/email-sender-extension/main/install.ps1 | iex
```

### Scripts Available

- `install.ps1` - Install extension
- `update.ps1` - Update to latest version
- `uninstall.ps1` - Remove extension

### Extension Location

```
C:\Users\YourName\.vscode\extensions\email-sender-1.0.0\
```

---

## 🍎 Mac

### One-Line Install

```bash
curl -fsSL https://raw.githubusercontent.com/aronka2002/email-sender-extension/main/install.sh | bash
```

### Scripts Available

- `install.sh` - Install extension
- `update.sh` - Update to latest version
- `uninstall.sh` - Remove extension

### Make Scripts Executable

```bash
chmod +x install.sh update.sh uninstall.sh
```

### Extension Location

```
~/.vscode/extensions/email-sender-1.0.0/
```

---

## 🐧 Linux

### One-Line Install

```bash
curl -fsSL https://raw.githubusercontent.com/aronka2002/email-sender-extension/main/install.sh | bash
```

### Scripts Available

- `install.sh` - Install extension
- `update.sh` - Update to latest version
- `uninstall.sh` - Remove extension

### Make Scripts Executable

```bash
chmod +x install.sh update.sh uninstall.sh
```

### Extension Location

```
~/.vscode/extensions/email-sender-1.0.0/
```

---

## 📋 Quick Command Reference

### Install

| Platform  | Command         |
| --------- | --------------- |
| Windows   | `.\install.ps1` |
| Mac/Linux | `./install.sh`  |

### Update

| Platform  | Command        |
| --------- | -------------- |
| Windows   | `.\update.ps1` |
| Mac/Linux | `./update.sh`  |

### Uninstall

| Platform  | Command           |
| --------- | ----------------- |
| Windows   | `.\uninstall.ps1` |
| Mac/Linux | `./uninstall.sh`  |

---

## ✅ All Scripts Include

- ✨ Beautiful colored output
- 🔍 Error checking and validation
- 📦 Automatic dependency installation
- 🔄 Progress indicators
- 💡 Helpful tips and next steps
- ⚠️ Clear error messages

---

## 🎯 Platform-Specific Notes

### Windows

- Uses PowerShell scripts (`.ps1`)
- May need to allow script execution: `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`
- Works with PowerShell 5.1+ and PowerShell Core 7+

### Mac

- Uses Bash scripts (`.sh`)
- May need to install Command Line Tools: `xcode-select --install`
- Works with both Intel and Apple Silicon Macs

### Linux

- Uses Bash scripts (`.sh`)
- Works on all major distributions (Ubuntu, Fedora, Arch, etc.)
- Requires Git and Node.js installed

---

## 📦 What Gets Installed

Same on all platforms:

```
~/.vscode/extensions/email-sender-1.0.0/
├── extension.js          ← Main extension code
├── webview.html          ← Beautiful UI
├── package.json          ← Extension config
├── node_modules/         ← Dependencies
└── ...                   ← Other files
```

---

## 🚀 After Installation

**All Platforms:**

1. Restart VS Code
2. Press `Ctrl+Shift+P` (Windows/Linux) or `Cmd+Shift+P` (Mac)
3. Type "Send Email"
4. Extension opens - ready to use! 🎉

---

## 🔧 Requirements (All Platforms)

- ✅ **VS Code** 1.80.0+
- ✅ **Node.js** 16.x+ (with npm)
- ✅ **Git** (for cloning)
- ✅ **Gmail Account** with App Password

---

## 💻 Tested On

- ✅ Windows 10/11
- ✅ macOS Monterey, Ventura, Sonoma
- ✅ Ubuntu 20.04, 22.04, 24.04
- ✅ Fedora 38+
- ✅ Arch Linux
- ✅ Debian 11+

Works on any system that runs VS Code! 🌍
