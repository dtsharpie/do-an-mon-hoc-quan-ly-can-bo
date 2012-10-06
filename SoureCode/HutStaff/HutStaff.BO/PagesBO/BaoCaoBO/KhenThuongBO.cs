using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace HutStaff.BO.PagesBO.BaoCaoBO
{
    public class KhenThuongBO
    {
        public static DataTable ViewAlldm_kt()
        {
            return DAL.PagesDAL.BaoCaoDAL.KhenThuongDAL.ViewAlldm_kt();
        }
    }
}
