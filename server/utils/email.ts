import nodemailer from 'nodemailer';
import ejs from 'ejs';
import { htmlToText } from 'html-to-text';

/**
 * Send emails to users using this class by calling the respective method
 */
class Email {
  name: string;
  to: string;
  data: Record<string, string>;
  from: string;

  constructor(name: string, email: string, data: Record<string, string>) {
    this.name = name;
    this.to = email;
    this.data = data;
    this.from = `Instagram Clone <noreply@instagram-clone.com>`;
  }

  _newTransport() {
    if (process.env.NODE_ENV === 'production') {
      // Sendgrid
      return nodemailer.createTransport({
        service: 'SendGrid',
        auth: {
          user: process.env.SENDGRID_USERNAME,
          pass: process.env.SENDGRID_PASSWORD
        }
      });
    }

    // MailTrap
    return nodemailer.createTransport({
      host: process.env.EMAIL_HOST,
      port: process.env.EMAIL_PORT,
      auth: {
        user: process.env.EMAIL_USERNAME,
        pass: process.env.EMAIL_PASSWORD
      }
    });
  }

  // Send the actual email
  async _send(template: string, subject: string) {
    const path = `${__dirname}/../templates/${template}.ejs`;
    const data = { name: this.name, ...this.data };
    const html = await ejs.renderFile(path, data);

    const mailOptions = {
      from: this.from,
      to: this.to,
      subject,
      html,
      text: htmlToText(html)
    };

    await this._newTransport().sendMail(mailOptions);
  }

  // Methods to send different mails
  async sendWelcome() {
    await this._send('welcome', 'Welcome To Instagram Clone');
  }

  async sendConfirmationCode() {
    await this._send('confirmation', 'Instagram Clone - Confirmation Code');
  }

  async sendPasswordReset() {
    await this._send('password-reset', 'Instagram Clone - Password Reset');
  }
}

export default Email;
