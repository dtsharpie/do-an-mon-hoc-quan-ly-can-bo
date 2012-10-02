using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace HutStaff.BO.Soyeu
{
    public class Soyeu
    {
        public static DataTable GetById(int shcc)
        {
            return DAL.Soyeu.Soyeu.GetById(shcc);
        }

        public static string Update(int shcc, int ma_hktt, string cthktt, string dctt, string tel, string email, string scmnd, int nc,DateTime ngay_cap)
        {
            DAL.Soyeu.Soyeu.Update(shcc, ma_hktt, cthktt, dctt, tel, email, scmnd, nc,ngay_cap);
            return "alert('Cập nhật thành công');";
        }
    }
}
