const vscode = require("vscode");
const nodemailer = require("nodemailer");
const fs = require("fs");
const path = require("path");

function activate(context) {
  let disposable = vscode.commands.registerCommand(
    "emailSender.open",
    function () {
      const panel = vscode.window.createWebviewPanel(
        "emailSender",
        "Email Sender",
        vscode.ViewColumn.One,
        { enableScripts: true }
      );

      // Load HTML content
      const htmlPath = path.join(context.extensionPath, "webview.html");
      const htmlContent = fs.readFileSync(htmlPath, "utf8");
      panel.webview.html = htmlContent;

      // Load saved credentials and send to webview
      (async () => {
        const savedEmail = await context.secrets.get("emailSenderEmail");
        const savedPassword = await context.secrets.get("emailSenderPassword");

        panel.webview.postMessage({
          type: "loadCredentials",
          email: savedEmail || "",
          password: savedPassword || "",
        });
      })();

      // Receive message from Webview
      panel.webview.onDidReceiveMessage(async (form) => {
        try {
          // Validate inputs
          if (!form.sender || !form.password) {
            vscode.window.showErrorMessage("Email and password are required!");
            return;
          }

          if (!form.to) {
            vscode.window.showErrorMessage("Recipient email is required!");
            return;
          }

          // Save credentials securely
          await context.secrets.store("emailSenderEmail", form.sender);
          await context.secrets.store("emailSenderPassword", form.password);

          // Show progress
          vscode.window.withProgress(
            {
              location: vscode.ProgressLocation.Notification,
              title: "Sending email...",
              cancellable: false,
            },
            async (progress) => {
              let transporter = nodemailer.createTransport({
                service: "gmail",
                auth: {
                  user: form.sender,
                  pass: form.password,
                },
              });

              await transporter.sendMail({
                from: form.sender,
                to: form.to,
                cc: form.cc || undefined,
                subject: form.subject || "(No Subject)",
                text: form.body,
              });

              vscode.window.showInformationMessage(
                "✅ Email sent successfully!"
              );

              // Notify webview
              panel.webview.postMessage({
                type: "sendSuccess",
              });
            }
          );
        } catch (error) {
          const errorMsg = "❌ Failed to send email: " + error.message;
          vscode.window.showErrorMessage(errorMsg);

          // Notify webview
          panel.webview.postMessage({
            type: "sendError",
            message: error.message,
          });
        }
      });
    }
  );

  context.subscriptions.push(disposable);
}

function deactivate() {}

module.exports = { activate, deactivate };
