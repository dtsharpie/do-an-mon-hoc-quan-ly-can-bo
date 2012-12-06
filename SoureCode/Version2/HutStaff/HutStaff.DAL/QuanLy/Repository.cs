using System;
using System.Linq;
using System.Data;
using HutStaff.Common;

namespace HutStaff.DAL.Quanly
{
    public static class Repository
    {
        /// <summary>
        /// Lấy tất cả dữ liệu trong 1 bảng.
        /// </summary>
        /// <param name="spName">Tên procedure dùng để lấy dữ liệu.</param>
        /// <returns></returns>
        public static DataTable GetAll(string spName)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute(spName, new string[] { }, new string[] { });
            }
        }

        /// <summary>
        /// Thực hiện 1 stored procedure.
        /// </summary>
        /// <param name="spName">Tên của procedure.</param>
        /// <param name="paramNames">Tên của các tham số.</param>
        /// <param name="paramValues">Giá trị tương ứng của các tham số.</param>
        /// <returns></returns>
        public static DataTable Execute(string spName, string[] paramNames, object[] paramValues)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute(spName, paramNames, paramValues);
            }
        }

        /// <summary>
        /// Tìm trong bảng tương ứng với store procedure 'spName' giá trị 'value'
        /// và tham số trong hàm tìm kiếm là 'key'.
        /// </summary>
        /// <param name="spName">Tên sp được gọi.</param>
        /// <param name="key">Tên tham số trong sp.</param>
        /// <param name="value">Giá trị dùng để tìm kiếm.</param>
        /// <returns></returns>
        public static bool Find(string spName, string key, string value)
        {
            string[] paramNames = new string[] { key };
            string[] paramValues = new string[] { value };

            DataTable result = Repository.Execute(spName, paramNames, paramValues);
            if (result.Rows.Count >0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
