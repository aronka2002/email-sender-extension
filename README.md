# 📧 Email Sender - VS Code Extension

> Send professional emails directly from VS Code with a beautiful, intuitive interface.

[![VS Code](https://img.shields.io/badge/VS%20Code-1.80%2B-blue.svg)](https://code.visualstudio.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## ✨ Features

- 📨 **Send emails directly from VS Code** - No need to switch to your email client
- 🎨 **Beautiful modern UI** - Clean, aesthetic interface with smooth animations
- 🔐 **Secure credentials** - Uses VS Code's Secret Storage API
- 💾 **Draft saving** - Never lose your work with auto-save drafts
- ⚡ **Quick templates** - Pre-built subject templates for common emails
- 👥 **Multiple recipients** - Support for To and CC fields with comma separation
- ⌨️ **Keyboard shortcuts** - Speed up your workflow
- 🎯 **Smart validation** - Helpful error messages and input validation
- 📊 **Character counter** - Track your message length
- 👁️ **Email preview** - See your email before sending

## 📸 Screenshots

![Email Sender Interface](https://via.placeholder.com/800x500?text=Add+Your+Screenshot+Here)

## 🚀 Quick Start

### Easy Installation (Recommended)

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

### Installation from vsix file

1. Download the vsix file from the [VS Code Marketplace](https://marketplace.visualstudio.com/items?itemName=aronka.email-sender)
2. Open the Extensions view by clicking the Extensions icon in the left sidebar or pressing `Ctrl + Shift + X` (Windows/Linux) or `Cmd + Shift + X` (macOS)
3. Click the ... button at the top of the Extensions view and select "Install from VSIX..."
4. Select the downloaded vsix file and click Install
5. Reload VS Code when prompted

### Manual Installation from GitHub

```bash
# Clone to VS Code extensions folder
cd ~/.vscode/extensions  # On Mac/Linux
cd $env:USERPROFILE\.vscode\extensions  # On Windows

# Clone the repository
git clone https://github.com/aronka2002/email-sender-extension.git email-sender-1.0.0

# Install dependencies
cd email-sender-1.0.0
npm install

# Restart VS Code
```

### Update Extension

**Windows:**

```powershell
.\update.ps1
```

**Mac/Linux:**

```bash
cd ~/.vscode/extensions/email-sender-1.0.0
git pull
npm install
```

### Setup Gmail App Password

1. Go to [Google Account](https://myaccount.google.com/)
2. Navigate to **Security**
3. Enable **2-Step Verification** (if not already enabled)
4. Go to [App Passwords](https://myaccount.google.com/apppasswords)
5. Generate a new app password for "Mail"
6. Copy the 16-character password

### First Use

1. Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac)
2. Type "Send Email" and press Enter
3. Enter your Gmail and app password (saved securely)
4. Compose and send your email!

## 📖 Usage

### Command Palette

- Press `Ctrl+Shift+P`
- Type "Send Email"
- Start composing!

### Keyboard Shortcuts

- `Ctrl+Enter` or `Cmd+Enter` - Send email
- `Ctrl+S` or `Cmd+S` - Save draft

### Features Overview

#### 📝 Compose Email

- **To**: Add multiple recipients separated by commas
- **CC**: Carbon copy multiple recipients
- **Subject**: Quick templates available
- **Body**: Full-featured text area with character counter

#### 💾 Draft Management

- Auto-save drafts with `Ctrl+S`
- Auto-load drafts on startup
- Never lose your work

#### ⚡ Quick Actions

- **Meeting Request** template
- **Follow-up** template
- **Update** template
- Quick add recipients button

#### 🔔 Notifications

- Success messages when emails are sent
- Error alerts with helpful information
- Warning notifications for missing fields

## ⚙️ Configuration

This extension contributes the following settings:

- `emailSender.autoSaveDrafts`: Enable/disable automatic draft saving (default: `true`)
- `emailSender.showNotifications`: Show/hide notification messages (default: `true`)

## 🔧 Requirements

- VS Code version 1.80.0 or higher
- Gmail account with 2-Step Verification enabled
- App Password generated from Google Account

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 Known Issues

- Currently only supports Gmail SMTP
- Attachments not yet supported (coming soon!)

## 🗺️ Roadmap

- [ ] Support for multiple email providers (Outlook, Yahoo, etc.)
- [ ] File attachment support
- [ ] HTML email templates
- [ ] Email scheduling
- [ ] Contact management
- [ ] Email history/sent items

## 📄 License

This extension is licensed under the [MIT License](LICENSE).

## 👤 Author

**Aronka**

- GitHub: [@aronka2002](https://github.com/aronka2002)
- Email: your.email@example.com

## 🙏 Acknowledgments

- Built with [Nodemailer](https://nodemailer.com/)
- Icons from [Emoji](https://emojipedia.org/)
- Inspired by the need for quick email access while coding

## 📊 Stats

![GitHub stars](https://img.shields.io/github/stars/aronka2002/email-sender-extension?style=social)
![GitHub forks](https://img.shields.io/github/forks/aronka2002/email-sender-extension?style=social)
![GitHub issues](https://img.shields.io/github/issues/aronka2002/email-sender-extension)

---

**Enjoy sending emails from VS Code!** ⭐ Star this repo if you find it helpful!
