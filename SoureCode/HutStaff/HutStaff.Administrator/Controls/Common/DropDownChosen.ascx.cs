using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HutStaff.Administrator.Controls.Common
{
    public partial class DropDownChosen : System.Web.UI.UserControl
    {
        #region //--------- CLR Properties --------------//
        public string DataSourceID
        {
            set
            {
                mainDropDownList.DataSourceID = value;
            }
        }

        public string DataTextField
        {
            set { mainDropDownList.DataTextField = value; }
        }

        public string DataValueField
        {
            set { mainDropDownList.DataValueField = value; }
        }

        public string PlaceHolder { get; set; }

        public Unit Width
        {
            get { return mainDropDownList.Width; }
            set { mainDropDownList.Width = value; }
        }

        public Unit Height
        {
            get { return mainDropDownList.Height; }
            set { mainDropDownList.Height = value; }
        }

        public string CssClass
        {
            get { return mainDropDownList.CssClass; }
            set { mainDropDownList.CssClass = value; }
        }
        #endregion

        #region //--------- Public Methods --------------//
        public void AddItem(ListItem item)
        {
            mainDropDownList.Items.Add(item);
        }

        public void AddItems(ListItem[] items)
        {
            mainDropDownList.Items.AddRange(items);
        }
        #endregion

        #region //--------- Event Handlers --------------//
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        #endregion
    }
}