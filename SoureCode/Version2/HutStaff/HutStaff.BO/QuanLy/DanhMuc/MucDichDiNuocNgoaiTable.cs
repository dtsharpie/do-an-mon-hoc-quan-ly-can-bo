using System;
using System.Data;
using System.Linq;

namespace HutStaff.BO.QuanLy.DanhMuc
{
    public class MucDichDiNuocNgoaiTable : DanhMucTableBase
    {

        #region //--------- Abstract Class Members ------//

        protected override string TableName
        {
            get
            {
                return "dm_mdnndd";
            }
        }

        protected override string[] CheckExistedParamNames
        {
            get
            {
                return new string[] { "mdnndd" };
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
                return new string[] { "mdnndd" };
            }
        }

        protected override string[] InsertParamNames
        {
            get
            {
                return new string[] { "mdnndd" };
            }
        }

        protected override string[] UpdateParamNames
        {
            get
            {
                return new string[] { "id", "mdnndd" };
            }
        }

        #endregion

    }
}