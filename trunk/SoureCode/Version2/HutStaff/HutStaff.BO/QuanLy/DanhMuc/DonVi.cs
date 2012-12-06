using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace HutStaff.BO.QuanLy.DanhMuc
{
    public class DonVi
    {
        /// <summary>
        /// Lấy tất cả dữ liệu có trong bảng dm_dv
        /// </summary>
        /// <returns></returns>
        public static DataTable GetAll()
        {
            return HutStaff.DAL.Quanly.Repository.GetAll("sp_view_all_dm_dv");
        }

        /// <summary>
        /// Cập nhật bảng đơn vị. Nếu không có bản ghi có id trùng với dm_dv thì không làm gì.
        /// </summary>
        /// <param name="ma_dv"></param>
        /// <param name="dv"></param>
        public static void Update(string ma_dv, string dv)
        {
            string[] paramNames = new string[] { "id", "dv" };
            string[] paramValues = new string[] { ma_dv, dv };

            HutStaff.DAL.Quanly.Repository.Execute("sp_update_dm_dv", paramNames, paramValues);
        }

        /// <summary>
        /// Thêm bản ghi vào bảng danh mục.
        /// </summary>
        /// <param name="ma_dv"></param>
        /// <param name="dv"></param>
        public static void Insert(string ma_dv, string dv)
        {
            string[] paramNames = new string[] { "ma_dv", "dv" };
            string[] paramValues = new string[] { ma_dv, dv };

            HutStaff.DAL.Quanly.Repository.Execute("sp_insert_dm_dv", paramNames, paramValues);
        }

        /// <summary>
        /// Tìm trong bảng dm_dv giá trị 'value' với tham số 'key'.
        /// 'type' có thể là "id" hoặc "name".
        /// </summary>
        /// <param name="value">Giá trị cần tìm kiếm.</param>
        /// <param name="key">Tên tham số trong hàm tìm kiếm.</param>
        /// <param name="type">Kiểu tìm kiếm, theo "id" hoặc theo "name".</param>
        /// <returns></returns>
        public static bool Find(string value, string key, string type)
        {
            switch (type)
            {
                case "id":
                    return HutStaff.DAL.Quanly.Repository.Find("sp_find_by_id_dm_dv", key, value);
                case "name":
                    return HutStaff.DAL.Quanly.Repository.Find("sp_find_by_name_dm_dv", key, value);
                default:
                    return false;
            }
            
        }

        /// <summary>
        /// Xóa bản ghi có mã là 'ma_dv'.
        /// </summary>
        /// <param name="ma_dv"></param>
        public static void Delete(string ma_dv)
        {
            string[] paramNames = new string[] { "id" };
            string[] paramValues = new string[] { ma_dv };
            HutStaff.DAL.Quanly.Repository.Execute("sp_delete_dm_dv", paramNames, paramValues);
        }
    }
}
