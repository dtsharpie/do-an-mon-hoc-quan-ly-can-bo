using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace HutStaff.BO.PagesBO.BaoCaoBO
{
    public class BaoCaoBO
    {
        public static DataTable ViewAlldm_dv()
        {
            return DAL.PagesDAL.BaoCaoDAL.BaoCaoDAL.ViewAlldm_dv();
        }

        public static DataTable ViewAlldm_dcb()
        {
            return DAL.PagesDAL.BaoCaoDAL.BaoCaoDAL.ViewAlldm_dcb();
        }

        public static DataTable ViewAlldm_kt()
        {
            return DAL.PagesDAL.BaoCaoDAL.BaoCaoDAL.ViewAlldm_kt();
        }

        public static DataTable ViewAlldm_kcb()
        {
            return DAL.PagesDAL.BaoCaoDAL.BaoCaoDAL.ViewAlldm_kcb();
        }



        //public static DataTable search_Kt(string ma_dv, int shcc, string name,
        //    int tunam, int dennam, int diencb, int khoicb,
        //    int pageIndex, int pageSize)

        //{
        //    return DAL.PagesDAL.BaoCaoDAL.KhenThuongDAL.searchKhenthuong(ma_dv,shcc,name,tunam,dennam,diencb,khoicb,pageIndex,pageSize);
        //}


    }
}
