using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Xml;
using HutStaff.Common;
using HutStaff.BO.Security;

namespace HutStaff.Administrator.Controls.Common
{
    public partial class ViewMenu : ControlBase
    {
        protected string sDefaultMenu;
        DataTable tblTab = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (tblTab == null)
            {
                tblTab = new DataTable();
                tblTab.Columns.Add(new DataColumn("alias"));
                tblTab.Columns.Add(new DataColumn("name"));
                XmlDocument xmlDocument = HutStaff.Common.Menu.GetData();
                foreach (XmlNode xmlMenu in xmlDocument.SelectNodes("//menu"))
                {
                    BindBoxItem(xmlMenu.Attributes["alias"].Value, xmlMenu.Attributes["name"].Value);
                }
            }
            rptBoxes.DataSource = tblTab;
            rptBoxes.DataBind();
        }

        private void BindBoxItem(string alias, string name)
        {
            DataRow row = tblTab.NewRow();
            row[0] = alias;
            row[1] = name;
            tblTab.Rows.Add(row);

            if (string.IsNullOrEmpty(sDefaultMenu))
            {
                sDefaultMenu = alias;
            }
        }
    }
}