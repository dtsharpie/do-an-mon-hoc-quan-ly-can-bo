using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using HutStaff.DAL.PagesDAL.TimKiem;

namespace HutStaff.BO.PagesBO.TimKiem
{
    public class SearchBO
    {
        public static DataTable Search_soyeu_all(string ma_dv, string ten, decimal gioitinh, int tuTuoi, int denTuoi, int diencb, int khoicb, int nvtruong,string deletes ,int PageIndex, int PageSize )
        {
            return DAL.PagesDAL.TimKiem.SearchDAL.Search_soyeu(ma_dv, ten, gioitinh, tuTuoi, denTuoi, diencb, khoicb, nvtruong, deletes, PageIndex, PageSize);
        }

        public static int Search_soyeu_all_total(string ma_dv, string ten, decimal gioitinh, int tuTuoi, int denTuoi, int diencb, int khoicb, int nvtruong, string deletes)
        {
            return DAL.PagesDAL.TimKiem.SearchDAL.Search_soyeu_total(ma_dv, ten, gioitinh, tuTuoi, denTuoi, diencb, khoicb, nvtruong, deletes);
        }
    }
}
