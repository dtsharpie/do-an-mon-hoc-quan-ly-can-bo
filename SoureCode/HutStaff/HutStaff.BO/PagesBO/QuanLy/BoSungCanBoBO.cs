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

        public static object getDantoc()
        {
            return BoSungCanBoDAL.getDantoc();
        }

        public static object getTinhTrangHonNhan()
        {
            return BoSungCanBoDAL.getTinhTrangHonNhan();
        }

        public static object getTonGiao()
        {
            return BoSungCanBoDAL.getTonGiao();
        }

        public static object getThanhPhanXuatThan()
        {
            return BoSungCanBoDAL.getThanhPhanXuatThan();
        }

        public static object getGiaDinhChinhSach()
        {
            return BoSungCanBoDAL.getGiaDinhChinhSach();
        }

        public static object getKhoiCanBo()
        {
            return BoSungCanBoDAL.getKhoiCanBo();
        }

        public static object getTrinhDoLiLuan()
        {
            return BoSungCanBoDAL.getTrinhDoLiLuan();
        }

        public static object getTrinhDoNgoaiNgu()
        {
            return BoSungCanBoDAL.getTrinhDoNgoaiNgu();
        }

        public static object getTrinhDoHocVanPhoThong()
        {
            return BoSungCanBoDAL.getTrinhDoHocVanPhoThong();
        }

        public static object getTrinhDoTinHoc()
        {
            return BoSungCanBoDAL.getTrinhDoTinHoc();
        }

        public static object getDienUuTien()
        {
            return BoSungCanBoDAL.getDienUuTien();
        }
    }
}
