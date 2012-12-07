using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Web;
using System.IO;

namespace HutStaff.BO.Report
{
    public class Exporter
    {
        public static void ExportToExcel(DataTable dataTable, string fileName)
        {
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.Buffer = true;
            HttpContext.Current.Response.ContentType = "application/ms-excel";
            //HttpContext.Current.Response.Write(@"<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.0 Transitional//EN"">");
            HttpContext.Current.Response.AddHeader("Content-Disposition", String.Format("attachment;filename={0}", fileName));

            string path = HttpContext.Current.Server.MapPath(@"Template\XetNangLuong.xml");
            string strHtmlContent = File.ReadAllText(path);
            strHtmlContent += "\n<tr height=17 valign=bottom style='height:12.75pt'>";

            int columnsCount = dataTable.Columns.Count;
            for (int j = 0; j < columnsCount; j++)
            {
                strHtmlContent += String.Format("\n<td width=24 style='width:24pt'><b>{0}</b></td>", dataTable.Columns[j].ColumnName);
            }
            strHtmlContent += "</tr>";

            foreach (DataRow row in dataTable.Rows)
            {
                strHtmlContent += "\n<tr height=17 valign=bottom style='height:12.75pt'>";
                for (int i = 0; i < dataTable.Columns.Count; i++)
                {
                    strHtmlContent += String.Format("\n<td>{0}</td>", row[i].ToString());
                }
                strHtmlContent += "</tr>";
            }
            strHtmlContent += "\n</table>\n</body>\n</html>";

            HttpContext.Current.Response.Write(strHtmlContent);
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }

        public static void ExportToDoc(string strHtmlContent, string fileName)
        {
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.Buffer = true;
            HttpContext.Current.Response.ContentType = "application/ms-word";
            //HttpContext.Current.Response.Write(@"<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.0 Transitional//EN"">");
            HttpContext.Current.Response.AddHeader("Content-Disposition", String.Format("attachment;filename={0}", fileName));
            HttpContext.Current.Response.Write(strHtmlContent);
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }

        public static void ExportToExcelFile(string strHtmlContent, string fileName)
        {
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.Buffer = true;
            HttpContext.Current.Response.ContentType = "application/ms-excel";
            //HttpContext.Current.Response.Write(@"<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.0 Transitional//EN"">");
            HttpContext.Current.Response.AddHeader("Content-Disposition", String.Format("attachment;filename={0}", fileName));
            HttpContext.Current.Response.Write(strHtmlContent);
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }
    }
}
