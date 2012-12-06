using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace HutStaff.Administrator.Controls.Common
{
    /// <summary>
    /// TextBox control với dòng chữ gợi ý bên trong.
    /// </summary>
    /// 
    /// <example>
    /// HintTextBox htb = new HintTextBox();
    /// htb.HintText = "Hello, I'm hint text.";
    /// </example>
    /// 
    /// <remarks>Cần có javascript trong file ~/Script/common.js</remarks>
    public partial class HintTextBox : System.Web.UI.UserControl
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
        /// Lấy hoặc gán text cho HintTextBox này.
        /// </summary>
        public string Text
        {
            get { return mainTextBox.Text; }
            set { mainTextBox.Text = value; }
        }
        #endregion

        #region //--------- Overridden Methods ----------//
        protected override void OnLoad(EventArgs e)
        {
            // Gắn sự kiện cho control bên phía client.
            mainTextBox.Attributes.Add("onfocus", "hintTextBox_onFocus(" + mainTextBox.ClientID + ",'" + HintText + "')");
            mainTextBox.Attributes.Add("onblur", "hintTextBox_onBlur(" + mainTextBox.ClientID + ",'" + HintText + "')");

            // Kiểm tra đặt chữ gợi ý lần đầu (nếu có) khi control vừa được khởi tạo.
            if (String.IsNullOrEmpty(mainTextBox.Text) && !String.IsNullOrEmpty(HintText))
            {
                mainTextBox.Text = HintText;
                mainTextBox.ForeColor = Color.Silver;
            }

            // Phát event Load.
            base.OnLoad(e);
        }
        #endregion

        #region //--------- Public Methods --------------//
        /// <summary>
        /// Xóa chữ đã có sẵn trong TextBox và hiển thị dòng HintText.
        /// Nếu không có HintText được set thì không làm gì.
        /// </summary>
        public void ShowHintText()
        {
            if (String.IsNullOrEmpty(HintText))
            {
                return;
            }

            mainTextBox.Text = HintText;
            mainTextBox.ForeColor = Color.Silver;
        }
        #endregion
    }
}