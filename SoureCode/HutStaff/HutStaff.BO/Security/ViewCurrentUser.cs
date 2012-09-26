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

        public int UserId
        {
            get;
            set;
        }

        public int Role
        {
            get;
            set;
        }

        public ViewCurrentUser(string username, int userId, int role)
        {
            this.UserName = username;
            this.UserId = userId;
            this.Role = role;
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
