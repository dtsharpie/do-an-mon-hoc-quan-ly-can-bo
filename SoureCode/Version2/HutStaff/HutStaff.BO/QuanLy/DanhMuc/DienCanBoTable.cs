using System;
using System.Linq;

namespace HutStaff.BO.QuanLy.DanhMuc
{
    public class DienCanBoTable : DanhMucTableBase
    {
        protected override string TableName
        {
            get
            {
                return "dm_dcb";
            }
        }

        protected override string[] CheckExistedParamNames
        {
            get
            {
                return new string[] { "dcb" };
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
                return new string[] { "dcb" };
            }
        }

        protected override string[] FindByNameParamNames
        {
            get
            {
                return new string[] { "id" };
            }
        }

        protected override string[] InsertParamNames
        {
            get
            {
                return new string[] { "dcb" };
            }
        }

        protected override string[] UpdateParamNames
        {
            get
            {
                return new string[] { "id", "dcb" };
            }
        }
    }
}