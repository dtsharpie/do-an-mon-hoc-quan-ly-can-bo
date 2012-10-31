using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using HutStaff.Common;

namespace HutStaff.DAL.PagesDAL.TimKiem
{
    public class SearchDAL
    {
        public static DataTable Search_soyeu(string ma_dv, string ten, decimal gioitinh, int tuTuoi, int denTuoi, int diencb, int khoicb, int nvtruong, int PageIndex, int PageSize)
        {
            using (MainDB db = new MainDB())
            {

                //System.Data.SqlClient.SqlParameter code = new System.Data.SqlClient.SqlParameter("@Total", SqlDbType.Int);
                //code.Direction = ParameterDirection.Output;
                return db.Execute("[sp_search_soyeu]",
                    new string[] { "@ma_dv", "@ten", "@gioitinh", "@tutuoi", "@dentuoi", "@diencb", "@khoicanbo", "@nvtruong", "@PageIndex", "@PageSize" },
                    new object[] { ma_dv, ten, gioitinh, tuTuoi, denTuoi, diencb, khoicb, nvtruong, PageIndex, PageSize });
            }
        }
    }
}
