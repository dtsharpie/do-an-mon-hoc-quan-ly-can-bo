using System;
using System.Collections.Generic;
using System.Text;
using System.Net.Mail;
using System.Collections.Specialized;
using System.Configuration;
using System.Web;
using System.IO;
using System.Net;
using System.Text.RegularExpressions;

namespace HutStaff.Common
{
    public class AutoMail
    {

        private static string email = GetConfigValue("AutoMail/Email", "email");
        private static string password = GetConfigValue("AutoMail/Password", "pass");
        private static string sServer = GetConfigValue("AutoMail/Server", "mailsever");

        public static string Email
        {
            get
            {
                return email;
            }
            set
            {
                email = value;
            }
        }

        public static string Password
        {
            get
            {
                return password;
            }
            set
            {
                password = value;
            }
        }


        public static void SendTo(string sendTo, string subject, string content)
        {
            MailMessage message = new MailMessage();
            message.To.Add(sendTo);
            message.Subject = subject;
            message.From = new System.Net.Mail.MailAddress(email);
            message.Body = content;
            message.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient(sServer, 587);
            smtp.Credentials = new System.Net.NetworkCredential(email, password);
            smtp.EnableSsl = true;

            smtp.Send(message);
        }

        public static void SendTo(List<string> emails, string subject, string content)
        {
            if (emails.Count > 0)
            {
                MailMessage message = new MailMessage();
                foreach (string sEmail in emails)
                {
                    message.To.Add(sEmail);
                }
                message.Subject = subject;
                message.From = new System.Net.Mail.MailAddress(email);
                message.Body = content;
                message.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient(sServer, 587);
                smtp.Credentials = new System.Net.NetworkCredential(email, password);
                smtp.EnableSsl = true;

                smtp.Send(message);
            }
        }

        public static string GetConfigValue(string sectionName, string key)
        {
            NameValueCollection config = (NameValueCollection)ConfigurationManager.GetSection(sectionName);
            return config[key];
        }
    }
}
