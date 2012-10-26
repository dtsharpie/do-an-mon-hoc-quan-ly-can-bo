using System;
using System.Data;
using System.Configuration;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace HutStaff.Common
{

        public class LibCrypto
        {
            public static string StringToMD5(string src)
            {
                return FormsAuthentication.HashPasswordForStoringInConfigFile(src, "MD5").ToLower();
            }

            public static string StringToBase64(string src)
            {
                // Chuyển chuỗi thành mảng kiểu byte.
                byte[] b = Encoding.Unicode.GetBytes(src);
                // Trả về chuỗi được mã hóa theo Base64.
                return Convert.ToBase64String(b);

            }
            public static string Base64ToString(string src)
            {
                // Giải mã vào mảng kiểu byte.
                byte[] b = Convert.FromBase64String(src);
                // Trả về chuỗi Unicode.
                return Encoding.Unicode.GetString(b);
            }
    }
}
