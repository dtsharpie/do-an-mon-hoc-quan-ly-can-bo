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

        public static void Xoa(int shcc)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("[HutStaff_huyhoso_Xoa]",
                    new string[] { "@shcc" },
                    new object[] { shcc });
            }
        }

        public static void Xoas(string shcc)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("[HutStaff_huyhoso_Xoas]",
                    new string[] { "@shcc" },
                    new object[] { shcc });
            }
        }

        public static void KhongXoa(int shcc)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("[HutStaff_huyhoso_KhongXoa]",
                    new string[] { "@shcc" },
                    new object[] { shcc });
            }
        }

        public static void KhongXoas(string shcc)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("[HutStaff_huyhoso_KhongXoas]",
                    new string[] { "@shcc" },
                    new object[] { shcc });
            }
        }

        public static void KhoiPhuc(int shcc)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("[HutStaff_huyhoso_KhoiPhuc]",
                    new string[] { "@shcc" },
                    new object[] { shcc });
            }
        }
    }
}
