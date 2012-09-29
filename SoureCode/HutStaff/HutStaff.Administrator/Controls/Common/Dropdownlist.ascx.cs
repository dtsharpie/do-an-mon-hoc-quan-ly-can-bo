using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HutStaff.Administrator.Controls.Common
{
    public partial class Dropdownlist : System.Web.UI.UserControl
    {
        public DataTable Datasource { get; set; }
        public string DisplayMember { get; set; }
        public string ValueMember { get; set; }
        public string Value { get; set; }
        public string Class { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlSelectUserControl.DataTextField = DisplayMember;
                ddlSelectUserControl.DataValueField = ValueMember;
                ddlSelectUserControl.DataSource = Datasource;
                if (!String.IsNullOrEmpty(Value))
                {
                    ddlSelectUserControl.SelectedValue = Value;
                }
                ddlSelectUserControl.DataBind();
            }
            else
            {
                Value = ddlSelectUserControl.SelectedValue;
            }
            ddlSelectUserControl.CssClass = Class;
        }
    }
}