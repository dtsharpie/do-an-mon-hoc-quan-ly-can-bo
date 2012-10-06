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
    }
}
