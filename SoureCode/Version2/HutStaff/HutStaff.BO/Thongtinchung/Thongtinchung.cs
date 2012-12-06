﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace HutStaff.BO.Thongtinchung
{
    public class Thongtinchung
    {
        public static DataTable GetById(int shcc)
        {
            return DAL.Thongtinchung.Thongtinchung.GetById(shcc);
        }

        public static string Update(int shcc, int ma_hktt, string cthktt, string dctt, string tel, string email, string scmnd, int nc, DateTime ngay_cap)
        {
            DAL.Thongtinchung.Thongtinchung.Update(shcc, ma_hktt, cthktt, dctt, tel, email, scmnd, nc, ngay_cap);
            return "alert('Cập nhật thành công');";
        }

        public static DataTable GetChucvuDangById(int shcc)
        {
            return DAL.Thongtinchung.Thongtinchung.GetChucvuDangById(shcc);
        }

        public static DataTable GetChucvuDoantheById(int shcc)
        {
            return DAL.Thongtinchung.Thongtinchung.GetChucvuDoantheById(shcc);
        }
        public static DataTable GetTrinhdoNgoaiNguById(int shcc)
        {
            return DAL.Thongtinchung.Thongtinchung.GetTrinhdoNgoaiNguById(shcc);
        }

        public static DataTable GetQuatrinhKhenThuongById(int shcc)
        {
            return DAL.Thongtinchung.Thongtinchung.GetQuatrinhKhenThuongById(shcc);
        }

        public static DataTable GetQuatrinhKyLuatById(int shcc)
        {
            return DAL.Thongtinchung.Thongtinchung.GetQuatrinhKyLuatById(shcc);
        }

        public static DataTable GetQuatrinhDienBienLuongById(int shcc)
        {
            return DAL.Thongtinchung.Thongtinchung.GetQuatrinhDienBienLuongById(shcc);
        }

        public static DataTable GetQhgdById(int shcc)
        {
            return DAL.Thongtinchung.Thongtinchung.GetQhgdById(shcc);
        }

        public static DataTable GetNnddById(int shcc)
        {
            return DAL.Thongtinchung.Thongtinchung.GetNnddById(shcc);
        }

        public static DataTable GetChucdanh(int shcc)
        {
            return DAL.Thongtinchung.Thongtinchung.GetChucdanh(shcc);
        }

        public static DataTable Getchucvuchinhquyen(int shcc)
        {
            return DAL.Thongtinchung.Thongtinchung.Getchucvuchinhquyen(shcc);
        }

        public static DataTable GetQuatrinhdaotao(int shcc)
        {
            return DAL.Thongtinchung.Thongtinchung.GetQuatrinhdaotao(shcc);
        }

        public static DataTable GetQuatrinhboiduong(int shcc)
        {
            return DAL.Thongtinchung.Thongtinchung.GetQuatrinhboiduong(shcc);
        }

        public static DataTable GetQuatrinhcongtac(int shcc)
        {
            return DAL.Thongtinchung.Thongtinchung.GetQuatrinhcongtac(shcc);
        }





        //insert database
        public static void InsertNgoaiNgu(int shcc, int ma_nn, int ma_td, string ttk)
        {
            HutStaff.DAL.Thongtinchung.Thongtinchung.InsertTrinhDoNgoaiNgu(shcc, ma_nn, ma_td, ttk);
        }

        public static DataTable FindByIDTrinhDoNgoaiNgu_TBL(int id)
        {
            return HutStaff.DAL.Thongtinchung.Thongtinchung.FindByIDTrinhDoNgoaiNgu_TBL(id);
        }

        public static void UpdateTrinhdoNgoaiNgu(int id, int ma_nn, int ma_td, string ttk_tdnn)
        {
            HutStaff.DAL.Thongtinchung.Thongtinchung.UpdateTrinhdoNgoaiNgu(id, ma_nn, ma_td, ttk_tdnn);
        }

        public static void DeleteTrinhDoNgoaiNgu(int id)
        {
            HutStaff.DAL.Thongtinchung.Thongtinchung.DeleteTrinhDoNgoaiNgu(id);
        }


        // cac chuc danh
        public static void InsertCacChucDanh(int shcc, int ma_hp, int npdp, int lcd, int cdcn, string ttk_qtcd, DateTime ntnphd)
        {
            HutStaff.DAL.Thongtinchung.Thongtinchung.InsertCacChuDanh(shcc, ma_hp, npdp, lcd, cdcn, ttk_qtcd, ntnphd);
        }

        public static void DeleteCacChucDanh(int id)
        {
            HutStaff.DAL.Thongtinchung.Thongtinchung.DeleteCacChucDanh(id);
        }

        public static DataTable GetAllDanhHieuDuocPhong()
        {
            return HutStaff.DAL.Thongtinchung.Thongtinchung.GetAllDanhHieuDuocPhong();
        }

        public static DataTable FindCacDanhHieuByID(int id)
        {
            return DAL.Thongtinchung.Thongtinchung.FindCacDanhHieuByID(id);
        }

        public static void UpdateCacChucDanh(int id, int shcc, int ma_hp, int npdp, int lcd, int cdcn, string ttk_qtcd, DateTime ntnphd)
        {
            DAL.Thongtinchung.Thongtinchung.UpdateCacChucDanh(id, shcc, ma_hp, npdp, lcd, cdcn, ttk_qtcd, ntnphd);
        }


        //trang khen thuong
        public static DataTable GetAllDanhMucKhenThuong()
        {
            return DAL.Thongtinchung.Thongtinchung.GetAllDanhMucKhenThuong();
        }
        public static void InsertKhenThuong(int shcc, int ma_htkt, DateTime nkt_qtkt, string soqd_qtkt, string ttk_qtkt)
        {
            DAL.Thongtinchung.Thongtinchung.InsertKhenThuong(shcc, ma_htkt, nkt_qtkt, soqd_qtkt, ttk_qtkt);
        }

        public static void UpdateKhenThuong(int id, int ma_htkt, DateTime nkt_qtkt, string soqd_qtkt, string ttk_qtkt)
        {
            DAL.Thongtinchung.Thongtinchung.UpdateKhenThuong(id, ma_htkt, nkt_qtkt, soqd_qtkt, ttk_qtkt);
        }


        public static void DeleteKhenThuong(int id)
        {
            DAL.Thongtinchung.Thongtinchung.DeleteKhenThuong(id);
        }

        public static DataTable FinByIDKhenThuong(int id)
        {
            return DAL.Thongtinchung.Thongtinchung.FindByIDKhenThuong(id);
        }


        // trang ky luat
        public static void InsertKyLuat(int shcc, int ma_htkl, DateTime nkl, DateTime nxkl, string ldkl, string ttk_qtkl)
        {
            DAL.Thongtinchung.Thongtinchung.InsertKyLuat(shcc, ma_htkl, nkl, nxkl, ldkl, ttk_qtkl);
        }

        public static void UpdateKyLuat(int id, int ma_htkl, DateTime nkl, DateTime nxkl, string ldkl, string ttk_qtkl)
        {
            DAL.Thongtinchung.Thongtinchung.UpdateKyLuat(id, ma_htkl, nkl, nxkl, ldkl, ttk_qtkl);
        }
        public static void DeleteKyLuat(int id)
        {
            DAL.Thongtinchung.Thongtinchung.DeleteKyLuat(id);
        }

        public static DataTable GetAllKyLuat()
        {
            return DAL.Thongtinchung.Thongtinchung.GetAllKyLuat();
        }
        public static DataTable FindByIDKyLuat(int id)
        {
            return DAL.Thongtinchung.Thongtinchung.FindByIDKyLuat(id);
        }


      // dien bien luong
        public static void InsertDienBienLuong(int shcc, DateTime tgbd_dbl, DateTime tgkt_dbl, string ma_ngach, decimal bl_dbl, decimal hsl, decimal hspccv, string ttk_qtdbl, decimal hspctn, decimal hspckv, decimal ts, int hnay)
        {
            DAL.Thongtinchung.Thongtinchung.InsertDienBienLuong(shcc, tgbd_dbl, tgkt_dbl, ma_ngach, bl_dbl, hsl, hspccv, ttk_qtdbl, hspctn, hspckv, ts, hnay);
        }

        public static void UpdateDienBienLuong(int id, DateTime tgbd_dbl, DateTime tgkt_dbl, string ma_ngach, decimal bl_dbl, decimal hsl, decimal hspccv, string ttk_qtdbl, decimal hspctn, decimal hspckv, decimal ts, int hnay)
        {
            DAL.Thongtinchung.Thongtinchung.UpdateDienBienLuong(id, tgbd_dbl, tgkt_dbl, ma_ngach, bl_dbl, hsl, hspccv, ttk_qtdbl, hspctn, hspckv, ts, hnay);
        }
        public static DataTable GetAllNgach()
        {
            return DAL.Thongtinchung.Thongtinchung.GetAllNgach();
        }
        public static void DeleteDienBienLuong(int id)
        {
            DAL.Thongtinchung.Thongtinchung.DeletedDienBienLuong(id);
        }

        public static DataTable FindDienBienLuongByID(int id)
        {
            return DAL.Thongtinchung.Thongtinchung.FindDienBienLuongByID(id);
        }

    

        //Quan he gia dinh
        public static void InsertQuanHeGiaDinh(string qhgd)
        {
            DAL.Thongtinchung.Thongtinchung.InsertQuanHeGiaDinh(qhgd);
        }
        public static void UpdateQuanHeGiaDinh(int id, string qhgd)
        {
            DAL.Thongtinchung.Thongtinchung.UpdateQuanHeGiaDinh(id, qhgd);
        }
        public static void DeleteQuanHeGiaDinh(int id)
        {
            DAL.Thongtinchung.Thongtinchung.DeleteQuanHeGiaDinh(id);
        }

        //Nuoc Ngoai Da Di
        public static void InsertNuocNgoaiDaDi(int shcc, DateTime nd_nndd, DateTime nv_nndd, int ndd, string dc_nndd, int md_nndd, string dg_nndd, string ttk_nndd, int nkp_nndd, string tt_nndd)
        {
            DAL.Thongtinchung.Thongtinchung.InsertNuocNgoaiDaDi(shcc, nd_nndd, nv_nndd, ndd, dc_nndd, md_nndd, dg_nndd, ttk_nndd, nkp_nndd, tt_nndd);
        }
        public static void UpdateNuocNgoaiDaDi(int id, DateTime nd_nndd, DateTime nv_nndd, int ndd, string dc_nndd, int md_nndd, string dg_nndd, string ttk_nndd, int nkp_nndd, string tt_nndd)
        {
            DAL.Thongtinchung.Thongtinchung.UpdateNuocNgoaiDaDi(id, nd_nndd, nv_nndd, ndd, dc_nndd, md_nndd, dg_nndd, ttk_nndd, nkp_nndd, tt_nndd);
        }
        public static void DeleteNuocNgoaiDaDi(int id)
        {
            DAL.Thongtinchung.Thongtinchung.DeleteNuocNgoaiDaDi(id);
        }

        //Qua Trinh Dao Tao
        public static void InsertQuaTrinhDaoTao(int shcc, DateTime tgbd_dtcm, DateTime tgkt_dtcm, string csdtcm, int ndtcm, int ma_cndt, int htdtcm, int vbdtcm, string xl_dtcm, int cmpcp_cndt, int hvcn_cndt, string ttk_qtdt)
        {
            DAL.Thongtinchung.Thongtinchung.InsertQuaTrinhDaoTao(shcc, tgbd_dtcm, tgkt_dtcm, csdtcm, ndtcm, ma_cndt, htdtcm, vbdtcm, xl_dtcm, cmpcp_cndt, hvcn_cndt, ttk_qtdt);
        }
        public static void UpdateQuaTrinhDaoTao(int id, DateTime tgbd_dtcm, DateTime tgkt_dtcm, string csdtcm, int ndtcm, int ma_cndt, int htdtcm, int vbdtcm, string xl_dtcm, int cmpcp_cndt, int hvcn_cndt, string ttk_qtdt)
        {
            DAL.Thongtinchung.Thongtinchung.UpdateQuaTrinhDaoTao(id, tgbd_dtcm, tgkt_dtcm, csdtcm, ndtcm, ma_cndt, htdtcm, vbdtcm, xl_dtcm, cmpcp_cndt, hvcn_cndt, ttk_qtdt);
        }
        public static void DeleteQuaTrinhDaoTao(int id)
        {
            DAL.Thongtinchung.Thongtinchung.DeleteQuaTrinhDaoTao(id);
        }

        //Quy Trinh Boi Duong
        public static void InsertQuyTrinhBoiDuong(int shcc, DateTime tgbd_bd, DateTime tgkt_bd, string ndbd, int htbd, string nbd_qtbd, string vbbd, string dg_qtbd, string ttk_qtbd)
        {
            DAL.Thongtinchung.Thongtinchung.InsertQuyTrinhBoiDuong(shcc, tgbd_bd, tgkt_bd, ndbd, htbd, nbd_qtbd, vbbd, dg_qtbd, ttk_qtbd);
        }
        public static void UpdateQuyTrinhBoiDuong(int id, DateTime tgbd_bd, DateTime tgkt_bd, string ndbd, int htbd, string nbd_qtbd, string vbbd, string dg_qtbd, string ttk_qtbd)
        {
            DAL.Thongtinchung.Thongtinchung.UpdateQuyTrinhBoiDuong(id, tgbd_bd, tgkt_bd, ndbd, htbd, nbd_qtbd, vbbd, dg_qtbd, ttk_qtbd);
        }
        public static void DeleteQuyTrinhBoiDuong(int id)
        {
            DAL.Thongtinchung.Thongtinchung.DeleteQuyTrinhBoiDuong(id);
        }
    }
}
