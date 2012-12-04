﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using HutStaff.DAL.PagesDAL.TimKiem;

namespace HutStaff.BO.PagesBO.TimKiem
{
    public class SearchBO
    {
        public static DataTable Search_soyeu_all(string ma_dv, string ten, decimal gioitinh, int tuTuoi, int denTuoi, int diencb, int khoicb, int nvtruong, int PageIndex, int PageSize)
        {
            return DAL.PagesDAL.TimKiem.SearchDAL.Search_soyeu(ma_dv, ten, gioitinh, tuTuoi, denTuoi, diencb, khoicb, nvtruong, PageIndex, PageSize);
        }

        public static int Search_soyeu_all_total(string ma_dv, string ten, decimal gioitinh, int tuTuoi, int denTuoi, int diencb, int khoicb, int nvtruong)
        {
            return DAL.PagesDAL.TimKiem.SearchDAL.Search_soyeu_total(ma_dv, ten, gioitinh, tuTuoi, denTuoi, diencb, khoicb, nvtruong);
        }

        public static string SendEmail(string Receiver, string Title, string Content)
        {
            List<string> lstEmail = new List<string>(Receiver.Split(','));
            string sContent = System.Web.HttpUtility.UrlDecode(Content) + "<style type='text/css'>ol,ul,dl { *margin-right:0px;padding:0 40px !important;}</style>";
            string sSubject = Title;

            for (int i = 0; i < lstEmail.Count; i += 10)
            {
                List<string> lst10Emails = new List<string>();
                int j = i;
                while (j < i + 10 && j < lstEmail.Count)
                {
                    if (!String.IsNullOrEmpty(lstEmail[j]))
                        lst10Emails.Add(lstEmail[j]);
                    j++;
                }
                HutStaff.Common.AutoMail.SendTo(lst10Emails, sSubject, sContent);
            }
            return " $('#spSending').hide(0);alert('Đã gửi thành công');";
        }

    }
}