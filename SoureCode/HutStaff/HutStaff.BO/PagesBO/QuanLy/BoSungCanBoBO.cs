using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using HutStaff.DAL.PagesDAL.QuanLy;

namespace HutStaff.BO.PagesBO.QuanLy
{
    public class BoSungCanBoBO
    {
        public static DataTable getDienCanBo()
        {
            DataTable dt = new DataTable();
            try
            {
                dt = BoSungCanBoDAL.getDienCanBo();
            }
            catch (Exception e)
            {
            }
            finally
            {
            }
            return dt;
        }

        public static DataTable getDonVi()
        {
            DataTable dt = new DataTable();
            try
            {
                dt = BoSungCanBoDAL.getDonVi();
            }
            catch (Exception e)
            {
            }
            finally
            {
            }
            return dt;
        }

        public static Dictionary<string, int> getQueHuong()
        {
            Dictionary<string, int> homeList = null;
            Dictionary<string, int> province = null;
            try
            {
                province = BoSungCanBoDAL.getTinh();
            }
            catch (Exception e)
            {
            }
            if (province.Count > 0)
            {
                foreach(KeyValuePair<string, int> p in province){
                    string provinceName = p.Key;    // ten Tinh
                    int provinceID = p.Value;       // ID Tinh
                    try
                    {
                        if (provinceID != 0)
                        {
                            DataTable dt = BoSungCanBoDAL.getHuyen(provinceID);
                            foreach (DataRow r in dt.Rows)
                            {
                                string homeName;            // ten ket hop giua ten Tinh va Huyen, co dang: tenTinh - Ten Huyen
                                int homeID;                 // = ma_huyen
                                string districName = r["ten_huyen"].ToString();
                                if ("".Equals(districName))
                                {
                                    homeName = provinceName;
                                }
                                else
                                {
                                    homeName = provinceName + " - " + r["ten_huyen"].ToString();
                                }
                                homeID = Int16.Parse(r["ma_huyen"].ToString());
                                homeList.Add(homeName, homeID);
                            }
                        }
                    }
                    catch (Exception e) { }                    
                }
            }
            return homeList;
        }


        public static Dictionary<string, int> getTinh()
        {
            return BoSungCanBoDAL.getTinh();
        }
    }
}
