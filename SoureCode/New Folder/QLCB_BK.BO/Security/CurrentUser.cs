using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Data;

namespace QLCB_BK.BO.Security
{
    public class CurrentUser
    {
        public static string UserName
        {
            get
            {
                return HttpContext.Current.User.Identity.Name.ToLower();
            }
        }

        public static int UserId
        {
            get
            {
                DataTable dtUser = User.GetByUserName(UserName);
                return dtUser.Rows.Count > 0 ? Convert.ToInt32(dtUser.Rows[0]["Id"]) : 0;
            }
        }

        public static int Role
        {
            get
            {
                DataTable dtUser = User.GetByUserName(UserName);
                return dtUser.Rows.Count > 0 ? Convert.ToInt32(dtUser.Rows[0]["Role"]) : 10;
            }
        }
    }
}
