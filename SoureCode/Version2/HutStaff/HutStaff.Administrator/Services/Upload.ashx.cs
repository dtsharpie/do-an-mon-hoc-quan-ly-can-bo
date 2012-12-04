using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

namespace HutStaff.Administrator.Services
{
    /// <summary>
    /// Summary description for UploadImage
    /// </summary>
    public class Upload : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            if (!String.IsNullOrEmpty(HttpContext.Current.User.Identity.Name))
            {
                context.Response.Expires = -1;
                string savepath = "";
                string sResponse = "";
                string filename = "";
                try
                {
                    HttpPostedFile postedFile = context.Request.Files[0];
                    filename = RemoveSign4VietnameseString(postedFile.FileName);

                    savepath = context.Server.MapPath("/Uploaded/Temp/");
                    string sCKEditorFuncNum = context.Request["CKEditorFuncNum"];
                    string url = "http://" + context.Request.Url.Authority + "/Uploaded/Temp/" + filename;
                    sResponse = "<script type=\"text/javascript\">window.parent.CKEDITOR.tools.callFunction(" + sCKEditorFuncNum + ", '" + url + "', '');</script>";

                    if (!String.IsNullOrEmpty(sResponse))
                    {
                        if (!Directory.Exists(savepath))
                            Directory.CreateDirectory(savepath);
                        postedFile.SaveAs(savepath + filename);
                    }

                    context.Response.ContentType = "text/html;charset=utf-8";
                    context.Response.Write(sResponse);
                }
                catch
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write(String.Empty);
                }
            }
            else
            {
                context.Response.ContentType = "text/plain";
                context.Response.Write(String.Empty);
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        public static string RemoveSign4VietnameseString(string str)
        {
            //Tiến hành thay thế , lọc bỏ dấu cho chuỗi
            for (int i = 1; i < VietnameseSigns.Length; i++)
            {
                for (int j = 0; j < VietnameseSigns[i].Length; j++)
                    str = str.Replace(VietnameseSigns[i][j], VietnameseSigns[0][i - 1]);
            }

            foreach (string SpecicalCharacter in SpecicalCharacters)
            {
                str = str.Replace(SpecicalCharacter, " ");
            }
            return str.Trim().Replace(" ", "-");
        }

        private static readonly string[] VietnameseSigns = new string[] { "aAeEoOuUiIdDyY",
                                                              "áàạảãâấầậẩẫăắằặẳẵ",
                                                              "ÁÀẠẢÃÂẤẦẬẨẪĂẮẰẶẲẴ",
                                                              "éèẹẻẽêếềệểễ",
                                                              "ÉÈẸẺẼÊẾỀỆỂỄ",
                                                              "óòọỏõôốồộổỗơớờợởỡ",
                                                              "ÓÒỌỎÕÔỐỒỘỔỖƠỚỜỢỞỠ",
                                                              "úùụủũưứừựửữ",
                                                              "ÚÙỤỦŨƯỨỪỰỬỮ",
                                                              "íìịỉĩ",
                                                              "ÍÌỊỈĨ",
                                                              "đ",
                                                              "Đ",
                                                              "ýỳỵỷỹ",
                                                              "ÝỲỴỶỸ"  
                                                   };

        private static readonly string[] SpecicalCharacters = new string[] {" - ",
                                                                            ",",
                                                                            ":",
                                                                            "'",
                                                                            "\"",
                                                                            "&",
                                                                            "?",
                                                                            "“",
                                                                            "”",
                                                                            "    ",
                                                                            "   ",
                                                                            "  ",
                                                                            "%",
                                                                             "|"
                                                                             };
    }
}