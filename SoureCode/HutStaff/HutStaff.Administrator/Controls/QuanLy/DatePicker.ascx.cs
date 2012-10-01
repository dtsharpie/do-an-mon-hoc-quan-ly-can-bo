using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Text.RegularExpressions;

namespace HutStaff.Administrator.Controls.QuanLy
{
    public partial class DatePicker : System.Web.UI.UserControl
    {
        #region //--------- CLR Properties --------------//
        public Unit Width
        {
            get { return mainTextBox.Width; }
            set { mainTextBox.Width = value; }
        }

        public Unit Height
        {
            get { return mainTextBox.Width; }
            set { mainTextBox.Width = value; }
        }

        public string CssClass
        {
            get { return mainTextBox.CssClass; }
            set { mainTextBox.CssClass = value; }
        }

        public DateTime Date
        {
            get
            {
                DateTime date = DateTime.MinValue;
                try
                {
                    string pattern = @"(?<day>\d+)/(?<month>\d+)/?<year>\d+)";
                    Regex regex = new Regex(pattern);
                    Match m = regex.Match(mainTextBox.Text);
                    date = new DateTime(Convert.ToInt32(m.Groups["year"].Value), Convert.ToInt32(m.Groups["month"].Value), Convert.ToInt32(m.Groups["day"].Value));
                }
                catch (Exception)
                {
                    throw new FormatException("Chuỗi ngày tháng nhập vào không đúng. Nhập vào theo dạng dd/mm/yyyy");
                }

                return date;
            }
        }
        #endregion

        #region //--------- Event Handlers --------------//
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        #endregion
    }
}