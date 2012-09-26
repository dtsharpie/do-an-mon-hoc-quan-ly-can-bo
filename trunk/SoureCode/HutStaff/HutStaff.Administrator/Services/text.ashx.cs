using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections.Specialized;
using System.Web.Services;
using System.IO;
using HutStaff.Common;
using System.Web.UI.HtmlControls;
using System.Web.UI;
using System.Reflection;
using System.Web.SessionState;

namespace HutStaff.Administrator.Services
{
    /// <summary>
    /// Summary description for $codebehindclassname$
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    public class text : IHttpHandler, IRequiresSessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            string sAlias = GetString("alias");
            string sResponse = string.Empty;

            if (HutStaff.Common.Control.Contain(sAlias))
            {
                HutStaff.Common.Control control = HutStaff.Common.Control.GetByAlias(sAlias);
                sResponse = RenderUserControl(control.ControlPath, context.Request.Form);
            }

            if (Menu.Contain(sAlias))
            {
                Menu menu = Menu.GetByAlias(sAlias);
                sResponse = RenderUserControl(menu.ControlPath, context.Request.Form);
            }
            context.Response.Write(sResponse);
        }

        private NameValueCollection MergeParam(HttpContext context)
        {
            NameValueCollection result = new NameValueCollection();

            for (int i = 0; i < context.Request.Form.AllKeys.Length; i++)
            {
                result.Add(context.Request.Form.Keys[i], context.Request.Form[i]);
            }

            for (int i = 0; i < context.Request.QueryString.AllKeys.Length; i++)
            {
                result.Add(context.Request.QueryString.Keys[i], context.Request.QueryString[i]);
            }
            return result;
        }

        private string RenderUserControl(string path, NameValueCollection param)
        {
            //Check exist of the control
            if (!File.Exists(HttpContext.Current.Server.MapPath(path))) return string.Empty;
            string fileName = GetFileName(path);
            //Create a page that is loaded the control
            Page pageHolder = new Page();

            //Create and load form to the page
            HtmlForm form = new HtmlForm();
            form.ID = "form1";
            pageHolder.Controls.Add(form);

            //Load the control to the page
            ControlBase viewControl = (ControlBase)pageHolder.LoadControl(path);

            //Assign parameters to control
            Type viewControlType = viewControl.GetType();
            PropertyInfo property = viewControlType.GetProperty("Params");
            property.SetValue(viewControl, param, null);
            viewControl.ID = fileName;

            //Add the control to the form
            form.Controls.Add(viewControl);

            //Render control to html code
            StringWriter writer = new StringWriter();
            HttpContext.Current.Server.Execute(pageHolder, writer, false);
            string htmlCode = writer.ToString().Trim();
            htmlCode = htmlCode.Substring(htmlCode.IndexOf("</div>", StringComparison.CurrentCultureIgnoreCase) + 6);
            htmlCode = htmlCode.Substring(0, htmlCode.Length - 7);
            htmlCode = htmlCode.Replace(fileName + "_", GetString("ControlID"));
            htmlCode = htmlCode.Replace(fileName + "$", GetString("ControlID"));

            //check script
            if (!string.IsNullOrEmpty(viewControl.ClientScript))
                htmlCode += "<script>" + viewControl.ClientScript + "</script>";

            return htmlCode;
        }

        private string GetString(string key)
        {
            NameValueCollection form = HttpContext.Current.Request.Form;
            if (form[key] != null)
                return form[key];
            else
                return string.Empty;
        }

        private string GetFileName(string fileName)
        {
            fileName = fileName.Replace('/', '\\');
            int slasIndex = fileName.LastIndexOf('\\');
            if (slasIndex == -1)
                return fileName;
            else
                return fileName.Substring(slasIndex + 1);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}