﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HutStaff.BO.QuanLy.DanhMuc
{
    public class VanBangDaoTaoTable : DanhMucTableBase
    {
        protected override string TableName
        {
            get
            {
                return "dm_vbdt";
            }
        }

        protected override string[] CheckExistedParamNames
        {
            get
            {
                return new string[] { "vbdt" };
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
                return new string[] { "vbdt" };
            }
        }

        protected override string[] InsertParamNames
        {
            get
            {
                return new string[] { "vbdt" };
            }
        }

        protected override string[] UpdateParamNames
        {
            get
            {
                return new string[] { "id", "vbdt" };
            }
        }
    }
}