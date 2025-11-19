# Change Log

All notable changes to the "Email Sender" extension will be documented in this file.

## [1.0.0] - 2025-11-19

### ✨ Initial Release

#### Added

- 📨 Core email sending functionality via Gmail SMTP
- 🔐 Secure credential storage using VS Code Secret Storage API
- 🎨 Beautiful modern UI with gradient design
- 💾 Draft saving and auto-loading functionality
- ⚡ Quick action templates (Meeting Request, Follow-up, Update)
- 👥 Multiple recipient support (To and CC fields)
- 📊 Real-time character counter for email body
- 👁️ Email preview functionality
- ⌨️ Keyboard shortcuts (Ctrl+Enter to send, Ctrl+S to save draft)
- 🔔 Toast notifications for success/error messages
- ✅ Smart form validation with helpful error messages
- 🗑️ Clear form functionality with confirmation
- 📱 Responsive design that adapts to VS Code themes
- 🎭 Smooth animations and transitions
- 🔄 Loading states during email sending

#### Features

- Support for comma-separated multiple recipients
- Auto-save credentials for convenience
- Form validation before sending
- Character counting for message body
- Quick template insertion for common subjects
- Draft management with localStorage
- Clean and intuitive user interface
- VS Code theme integration
- Accessibility support

#### Technical

- Built with Nodemailer for reliable email delivery
- Uses VS Code's webview API
- Implements VS Code Secret Storage for security
- Follows VS Code extension best practices

---

## [Unreleased]

### 🚀 Planned Features

- File attachment support
- Multiple email provider support (Outlook, Yahoo)
- HTML email templates
- Email scheduling
- Contact management
- Email history/sent items viewer
- Signature support
- BCC field support
- Email priority settings
- Read receipt requests

---

## Version Format

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### Types of Changes

- **Added** for new features
- **Changed** for changes in existing functionality
- **Deprecated** for soon-to-be removed features
- **Removed** for now removed features
- **Fixed** for any bug fixes
- **Security** in case of vulnerabilities
