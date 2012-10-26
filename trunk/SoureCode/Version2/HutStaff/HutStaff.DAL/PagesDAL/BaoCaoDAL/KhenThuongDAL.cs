using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using HutStaff.Common;

namespace HutStaff.DAL.PagesDAL.BaoCaoDAL
{
   public class KhenThuongDAL
    {
        public static DataTable searchKhenthuong(string ma_dv, int shcc, string name,
            int tunam, int dennam, int diencb, int khoicb,
            int pageIndex, int pageSize)

        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("sp_search_kt", new string[]{
                    "@ma_dv", 
	                "@shcc",
	                "@ten",
	
	                "@tunam",
	                "@dennam",
	                "@diencb",
	                "@khoicanbo",
	
	                "@PageIndex",
	                "@PageSize",
	                "@Total"
                },
                new object[]
                {
                    ma_dv,shcc,name,tunam,dennam,diencb,khoicb,pageIndex,pageSize
                });
            }
        }
            
    }
}
