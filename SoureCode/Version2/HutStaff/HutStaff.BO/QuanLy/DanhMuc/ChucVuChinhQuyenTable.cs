﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HutStaff.BO.QuanLy.DanhMuc
{
    public class ChucVuChinhQuyenTable : DanhMucTableBase
    {
        protected override string TableName
        {
            get
            {
                return "dm_cv";
            }
        }

        protected override string[] CheckExistedParamNames
        {
            get
            {
                return new string[] { "cvcq" };
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
                return new string[] { "cvcq" };
            }
        }

        protected override string[] InsertParamNames
        {
            get
            {
                return new string[] { "cvcq" };
            }
        }

        protected override string[] UpdateParamNames
        {
            get
            {
                return new string[] { "id", "cvcq" };
            }
        }
    }
}
