using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace HutStaff.BO.PagesBO.BaoCaoBO
{
    public class BaoCaoThongKeBO
    {
        public static DataTable ViewAlldm_dv()
        {
            return DAL.PagesDAL.BaoCaoDAL.BaoCaoThongKeDAL.ViewAlldm_dv();
        }

        public static DataTable ViewAlldm_dcb()
        {
            return DAL.PagesDAL.BaoCaoDAL.BaoCaoThongKeDAL.ViewAlldm_dcb();
        }
    }
}
