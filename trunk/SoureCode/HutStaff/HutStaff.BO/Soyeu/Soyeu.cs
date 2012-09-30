using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace HutStaff.BO.Soyeu
{
    public class Soyeu
    {
        public static DataTable GetById(int shcc)
        {
            return DAL.Soyeu.Soyeu.GetById(shcc);
        }
    }
}
