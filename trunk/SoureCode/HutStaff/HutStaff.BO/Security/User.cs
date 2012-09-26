using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Web.Security;
using System.Xml;

namespace HutStaff.BO.Security
{
    public class User
    {
        public static DataTable Search(int pageIndex, int pageSize, int currentUserId, int filter, string keyword,int status)
        {
            return DAL.Security.User.Search(pageIndex, pageSize, currentUserId, filter, keyword,status);
        }

        public static int SearchCount(int currentUserId, int filter, string keyword,int status)
        {
            return DAL.Security.User.SearchCount(currentUserId, filter, keyword,status);
        }

        public static DataTable GetByUserName(string username)
        {
            return DAL.Security.User.GetByUserName(username);
        }

        public static DataTable GetById(int Id)
        {
            return DAL.Security.User.GetById(Id);
        }

        public static void ChangeStatus(int id, int status)
        {
            DAL.Security.User.ChangeStatus(id, status);
        }

        public static string Insert(string Username, string Password, int Status, string FullName, string Email, string Description, int Role)
        {
            string hashPass = FormsAuthentication.HashPasswordForStoringInConfigFile(Password, "MD5");
            DataTable tblData = GetByUserName(Username);
            if (tblData.Rows.Count == 0)
            {
                DAL.Security.User.Insert(Username, hashPass, Status, FullName, Email, Description, Role);
                return "alert('Cập nhật thành công!');loadContent({ alias: 'quan-ly-nguoi-dung' }, true);";
            }
            else
            {
                return "alert('Tài khoản này đã tồn tại')";
            }
        }

        public static string Update(int Id, int Status, string FullName, string Email, string Description, int Role)
        {
            DAL.Security.User.Update(Id, Status, FullName, Email, Description, Role);
            return "alert('Cập nhật thành công!');loadContent({ alias: 'quan-ly-nguoi-dung' }, true);";
        }

        public static string Delete(string Ids)
        {
            foreach (string sId in Ids.Split(','))
            {
                int iUserId = Convert.ToInt32(sId);
                DAL.Security.User.Delete(iUserId);
            }
            return "alert('Cập nhật thành công!');loadContent({ alias: 'quan-ly-nguoi-dung' }, true);";
        }

        public static DataTable Authenticate(string UserName, string Password)
        {
            string hashPass = HashPass(Password);
            return DAL.Security.User.Authenticate(UserName, hashPass);
        }

        public static string ChangePass(int userId, string password, string oldpass)
        {
            if (GetById(userId).Rows[0]["Password"].ToString() == HashPass(oldpass))
            {
                DAL.Security.User.ChangePass(userId, HashPass(password));
                return "alert('Cập nhật thành công!');$('.popup').hidePopup();";
            }
            else
            {
                return "alert('Mật khẩu cũ không đúng');";
            }
        }

        private static string HashPass(string password)
        {
            return FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5");
        }

        public static string SendEmailToAll(string subject, string content)
        {
            List<string> lstUser = DAL.Security.User.GetAllEmail();
            if (lstUser.Count > 0)
            {
                HutStaff.Common.AutoMail.SendTo(lstUser, subject, content);
            }
            try
            {
                return "alert('Gửi thành công');loadContent({ alias: 'quan-ly-nguoi-dung' }, true);";
            }
            catch
            {
                return "alert('Có lỗi xảy ra! Xin hãy kiểm tra lại');";
            }
        }

        public static string SendEmail(string emails, string subject, string content)
        {
            List<string> lstUser = new List<string>();
            lstUser.AddRange(emails.Split(','));
            if (lstUser.Count > 0)
            {
                HutStaff.Common.AutoMail.SendTo(lstUser, subject, content);
            }
            try
            {
                return "alert('Gửi thành công');$('.popup').hidePopup();";
            }
            catch
            {
                return "alert('Có lỗi xảy ra! Xin hãy kiểm tra lại'); $('.popup').hidePopup();";
            }
        }

        public static string SaveEmail(string email, string password)
        {
            try
            {
                XmlDocument xml = new XmlDocument();
                xml.Load(System.Web.HttpContext.Current.Server.MapPath("/Web.config"));
                xml.SelectSingleNode("//AutoMail/Email/add[@key='email']").Attributes["value"].Value = email;
                xml.SelectSingleNode("//AutoMail/Password/add[@key='pass']").Attributes["value"].Value = password;
                xml.Save(System.Web.HttpContext.Current.Server.MapPath("/Web.config"));
                return "alert('Cập nhật thành công');";
            }
            catch (Exception ex)
            {
                return "alert('Lỗi chưa lưu được: " + ex.Message + "');";
            }
        }

        public static void ChangeRole(int userId, int role)
        {
            DAL.Security.User.ChangeRole(userId, role);
        }

        public static DataTable SearchEmail(int pageIndex, int pageSize, string keyword)
        {
            return DAL.Security.User.SearchEmail(pageIndex, pageSize, keyword);
        }

        public static int SearchEmailCount(string keyword)
        {
            return DAL.Security.User.SearchEmailCount(keyword);
        }
    }
}
