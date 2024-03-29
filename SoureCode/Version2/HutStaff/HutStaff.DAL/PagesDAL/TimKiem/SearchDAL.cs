﻿using System;
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
                return db.Execute("[HutStaff_search_soyeu]",
                    new string[] { "@ma_dv", "@ten", "@gioitinh", "@tutuoi", "@dentuoi", "@diencb", "@khoicanbo", "@nvtruong", "@PageIndex", "@PageSize" },
                    new object[] { ma_dv, ten, gioitinh, tuTuoi, denTuoi, diencb, khoicb, nvtruong, PageIndex, PageSize });
            }
        }

        public static int Search_soyeu_total(string ma_dv, string ten, decimal gioitinh, int tuTuoi, int denTuoi, int diencb, int khoicb, int nvtruong)
        {
            using (MainDB db = new MainDB())
            {
                return Convert.ToInt32(db.Execute("[HutStaff_search_soyeu_count]",
                    new string[] { "@ma_dv", "@ten", "@gioitinh", "@tutuoi", "@dentuoi", "@diencb", "@khoicanbo", "@nvtruong" },
                    new object[] { ma_dv, ten, gioitinh, tuTuoi, denTuoi, diencb, khoicb, nvtruong }).Rows[0][0]);
            }
        }

        public static void Huyhoso_Insert(int userId, int shcc)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("[HutStaff_huyhoso_insert]",
                   new string[] { "@userId" , "@shcc" },
                   new object[] { userId , shcc });
            }
        }
    }
}
