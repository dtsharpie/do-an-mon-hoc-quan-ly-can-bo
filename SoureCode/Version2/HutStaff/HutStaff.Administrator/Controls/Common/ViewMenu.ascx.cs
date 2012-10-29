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

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected string GenMenu()
        {
            XmlDocument xmlDocument = HutStaff.Common.Menu.GetData();
            string sHtml = "";
            XmlNodeList xmlMenus = xmlDocument.SelectNodes("//menu[@type='view']");
            for (int i = 0; i < xmlMenus.Count; i++)
            {
                XmlNode xmlMenu = xmlMenus[i];
                if (String.IsNullOrEmpty(sDefaultMenu))
                {
                    sDefaultMenu = xmlMenu.Attributes["alias"].Value;
                }
                sHtml += "<li><a href=\"#" + xmlMenu.Attributes["alias"].Value + "\">" + xmlMenu.Attributes["name"].Value + "</a>";
                XmlNodeList xmlSubMenus = xmlMenu.ChildNodes;
                if (xmlSubMenus.Count > 0)
                {
                    sHtml += "<ul>";
                    for (int j = 0; j < xmlSubMenus.Count; j++)
                    {
                        XmlNode xmlSubMenu = xmlSubMenus[j];
                        sHtml += "<li><a class=\"child_a\" parrent=\"" + xmlMenu.Attributes["alias"].Value + "\" href=\"#" + xmlSubMenu.Attributes["alias"].Value + "\">" + xmlSubMenu.Attributes["name"].Value + "</a></li>";
                    }
                    sHtml += "</ul>";
                }
                sHtml += "</li>";
            }
            return sHtml;

        }
    }
}