﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Data;
using HutStaff.Common;

namespace HutStaff.BO.Security
{
    public class CurrentUser
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

        public int Quyen
        {
            get;
            set;
        }

        public CurrentUser(string username, int userId, int quyen)
        {
            this.UserName = username;
            this.UserId = userId;
            this.Quyen = quyen;
        }

        public static CurrentUser GetCurrentUser()
        {
            if (HttpContext.Current.Session[Constants.Session.AdminSessionName] != null)
            {
                return (CurrentUser)HttpContext.Current.Session[Constants.Session.AdminSessionName];
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
