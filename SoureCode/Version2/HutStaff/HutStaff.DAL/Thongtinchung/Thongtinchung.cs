using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using HutStaff.Common;

namespace HutStaff.DAL.Thongtinchung
{
    public class Thongtinchung
    {
        public static DataTable GetById(int shcc)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[HutStaff_ViewUser_soyeu_Thongtinchung_GetById]",
                     new string[] { "@shcc" },
                     new object[] { shcc });
            }
        }

        public static void Update(int shcc, int ma_hktt, string cthktt, string dctt, string tel, string email, string scmnd, int nc, DateTime ngay_cap)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("[HutStaff_ViewUser_UpdateInfo]",
                    new string[] { "@shcc", "@ma_hktt", "@cthktt", "@dctt", "@tel", "@email", "@scmnd", "@nc", "@ngay_cap" },
                    new object[] { shcc, ma_hktt, cthktt, dctt, tel, email, scmnd, nc, ngay_cap });

            }
        }

        public static DataTable GetChucvuDangById(int shcc)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[HutStaff_ViewUser_cvkn_GetById]",
                     new string[] { "@shcc" },
                     new object[] { shcc });
            }
        }

        public static DataTable GetChucvuDoantheById(int shcc)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[HutStaff_ViewUser_cvkn_GetById]",
                     new string[] { "@shcc" },
                     new object[] { shcc });
            }
        }

        public static DataTable GetTrinhdoNgoaiNguById(int shcc)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[HutStaff_ViewUser_tdnn_GetById]",
                     new string[] { "@shcc" },
                     new object[] { shcc });
            }
        }

        public static DataTable GetQuatrinhKhenThuongById(int shcc)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[HutStaff_ViewUser_qtkt_GetById]",
                    new string[] { "@shcc" },
                    new object[] { shcc });
            }
        }

        public static DataTable GetQuatrinhKyLuatById(int shcc)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[HutStaff_ViewUser_qtkl_GetById]",
                    new string[] { "@shcc" },
                    new object[] { shcc });
            }
        }

        public static DataTable GetQuatrinhDienBienLuongById(int shcc)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[HutStaff_ViewUser_dbl_GetById]",
                    new string[] { "@shcc" },
                    new object[] { shcc });
            }
        }

        public static DataTable GetQhgdById(int shcc)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[HutStaff_ViewUser_qhgd_GetById]",
                    new string[] { "@shcc" },
                    new object[] { shcc });
            }
        }

        public static DataTable GetNnddById(int shcc)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[HutStaff_ViewUser_nndd_GetById]",
                    new string[] { "@shcc" },
                    new object[] { shcc });
            }
        }

        public static DataTable GetChucdanh(int shcc)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[HutStaff_ViewUser_dhdp_GetById]",
                    new string[] { "@shcc" },
                    new object[] { shcc });
            }
        }

        public static DataTable Getchucvuchinhquyen(int shcc)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[HutStaff_ViewUser_cvcq_GetById]",
                    new string[] { "@shcc" },
                    new object[] { shcc });
            }
        }

        public static DataTable GetQuatrinhdaotao(int shcc)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[HutStaff_ViewUser_qtdt_GetById]",
                    new string[] { "@shcc" },
                    new object[] { shcc });
            }
        }

        public static DataTable GetQuatrinhboiduong(int shcc)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[HutStaff_ViewUser_qtbd_GetById]",
                    new string[] { "@shcc" },
                    new object[] { shcc });
            }
        }

        public static DataTable GetQuatrinhcongtac(int shcc)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[HutStaff_ViewUser_qtct_GetById]",
                    new string[] { "@shcc" },
                    new object[] { shcc });
            }
        }














        // bổ sung cơ sở dữ liệu


        // trang ngoai ngu

        public static void InsertTrinhDoNgoaiNgu(int shcc, int ma_nn, int ma_td, string ttk_tdnn)
        {
            try
            {
                using (MainDB db = new MainDB())
                {
                    db.Execute("[sp_insert_tdnn_tbl]",
                    new string[] { "@shcc", "@ma_nn", "@ma_td", "@ttk_tdnn" },
                    new object[] { shcc, ma_nn, ma_td, ttk_tdnn });
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }


        public static DataTable FindByIDTrinhDoNgoaiNgu_TBL(int id)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[sp_find_by_id_tdnn_tbl]",
                    new string[] { "@id" },
                    new object[] { id });
            }
        }

        public static void UpdateTrinhdoNgoaiNgu(int id, int ma_nn, int ma_td, string ttk_tdnn)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("[sp_update_tdnn]",
                    new string[] { "@id", "@ma_nn", "@ma_td", "@ttk_tdnn" },
                    new object[] { id, ma_nn, ma_td, ttk_tdnn });
            }
        }


        public static void DeleteTrinhDoNgoaiNgu(int id)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("[sp_delete_dm_tdnn]",
                    new string[] { @"id" },
                    new object[] { id }
                    );
            }
        }



        // trang cac chuc danh
        public static void InsertCacChuDanh(int shcc, int ma_hp, int npdp, int lcd, int cdcn, string ttk_qtcd, DateTime ntnphd)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("[sp_insert_qtcd_tbl]",
                new string[] { "@shcc", "@ma_hp", "@npdp", "@lcd", "@cdcn", "@ttk_qtcd", "@ntnphd" },
                new object[] { shcc, ma_hp, npdp, lcd, cdcn, ttk_qtcd, ntnphd });
            }
        }

        public static void DeleteCacChucDanh(int id)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("[sp_delete_qtcd]",
                new string[] { "@id" },
                new object[] { id });

            }
        }

        public static void UpdateCacChucDanh(int id, int shcc, int ma_hp, int npdp, int lcd, int cdcn, string ttk_qtcd, DateTime ntnphd)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("[sp_update_qtcd_tbl]",
                new string[] { "@id", "@shcc", "@ma_hp", "@npdp", "@lcd", "@cdcn", "@ttk_qtcd", "@ntnphd" },
                new object[] { id, shcc, ma_hp, npdp, lcd, cdcn, ttk_qtcd, ntnphd });
            }
        }

        public static DataTable GetAllDanhHieuDuocPhong()
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[sp_view_all_dm_dhdp]");
            }
        }

        public static DataTable FindCacDanhHieuByID(int id)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[sp_find_by_id_qtcd_tbl]",
                new string[] { "@id" },
                new object[] { id });
            }
        }


        // trang khen thuong
        public static DataTable GetAllDanhMucKhenThuong()
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[sp_view_all_dm_kt]");
            }
        }


        public static void InsertKhenThuong(int shcc, int ma_htkt, DateTime nkt_qtkt, string soqd_qtkt, string ttk_qtkt)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("[sp_insert_qtkt]",
                    new string[] { "@shcc", "@ma_htkt", "@nkt_qtkt", "@soqd_qtkt", "@ttk_qtkt" },
                    new object[] { shcc, ma_htkt, nkt_qtkt, soqd_qtkt, ttk_qtkt }
                );
            }
        }

        public static void UpdateKhenThuong(int id, int ma_htkt, DateTime nkt_qtkt, string soqd_qtkt, string ttk_qtkt)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("[sp_update_qtkt]",
                    new string[] { "@id", "@ma_htkt", "@nkt_qtkt", "@soqd_qtkt", "@ttk_qtkt" },
                    new object[] { id, ma_htkt, nkt_qtkt, soqd_qtkt, ttk_qtkt }
                );
            }
        }


        public static void DeleteKhenThuong(int id)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("[sp_delete_qtkt]",
                                  new string[] { "@id" },
                                  new object[] { id }
                              );
            }
        }

        public static DataTable FindByIDKhenThuong(int id)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[sp_find_by_id_qtkt]",
                                  new string[] { "@id" },
                                  new object[] { id }
                              );
            }
        }


        // trang ky luat
        public static void InsertKyLuat(int shcc, int ma_htkl, DateTime nkl, DateTime nxkl, string ldkl, string ttk_qtkl)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("[sp_insert_qtkl]",
                    new string[] { "@shcc", "@ma_htkl", "@nkl", "@nxkl", "@ldkl", "@ttk_qtkl" },
                    new object[] { shcc, ma_htkl, nkl, nxkl, ldkl, ttk_qtkl });
            }
        }

        public static void UpdateKyLuat(int id, int ma_htkl, DateTime nkl, DateTime nxkl, string ldkl, string ttk_qtkl)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("[sp_update_qtkl]",
                    new string[] { "@id", "@ma_htkl", "@nkl", "@nxkl", "@ldkl", "@ttk_qtkl" },
                    new object[] { id, ma_htkl, nkl, nxkl, ldkl, ttk_qtkl });
            }
        }

        public static void DeleteKyLuat(int id)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("[sp_delete_qtkl]",
                                 new string[] { "@id" },
                                 new object[] { id });
            }
        }

        public static DataTable GetAllKyLuat()
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[sp_view_all_dm_kl]");
            }
        }

        public static DataTable FindByIDKyLuat(int id)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[sp_find_by_id_qtkl]",
                    new string[] { @"id" },
                new object[] { id });

            }
        }


        //dien bien luong
        public static void InsertDienBienLuong(int shcc, DateTime tgbd_dbl, DateTime tgkt_dbl, string ma_ngach, decimal bl_dbl, decimal hsl, decimal hspccv, string ttk_qtdbl, decimal hspctn, decimal hspckv,decimal ts,int hnay)
        {
            using (MainDB db = new MainDB())
            {
                 db.Execute("[sp_insert_qtdbl]",
                    new string[] { "@shcc", "@tgbd_dbl", "@tgkt_dbl", "@ma_ngach", "@bl_dbl", "@hsl", "@hspccv", "@ttk_qtdbl", "@hspctn", "@hspckv", "@ts", "@hnay" },
                new object[] { shcc, tgbd_dbl, tgkt_dbl, ma_ngach, bl_dbl, hsl, hspccv, ttk_qtdbl, hspctn, hspckv, ts, hnay });

            }
        }

        public static void UpdateDienBienLuong(int id, DateTime tgbd_dbl, DateTime tgkt_dbl, string ma_ngach, decimal bl_dbl, decimal hsl, decimal hspccv, string ttk_qtdbl, decimal hspctn, decimal hspckv, decimal ts, int hnay)
        {
            using (MainDB db = new MainDB())
            {
                
                    db.Execute("[sp_update_qtdbl]",
                       new string[] { "@id", "@tgbd_dbl", "@tgkt_dbl", "@ma_ngach", "@bl_dbl", "@hsl", "@hspccv", "@ttk_qtdbl", "@hspctn", "@hspckv", "@ts", "@hnay" },
                   new object[] { id, tgbd_dbl, tgkt_dbl, ma_ngach, bl_dbl, hsl, hspccv, ttk_qtdbl, hspctn, hspckv, ts, hnay });
                
            }
        }

        public static void DeletedDienBienLuong (int id)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("[sp_delete_qtdbl]",
                    new string[] {"@id"},
                    new object[] {id});
            }
        }

        public static DataTable GetAllNgach()
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[sp_view_all_dm_ngach]");
            }
        }

        public static DataTable FindDienBienLuongByID(int id)
        {
            using (MainDB db = new MainDB())
            {
                return db.Execute("[sp_find_by_id_qtdbl]",
                    new string[] { "@id" },
                new object[] { id });
            }
        }



        // Quan He Gia Dinh
        public static void InsertQuanHeGiaDinh(string qhgd)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("[sp_insert_dm_qhgd]",
                    new string[] { "@qhgd" },
                    new object[] { qhgd });
            }
        }

        public static void UpdateQuanHeGiaDinh(int id, string qhgd)
        {
            using (MainDB db = new MainDB())
            {
                db.Execute("[sp_update_dm_qhgd]",
                    new string[] { "@id", "@qhgd" },
                    new object[] { id, qhgd });
            }
        }

        public static void DeleteQuanHeGiaDinh(int id)
        {
            using (MainDB db = new MainDB())
                db.Execute("[sp_delete_dm_qhgd]", new string[] { "@id" }, new object[] { id });
        }

        // Nuoc Ngoai Da Di
        public static void InsertNuocNgoaiDaDi(int shcc, DateTime nd_nndd, DateTime nv_nndd, int ndd, string dc_nndd, int md_nndd, string dg_nndd, string ttk_nndd, int nkp_nndd, string tt_nndd)
        {
            using (MainDB db = new MainDB())
                db.Execute("[sp_insert_nndd]",
                    new string[] { "@shcc", "@nd_nndd", "@nv_nndd", "@ndd", "@dc_nndd", "@md_nndd", "@dg_nndd", "@ttk_nndd", "@nkp_nndd", "@tt_nndd" },
                    new object[] { shcc, nd_nndd, nv_nndd, ndd, dc_nndd, md_nndd, dg_nndd, ttk_nndd, nkp_nndd, tt_nndd });
        }

        public static void UpdateNuocNgoaiDaDi(int id, DateTime nd_nndd, DateTime nv_nndd, int ndd, string dc_nndd, int md_nndd, string dg_nndd, string ttk_nndd, int nkp_nndd, string tt_nndd)
        {
            using (MainDB db = new MainDB())
                db.Execute("[sp_update_nndd]",
                    new string[] { "@id", "@nd_nndd", "@nv_nndd", "@ndd", "@dc_nndd", "@md_nndd", "@dg_nndd", "@ttk_nndd", "@nkp_nndd", "@tt_nndd" },
                    new object[] { id, nd_nndd, nv_nndd, ndd, dc_nndd, md_nndd, dg_nndd, ttk_nndd, nkp_nndd, tt_nndd });
        }

        public static void DeleteNuocNgoaiDaDi(int id)
        {
            using (MainDB db = new MainDB())
                db.Execute("[sp_delete_nndd]", new string[] { "@id" }, new object[] { id });
        }

        // Qua Trinh Dao Tao
        public static void InsertQuaTrinhDaoTao(int shcc, DateTime tgbd_dtcm, DateTime tgkt_dtcm, string csdtcm, int ndtcm, int ma_cndt, int htdtcm, int vbdtcm, string xl_dtcm, int cmpcp_cndt, int hvcn_cndt, string ttk_qtdt)
        {
            using (MainDB db = new MainDB())
                db.Execute("[sp_insert_qtdtcm]",
                    new string[] { "@shcc", "@tgbd_dtcm", "@tgkt_dtcm", "@csdtcm", "@ndtcm", "@ma_cndt", "@htdtcm", "@vbdtcm", "@xl_dtcm", "@cmpcp_cndt", "@hvcn_cndt", "@ttk_qtdt" },
                    new object[] { shcc, tgbd_dtcm, tgkt_dtcm, csdtcm, ndtcm, ma_cndt, htdtcm, vbdtcm, xl_dtcm, cmpcp_cndt, hvcn_cndt, ttk_qtdt });
        }

        public static void UpdateQuaTrinhDaoTao(int id, DateTime tgbd_dtcm, DateTime tgkt_dtcm, string csdtcm, int ndtcm, int ma_cndt, int htdtcm, int vbdtcm, string xl_dtcm, int cmpcp_cndt, int hvcn_cndt, string ttk_qtdt)
        {
            using (MainDB db = new MainDB())
                db.Execute("[sp_update_qtdtcm]",
                    new string[] { "@id", "@tgbd_dtcm", "@tgkt_dtcm", "@csdtcm", "@ndtcm", "@ma_cndt", "@htdtcm", "@vbdtcm", "@xl_dtcm", "@cmpcp_cndt", "@hvcn_cndt", "@ttk_qtdt" },
                    new object[] { id, tgbd_dtcm, tgkt_dtcm, csdtcm, ndtcm, ma_cndt, htdtcm, vbdtcm, xl_dtcm, cmpcp_cndt, hvcn_cndt, ttk_qtdt });
        }

        public static void DeleteQuaTrinhDaoTao(int id)
        {
            using (MainDB db = new MainDB())
                db.Execute("[sp_delete_qtdtcm]", new string[] { "@id" }, new object[] { id });
        }

        //Quy Trinh Boi Duong
        public static void InsertQuyTrinhBoiDuong(int shcc, DateTime tgbd_bd, DateTime tgkt_bd, string ndbd, int htbd, string nbd_qtbd, string vbbd, string dg_qtbd, string ttk_qtbd)
        {
            using (MainDB db = new MainDB())
                db.Execute("[sp_insert_qtbd]",
                    new string[] { "@shcc", "@tgbd_bd", "@tgkt_bd", "@ndbd", "@htbd", "@nbd_qtbd", "@vbbd", "@dg_qtbd", "@ttk_qtbd" },
                    new object[] { shcc, tgbd_bd, tgkt_bd, ndbd, htbd, nbd_qtbd, vbbd, dg_qtbd, ttk_qtbd });
        }

        public static void UpdateQuyTrinhBoiDuong(int id, DateTime tgbd_bd, DateTime tgkt_bd, string ndbd, int htbd, string nbd_qtbd, string vbbd, string dg_qtbd, string ttk_qtbd)
        {
            using (MainDB db = new MainDB())
                db.Execute("[sp_update_qtbd]",
                    new string[] { "@id", "@tgbd_bd", "@tgkt_bd", "@ndbd", "@htbd", "@nbd_qtbd", "@vbbd", "@dg_qtbd", "@ttk_qtbd" },
                    new object[] { id, tgbd_bd, tgkt_bd, ndbd, htbd, nbd_qtbd, vbbd, dg_qtbd, ttk_qtbd });
        }

        public static void DeleteQuyTrinhBoiDuong(int id)
        {
            using (MainDB db = new MainDB())
                db.Execute("[sp_update_qtbd]", new string[] { "@id" }, new object[] { id });
        }
    }
}
