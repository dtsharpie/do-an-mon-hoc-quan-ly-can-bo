using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;
using System.IO;
using System.Web;

namespace HutStaff.Common
{
    public class Control
    {
        public string Alias { get; set; }

        public int Permission { get; set; }

        public string ControlPath { get; set; }

        public Control(string alias, int permission, string path)
        {
            Alias = alias;
            Permission = permission;
            ControlPath = path;
        }

        public static Control GetByAlias(string alias)
        {
            XmlNode xmlResult = GetData().SelectSingleNode(string.Format("//control[@alias='{0}']", alias));
            if (xmlResult != null)
            {
                string sPath = xmlResult.Attributes["path"].InnerText;
                int iPermission = Convert.ToInt32(xmlResult.Attributes["permission"].InnerText);
                return new Control(alias, iPermission, sPath);
            }

            return null;
        }

        public static bool Contain(string alias)
        {
            return GetData().SelectSingleNode(string.Format("//control[@alias='{0}']", alias)) != null;
        }

        static XmlDocument GetData()
        {
            string sPath = HttpContext.Current.Server.MapPath("/App_Data/Settings.xml");
            XmlDocument xmlDocument = new XmlDocument();
            if (File.Exists(sPath)) xmlDocument.Load(sPath);

            return xmlDocument;
        }
    }
}
