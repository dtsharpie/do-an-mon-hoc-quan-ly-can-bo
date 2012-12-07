using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace HutStaff.BO.PagesBO.QuanLy
{
   public class Huyhoso
    {
       public static DataTable Search(string ten, int trangthai, int pageIndex, int pageSize)
       {
           return DAL.PagesDAL.QuanLy.Huyhoso.Search(ten, trangthai, pageIndex, pageSize);
       }
    }
}
