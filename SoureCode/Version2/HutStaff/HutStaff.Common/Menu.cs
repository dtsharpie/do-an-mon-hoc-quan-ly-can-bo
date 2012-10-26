using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;
using System.IO;
using System.Web;

namespace HutStaff.Common
{
    public class Menu
    {
        public string Name { get; set; }

        public string Alias { get; set; }

        public int Permission { get; set; }

        public string ControlPath { get; set; }

        public Menu(string name, string alias, int permission, string path)
        {
            Name = name;
            Alias = alias;
            Permission = permission;
            ControlPath = path;
        }

        public static Menu GetByAlias(string alias)
        {
            XmlNode xmlResult = GetData().SelectSingleNode(string.Format("//menu[@alias='{0}']", alias));
            if (xmlResult != null)
            {
                string sName = xmlResult.Attributes["name"].InnerText;
                string sPath = xmlResult.Attributes["path"].InnerText;
                int iPermission = Convert.ToInt32(xmlResult.Attributes["permission"].InnerText);
                return new Menu(sName, alias, iPermission, sPath);
            }

            return null;
        }


        public static bool Contain(string alias)
        {
            return GetData().SelectSingleNode(string.Format("//menu[@alias='{0}']", alias)) != null;
        }

        public static XmlDocument GetData()
        {
            string sPath = HttpContext.Current.Server.MapPath("/App_Data/Settings.xml");
            XmlDocument xmlDocument = new XmlDocument();
            if (File.Exists(sPath)) xmlDocument.Load(sPath);

            return xmlDocument;
        }
    }
}
