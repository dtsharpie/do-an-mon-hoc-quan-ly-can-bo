using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using HutStaff.Common;
using System.Data;
namespace HutStaff.DAL.Soyeu
{
    public class Soyeu
    {
        public static DataTable GetById(int shcc)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[HutStaff_ViewUser_soyeu_Thongtinchung_GetById]",
                     new string[] { "@shcc" },
                     new object[] { shcc });
            }
        }
    }
}
