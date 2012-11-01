using System;
using System.Linq;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace HutStaff.Administrator.Controls.Common
{
    public partial class DatePicker : System.Web.UI.UserControl
    {
        #region //--------- CLR Properties --------------//
        /// <summary>
        /// Chiều rộng của control.
        /// </summary>
        public Unit Width
        {
            get { return mainTextBox.Width; }
            set { mainTextBox.Width = value; }
        }

        /// <summary>
        /// Chiều cao của control.
        /// </summary>
        public Unit Height
        {
            get { return mainTextBox.Height; }
            set { mainTextBox.Height = value; }
        }

        /// <summary>
        /// Dòng chữ gợi ý đi kèm với TextBox.
        /// </summary>
        public string HintText { get; set; }

        /// <summary>
        /// CSS class cho TextBox bên trong control.
        /// </summary>
        public string CssClass
        {
            get { return mainTextBox.CssClass; }
            set { mainTextBox.CssClass = value; }
        }

        /// <summary>
        /// Ngày đang được chọn. 
        /// Ném ra ngoại lệ nếu dạng ngày không phải là dd/mm/yyyy.
        /// </summary>
        public DateTime Date
        {
            get
            {
                DateTime date = DateTime.MinValue;
                try
                {
                    string pattern = @"(?<day>\d+)/(?<month>\d+)/(?<year>\d+)";
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
            set
            {
                DateTime date = value;
                mainTextBox.Text = String.Format("{0}/{1}/{2}", date.Day, date.Month, date.Year);
                //mainTextBox.Text = value.ToString("ddMMyyyy");
            }
        }
        #endregion

        #region //--------- Public Methods --------------//
        /// <summary>
        /// Xóa chữ thể hiện ngày tháng cho DatePicker này.
        /// </summary>
        public void Clear()
        {
            mainTextBox.Text = "";
        }
        #endregion
    }
}