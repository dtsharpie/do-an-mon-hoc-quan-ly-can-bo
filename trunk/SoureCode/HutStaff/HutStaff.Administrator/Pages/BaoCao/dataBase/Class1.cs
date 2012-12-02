using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
namespace HutStaff.Administrator.Pages.BaoCao.dataBase
{
    public class Class1
    {
        //public string ho_va_ten;
        //public int so_hieu;
        //public string don_vi_cong_tac { get; set; }
        public IQueryable<Object> searchKt(int htkt = 0, string dvql = "", string dcb = "", string kcb = "", int fromYear = 0, int toYear = 0)
        {
           viewKhenthuongdbDataContext db = new viewKhenthuongdbDataContext();
           var x = db.View_Khenthuongs; foreach (var item in x)
           {
               item.nkt_qtkt
           }
           var kq = from tt in db.View_Khenthuongs
                    where ((tt.ma_htkt == htkt) && (tt.ma_dvql == dvql) && (tt.dcb == dcb) && (tt.kcb == kcb))
                    orderby tt.ten
                    select new 
                    {
                        ho_va_ten = tt.hodem + tt.ten,
                        so_hieu = tt.shcc,
                        don_vi_cong_tac = tt.dv,
                        hinh_thuc_khen_thuong = tt.kt,
                        nam_khen_thuong = tt.nkt_qtkt
                    };
           
                return kq;
           
        }

    }
}