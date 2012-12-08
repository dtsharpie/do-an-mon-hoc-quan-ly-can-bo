using System;
using System.Linq;
using System.Data;

namespace HutStaff.BO.QuanLy.DanhMuc
{
    public class TinhThanhPhoTable : DanhMucTableBase
    {
        protected override string TableName
        {
            get
            {
                return "dm_ttp";
            }
        }

        protected override string[] CheckExistedParamNames
        {
            get
            {
                return new string[] { "ttp" };
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
                return new string[] { "ttp" };
            }
        }

        protected override string[] InsertParamNames
        {
            get
            {
                return new string[] { "ttp" };
            }
        }

        protected override string[] UpdateParamNames
        {
            get
            {
                return new string[] { "id", "ttp" };
            }
        }
    }
}