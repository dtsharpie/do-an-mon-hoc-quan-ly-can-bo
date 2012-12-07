using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using HutStaff.Common;
namespace HutStaff.DAL.PagesDAL.QuanLy
{
    public class Huyhoso
    {
        public static DataTable Search(string ten, int trangthai, int pageIndex, int pageSize)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[HutStaff_huyhoso_Search]",
                    new string[] { "@ten", "@trangthai", "@PageIndex", "@PageSize" },
                    new object[] { ten, trangthai, pageIndex, pageSize });
            }
        }
    }
}
