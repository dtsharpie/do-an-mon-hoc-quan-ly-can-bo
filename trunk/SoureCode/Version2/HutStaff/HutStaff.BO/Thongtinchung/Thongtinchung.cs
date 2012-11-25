using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace HutStaff.BO.Thongtinchung
{
  public  class Thongtinchung
    {
        public static DataTable GetById(int shcc)
        {
            return DAL.Thongtinchung.Thongtinchung.GetById(shcc);
        }

        public static string Update(int shcc, int ma_hktt, string cthktt, string dctt, string tel, string email, string scmnd, int nc, DateTime ngay_cap)
        {
            DAL.Thongtinchung.Thongtinchung.Update(shcc, ma_hktt, cthktt, dctt, tel, email, scmnd, nc, ngay_cap);
            return "alert('Cập nhật thành công');";
        }

        public static DataTable GetChucvuDangById(int shcc)
        {
            return DAL.Thongtinchung.Thongtinchung.GetChucvuDangById(shcc);
        }

        public static DataTable GetChucvuDoantheById(int shcc)
        {
            return DAL.Thongtinchung.Thongtinchung.GetChucvuDoantheById(shcc);
        }
        public static DataTable GetTrinhdoNgoaiNguById(int shcc)
        {
            return DAL.Thongtinchung.Thongtinchung.GetTrinhdoNgoaiNguById(shcc);
        }

        public static DataTable GetQuatrinhKhenThuongById(int shcc)
        {
            return DAL.Thongtinchung.Thongtinchung.GetQuatrinhKhenThuongById(shcc);
        }

        public static DataTable GetQuatrinhKyLuatById(int shcc)
        {
            return DAL.Thongtinchung.Thongtinchung.GetQuatrinhKyLuatById(shcc);
        }

        public static DataTable GetQuatrinhDienBienLuongById(int shcc)
        {
            return DAL.Thongtinchung.Thongtinchung.GetQuatrinhDienBienLuongById(shcc);
        }

        public static DataTable GetQhgdById(int shcc)
        {
            return DAL.Thongtinchung.Thongtinchung.GetQhgdById(shcc);
        }

        public static DataTable GetNnddById(int shcc)
        {
            return DAL.Thongtinchung.Thongtinchung.GetNnddById(shcc);
        }

        public static DataTable GetChucdanh(int shcc)
        {
            return DAL.Thongtinchung.Thongtinchung.GetChucdanh(shcc);
        }
    }
}
