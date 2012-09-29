using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace HutStaff.BO.Tinhthanhpho
{
   public class Tinhthanhpho
    {
       public static DataTable GetAll()
       {
           return DAL.Tinhthanhpho.Tinhthanpho.GetAll();
       }
    }
}
