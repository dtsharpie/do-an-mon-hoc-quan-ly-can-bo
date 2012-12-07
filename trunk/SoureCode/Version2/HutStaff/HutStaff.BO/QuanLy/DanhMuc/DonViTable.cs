using System;
using System.Linq;

namespace HutStaff.BO.QuanLy.DanhMuc
{
    public class DonViTable : DanhMucTableBase
    {
        protected override string TableName
        {
            get
            {
                return "dm_dv";
            }
        }

        protected override string[] CheckExistedParamNames
        {
            get
            {
                return new string[] { "dv" };
            }
        }

        protected override string[] DeleteParamNames
        {
            get
            {
                return new string[] { "id" };
            }
        }

        protected override string[] FindByIdParamNames
        {
            get
            {
                return new string[] { "id" };
            }
        }

        protected override string[] FindByNameParamNames
        {
            get
            {
                return new string[] { "dv" };
            }
        }

        protected override string[] InsertParamNames
        {
            get
            {
                return new string[] { "ma_dv", "dv" };
            }
        }

        protected override string[] UpdateParamNames
        {
            get
            {
                return new string[] { "id", "dv" };
            }
        }
    }
}