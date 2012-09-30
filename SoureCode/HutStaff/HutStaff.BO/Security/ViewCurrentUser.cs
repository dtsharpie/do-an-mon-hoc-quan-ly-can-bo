using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using HutStaff.Common;
using System.Web;

namespace HutStaff.BO.Security
{
    public class ViewCurrentUser
    {
        public string UserName
        {
            get;
            set;
        }

        public int Shcc
        {
            get;
            set;
        }

        public string FullName
        {
            get;
            set;
        }

        public string Gender
        {
            get;
            set;
        }

        public DateTime Birthday
        {
            get;
            set;
        }

        public string Image
        {
            get;
            set;
        }
        public ViewCurrentUser(string username, int shcc, string fullname, int gender, DateTime birthday, string image)
        {
            this.UserName = username;
            this.Shcc = shcc;
            this.FullName = fullname;
            this.Gender = (gender == 0) ? "Nữ" : "Nam";
            this.Birthday = birthday;
            this.Image = image;
        }

        public static ViewCurrentUser GetViewCurrentUser()
        {
            if (HttpContext.Current.Session[Constants.Session.ViewSessionName] != null)
            {
                return (ViewCurrentUser)HttpContext.Current.Session[Constants.Session.ViewSessionName];
            }
            else
            {
                return null;
            }
        }

        public static void Logout()
        {
            HttpContext.Current.Session.Clear();
        }
    }
}
