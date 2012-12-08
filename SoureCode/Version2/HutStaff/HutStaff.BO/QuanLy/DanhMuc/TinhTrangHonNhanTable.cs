using System;
using System.Linq;
using System.Data;

namespace HutStaff.BO.QuanLy.DanhMuc
{
    public class TinhTrangHonNhanTable : DanhMucTableBase
    {
        protected override string TableName
        {
            get
            {
                return "dm_tthn";
            }
        }

        protected override string[] CheckExistedParamNames
        {
            get
            {
                return new string[] { "tthn" };
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
                return new string[] { "tthn" };
            }
        }

        protected override string[] InsertParamNames
        {
            get
            {
                return new string[] { "tthn" };
            }
        }

        protected override string[] UpdateParamNames
        {
            get
            {
                return new string[] { "id", "tthn" };
            }
        }
    }
}