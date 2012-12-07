using System;
using System.Data;
using System.Linq;

namespace HutStaff.BO.QuanLy.DanhMuc
{
    public class MatBangBaoHiemTable : DanhMucTableBase
    {

        #region //--------- Abstract Class Members ------//

        protected override string TableName
        {
            get
            {
                return "mbbh";
            }
        }

        protected override string[] CheckExistedParamNames
        {
            get
            {
                return new string[] { "tinhtu" };
            }
        }

        protected override string[] DeleteParamNames
        {
            get
            {
                return new string[] { "ma_mbbh" };
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
                return new string[] { "tt" };
            }
        }

        protected override string[] InsertParamNames
        {
            get
            {
                return new string[] { "tinhtu", "bhxh", "bhyt", "bhtn" };
            }
        }

        protected override string[] UpdateParamNames
        {
            get
            {
                return new string[] { "ma_mbbh", "tinhtu", "bhxh", "bhyt", "bhtn" };
            }
        }

        #endregion

    }
}