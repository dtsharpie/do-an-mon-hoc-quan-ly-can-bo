using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Web.Services;
using System.Reflection;
using System.Collections.Specialized;


namespace HutStaff.Administrator.Services
{
    /// <summary>
    /// Summary description for js
    /// </summary>
    /// <summary>
    /// Summary description for $codebehindclassname$
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    public class js : IHttpHandler, IRequiresSessionState
    {
        private string sClientScript = string.Empty;

        public void ProcessRequest(HttpContext context)
        {
            sClientScript = (HttpContext.Current.Session[HutStaff.Common.Constants.Session.ViewSessionName] == null && HttpContext.Current.Session[HutStaff.Common.Constants.Session.AdminSessionName] == null) ? "alert('Bạn cần xác thực lại thông tin');window.location='/Login.aspx';" : CallMethod();
            context.Response.ContentType = "application/x-javascript";
            context.Response.Write(sClientScript);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        public string CallMethod()
        {
            string functionName = GetString("_fn");
            if (!string.IsNullOrEmpty(functionName))
            {
                List<object> args = new List<object>();
                string[] keys = HttpContext.Current.Request.Form.AllKeys;
                NameValueCollection form = HttpContext.Current.Request.Form;
                for (int i = 0, length = keys.Length; i < length; i++)
                    if (keys[i] != "_fn")
                        args.Add(form[keys[i]]);
                return CallMethod(functionName, args.ToArray());
            }
            else
                return string.Empty;
        }

        public string CallMethod(string functionName, object[] args)
        {
            string typeName = functionName.Substring(0, functionName.LastIndexOf('.')) + ",HutStaff.BO";
            functionName = functionName.Substring(functionName.LastIndexOf('.') + 1);
            Type type = Type.GetType(typeName);

            MethodInfo mi = type.GetMethod(functionName);
            ParameterInfo[] pis = mi.GetParameters();
            for (int i = 0, length = pis.Length; i < length; i++)
                switch (pis[i].ParameterType.Name.ToLower())
                {
                    case "int32": args[i] = Convert.ToInt32(args[i]); break;
                    case "boolean": args[i] = Convert.ToBoolean(args[i]); break;
                    case "datetime": args[i] = Convert.ToDateTime(args[i]); break;
                    case "int64": args[i] = Convert.ToInt64(args[i]); break;
                    case "double": args[i] = Convert.ToDouble(args[i]); break;
                }

            return (string)mi.Invoke(Missing.Value, args);
        }

        public string GetString(string key)
        {
            NameValueCollection form = HttpContext.Current.Request.Form;
            if (form[key] != null)
                return form[key];
            else
                return string.Empty;
        }
    }
}