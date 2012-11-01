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
    }
}
