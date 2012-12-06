using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    public partial class TinhThanhPhoPage : DanhMucPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected override BO.QuanLy.DanhMuc.DanhMucTableBase DanhMucTable
        {
            get
            {
                throw new NotImplementedException();
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