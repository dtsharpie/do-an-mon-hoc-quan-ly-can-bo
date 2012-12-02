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

        public static DataTable ViewAll_4_dm_dv()
        {
            return DAL.PagesDAL.BaoCaoDAL.BaoCaoDAL.ViewAll_4_dm_dv();
        }

        public static DataTable ViewAll_123_dm_dv()
        {
            return DAL.PagesDAL.BaoCaoDAL.BaoCaoDAL.ViewAll_123_dm_dv();
        }

        public static DataTable ViewAlldm_tt()
        {
            return DAL.PagesDAL.BaoCaoDAL.BaoCaoDAL.ViewAlldm_tt();
        }

        public static DataTable View_DonVi_Cap4(String MadvCha)
        {
            return DAL.PagesDAL.BaoCaoDAL.BaoCaoDAL.View_DonVi_Cap4(MadvCha);
        }

        public static DataTable getReward(int hinhthuc, int tunam, int dennam, string donvi, int dcb, int kcb)
        {
            return DAL.PagesDAL.BaoCaoDAL.BaoCaoDAL.getReward(hinhthuc, tunam, dennam, donvi, dcb, kcb);
        }

    }
}
