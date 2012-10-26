using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.Specialized;
using System.Web.UI;
using System.Web;

namespace HutStaff.Common
{
    public class ControlBase : UserControl
    {
        #region Property

        public NameValueCollection Params { get; set; }

        public string ClientScript
        {
            get;
            set;
        }

        public int PageIndex
        {
            get { return GetInt(GetString("uId") + "pi", 1); }
        }

        public int PageSize
        {
            get { return GetInt(GetString("uId") + "ps", 50); }
        }

        public string Menu
        {
            get { return GetString("alias"); }
        }
        #endregion Property

        #region Methods

        #region Get String Value

        public string GetString(string key)
        {
            try
            {
                return GetValue(key, string.Empty).ToString();
            }
            catch { return string.Empty; }
        }

        #endregion Get String Value

        #region Get Bool Value

        public bool GetBool(string key)
        {
            return GetBool(key, false);
        }

        public bool GetBool(string key, bool defaultValue)
        {
            try
            {
                return bool.Parse(GetValue(key, defaultValue).ToString());
            }
            catch { return defaultValue; }
        }

        #endregion Get Bool Value

        #region Get Int Value

        public int GetInt(string key)
        {
            return GetInt(key, 0);
        }

        public int GetInt(string key, int defaultValue)
        {
            try
            {
                return int.Parse(GetValue(key, defaultValue).ToString());
            }
            catch { return defaultValue; }
        }

        #endregion Get Int Value

        #region Get Long Value

        public long GetLong(string key)
        {
            return GetLong(key, 0);
        }

        public long GetLong(string key, long defaultValue)
        {

            try
            {
                return long.Parse(GetValue(key, defaultValue).ToString());
            }
            catch { return defaultValue; }
        }

        #endregion Get Long Value

        #region Get Date Value

        public DateTime GetDate(string key)
        {
            return GetDate(key, DateTime.Now);
        }

        public DateTime GetDate(string key, DateTime defaultValue)
        {
            try
            {
                string result = GetValue(key, string.Empty).ToString();
                if (!string.IsNullOrEmpty(result))
                {
                    string[] pars = result.Split('/');
                    return new DateTime(int.Parse(pars[2]), int.Parse(pars[1]), int.Parse(pars[0]));
                }
                else return defaultValue;
            }
            catch { return defaultValue; }
        }

        #endregion Get Date Value

        private object GetValue(string key, object defValue)
        {
            try
            {
                return Params[key];
            }
            catch { return defValue; }
        }

        #endregion
    }
}
