using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using HutStaff.Common;

namespace HutStaff.DAL.Thongtinchung
{
    public class Thongtinchung
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

        public static void Update(int shcc, int ma_hktt, string cthktt, string dctt, string tel, string email, string scmnd, int nc, DateTime ngay_cap)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("[HutStaff_ViewUser_UpdateInfo]",
                    new string[] { "@shcc", "@ma_hktt", "@cthktt", "@dctt", "@tel", "@email", "@scmnd", "@nc", "@ngay_cap" },
                    new object[] { shcc, ma_hktt, cthktt, dctt, tel, email, scmnd, nc, ngay_cap });

            }
        }

        public static DataTable GetChucvuDangById(int shcc)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[HutStaff_ViewUser_cvkn_GetById]",
                     new string[] { "@shcc" },
                     new object[] { shcc });
            }
        }

        public static DataTable GetChucvuDoantheById(int shcc)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[HutStaff_ViewUser_cvkn_GetById]",
                     new string[] { "@shcc" },
                     new object[] { shcc });
            }
        }

        public static DataTable GetTrinhdoNgoaiNguById(int shcc)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[HutStaff_ViewUser_tdnn_GetById]",
                     new string[] { "@shcc" },
                     new object[] { shcc });
            }
        }

        public static DataTable GetQuatrinhKhenThuongById(int shcc)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[HutStaff_ViewUser_qtkt_GetById]",
                    new string[] { "@shcc" },
                    new object[] { shcc });
            }
        }

        public static DataTable GetQuatrinhKyLuatById(int shcc)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[HutStaff_ViewUser_qtkl_GetById]",
                    new string[] { "@shcc" },
                    new object[] { shcc });
            }
        }

        public static DataTable GetQuatrinhDienBienLuongById(int shcc)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[HutStaff_ViewUser_dbl_GetById]",
                    new string[] { "@shcc" },
                    new object[] { shcc });
            }
        }

        public static DataTable GetQhgdById(int shcc)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[HutStaff_ViewUser_qhgd_GetById]",
                    new string[] { "@shcc" },
                    new object[] { shcc });
            }
        }

        public static DataTable GetNnddById(int shcc)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[HutStaff_ViewUser_nndd_GetById]",
                    new string[] { "@shcc" },
                    new object[] { shcc });
            }
        }

        public static DataTable GetChucdanh(int shcc)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[HutStaff_ViewUser_dhdp_GetById]",
                    new string[] { "@shcc" },
                    new object[] { shcc });
            }
        }
    }
}
