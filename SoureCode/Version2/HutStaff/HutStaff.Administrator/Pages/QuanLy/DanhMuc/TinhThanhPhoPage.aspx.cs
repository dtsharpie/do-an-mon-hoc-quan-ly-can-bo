using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.QuanLy.DanhMuc;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class TinhThanhPhoPage : DanhMucPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                InsertColumn(0, "ma_ttp", "Mã tỉnh thành phố");
                InsertColumn(1, "ttp", "Tỉnh thành phố");

                FillData();
            }
        }

        protected override BO.QuanLy.DanhMuc.DanhMucTableBase DanhMucTable
        {
            get
            {
                return new TinhThanhPhoTable();
            }
        }

        protected override void OnInsertButtonClick(object sender, EventArgs args)
        {
            throw new NotImplementedException();
        }

        protected override void OnSaveButtonClick(object sender, EventArgs args)
        {
            throw new NotImplementedException();
        }

        protected override void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args)
        {
            throw new NotImplementedException();
        }

        protected override void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args)
        {
            throw new NotImplementedException();
        }
    }
}