using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace HutStaff.BO.PagesBO.QuanLy
{
    public class Huyhoso
    {
        public static DataTable Search(string ten, int trangthai, int pageIndex, int pageSize)
        {
            return DAL.PagesDAL.QuanLy.Huyhoso.Search(ten, trangthai, pageIndex, pageSize);
        }

        public static string Xoa(int shcc)
        {
            DAL.PagesDAL.QuanLy.Huyhoso.Xoa(shcc);
            return "alert('Đã xóa');";
        }


        public static string KhongXoa(int shcc)
        {
            DAL.PagesDAL.QuanLy.Huyhoso.KhongXoa(shcc);
            return "alert('Đã hủy bỏ yêu cầu xóa');";
        }

        public static string KhoiPhuc(int shcc)
        {
            DAL.PagesDAL.QuanLy.Huyhoso.KhoiPhuc(shcc);
            return "alert('Đã khôi phục');";
        }
    }
}
