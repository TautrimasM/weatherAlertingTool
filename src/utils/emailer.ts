import * as nodemailer from "nodemailer";

const transporter = nodemailer.createTransport({
  host: process.env.SMTP_HOST!,
  port: parseInt(process.env.SMTP_PORT!, 10),
  secure: false,
  auth: {
    user: process.env.SMTP_USER!,
    pass: process.env.SMTP_PASSWORD!,
  },
});

export async function sendEmails(
  emailData: { email: string; subject: string; message: string }[]
) {
  let retries = 5;
  while (retries) {
    try {
      const emailPromises = emailData.map(async (data) => {
        const mailOptions: nodemailer.SendMailOptions = {
          from: process.env.SMTP_USER!,
          to: data.email,
          subject: data.subject,
          html: data.message,
        };

        return await transporter.sendMail(mailOptions);
      });

      return Promise.all(emailPromises);
    } catch (error) {
      console.error("Error sending Emails", error);
      retries--;
      console.log("Retiries left:", retries);
      await new Promise((res) => setTimeout(res, 5000));
    }
  }
}
