using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HutStaff.BO.QuanLy.DanhMuc
{
    public class HocHamTable : DanhMucTableBase
    {
        protected override string TableName
        {
            get
            {
                return "dm_hh";
            }
        }

        protected override string[] CheckExistedParamNames
        {
            get
            {
                
            }
        }

        protected override string[] DeleteParamNames
        {
            get
            {
                throw new NotImplementedException();
            }
        }

        protected override string[] FindByIdParamNames
        {
            get
            {
                throw new NotImplementedException();
            }
        }

        protected override string[] FindByNameParamNames
        {
            get
            {
                throw new NotImplementedException();
            }
        }

        protected override string[] InsertParamNames
        {
            get
            {
                return new string[] { "hh" };
            }
        }

        protected override string[] UpdateParamNames
        {
            get
            {
                return new string[] { "id", "hh" };
            }
        }
    }
}