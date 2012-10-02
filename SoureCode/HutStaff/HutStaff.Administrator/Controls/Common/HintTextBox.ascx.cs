using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace HutStaff.Administrator.Controls.Common
{
    public partial class HintTextBox : System.Web.UI.UserControl
    {
        public Unit Width
        {
            get { return mainTextBox.Width; }
            set { mainTextBox.Width = value; }
        }

        public Unit Height
        {
            get { return mainTextBox.Height; }
            set { mainTextBox.Height = value; }
        }

        public string HintText { get; set; }

        public string CssClass
        {
            get { return mainTextBox.CssClass; }
            set { mainTextBox.CssClass = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(mainTextBox.Text) && !String.IsNullOrEmpty(HintText))
            {
                mainTextBox.Text = HintText;
                mainTextBox.ForeColor = Color.Silver;
            }
        }
    }
}