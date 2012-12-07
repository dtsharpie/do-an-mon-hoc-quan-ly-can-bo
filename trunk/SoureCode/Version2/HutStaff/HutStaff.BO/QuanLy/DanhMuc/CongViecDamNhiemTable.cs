using System;
using System.Data;
using System.Linq;

namespace HutStaff.BO.QuanLy.DanhMuc
{
    public class CongViecDamNhiemTable : DanhMucTableBase
    {

        #region //--------- Abstract Class Members ------//

        protected override string TableName
        {
            get
            {
                return "dm_cvdn";
            }
        }

        protected override string[] CheckExistedParamNames
        {
            get
            {
                return new string[] { "cvdn" };
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
                return new string[] { "cvdn" };
            }
        }

        protected override string[] InsertParamNames
        {
            get
            {
                return new string[] { "cvdn" };
            }
        }

        protected override string[] UpdateParamNames
        {
            get
            {
                return new string[] { "id", "cvdn" };
            }
        }

        #endregion

    }
}