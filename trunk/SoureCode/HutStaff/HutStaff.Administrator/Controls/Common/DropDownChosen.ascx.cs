using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HutStaff.Administrator.Controls.Common
{
    /// <summary>
    /// Chuyển control DropDownList của .NET sang plugin chosen của jQuery.
    /// </summary>
    public partial class DropDownChosen : System.Web.UI.UserControl
    {
        #region //--------- CLR Properties --------------//
        /// <summary>
        /// ID của datasource cho dropdownlist.
        /// </summary>
        public string DataSourceID
        {
            set
            {
                mainDropDownList.DataSourceID = value;
            }
        }

        /// <summary>
        /// Trường để thể hiện trên dropdownlist.
        /// </summary>
        public string DataTextField
        {
            set { mainDropDownList.DataTextField = value; }
        }

        /// <summary>
        /// Trường thể hiện dữ liệu (giá trị) cho dropdownlist.
        /// </summary>
        public string DataValueField
        {
            set { mainDropDownList.DataValueField = value; }
        }

        /// <summary>
        /// DataSource cho dropdownlist.
        /// </summary>
        public object DataSource
        {
            set
            {
                mainDropDownList.DataSource = value;
                mainDropDownList.DataBind();
            }
        }

        /// <summary>
        /// Dòng chữ sẽ hiển thị mặc định cho chosen nếu lựa chọn đầu tiên của dropdownlist
        /// có giá trị rỗng (DataTextField == "").
        /// </summary>
        public string PlaceHolder { get; set; }

        /// <summary>
        /// Chiều rộng của control.
        /// </summary>
        public Unit Width
        {
            get { return mainDropDownList.Width; }
            set { mainDropDownList.Width = value; }
        }

        /// <summary>
        /// Chiều cao của control.
        /// </summary>
        public Unit Height
        {
            get { return mainDropDownList.Height; }
            set { mainDropDownList.Height = value; }
        }

        /// <summary>
        /// CSS class cho dropdownlist.
        /// </summary>
        public string CssClass
        {
            get { return mainDropDownList.CssClass; }
            set { mainDropDownList.CssClass = value; }
        }

        /// <summary>
        /// Lấy hoặc gán chỉ số của lựa chọn đang được chọn.
        /// </summary>
        public int SelectedIndex
        {
            get { return mainDropDownList.SelectedIndex; }
            set { mainDropDownList.SelectedIndex = value; }
        }

        /// <summary>
        /// Lấy giá trị của lựa chọn đang được chọn.
        /// </summary>
        public string SelectedValue
        {
            get { return mainDropDownList.SelectedValue; }
        }

        /// <summary>
        /// Lấy item đang được chọn.
        /// </summary>
        public ListItem SelectedItem
        {
            get { return mainDropDownList.SelectedItem; }
        }

        /// <summary>
        /// Các item có trong chosen này.
        /// </summary>
        public ListItemCollection Items
        {
            get { return mainDropDownList.Items; }
        }
        #endregion

        #region //--------- Public Methods --------------//
        /// <summary>
        /// Thêm 1 ListItem cho dropdownlist.
        /// </summary>
        public void AddItem(ListItem item)
        {
            mainDropDownList.Items.Add(item);
        }

        /// <summary>
        /// Thêm nhiều ListItem cho dropdownlist.
        /// </summary>
        public void AddItems(ListItem[] items)
        {
            mainDropDownList.Items.AddRange(items);
        }
        #endregion

        #region //--------- Overridden Methods ----------//
        protected override void OnLoad(EventArgs e)
        {
            mainDropDownList.DataBound += new EventHandler(OnMainDropDownListDataBound);
            base.OnLoad(e);
        }
        #endregion

        #region //--------- Event Handlers --------------//
        /// <summary>
        /// Nếu sau khi bind dữ liệu, option đầu tiên của dropdownlist không là rỗng thì thêm mới.
        /// </summary>
        /// 
        /// <remarks>
        /// Không hiểu sao DataBoundDataControl.DataBind() ko phát ra event DataBound :|
        /// </remarks>
        private void OnMainDropDownListDataBound(object sender, EventArgs args)
        {
            //if (mainDropDownList.Items.Count > 0 && !String.IsNullOrEmpty(mainDropDownList.Items[0].Text))
            //{
            //    mainDropDownList.Items.Insert(0, "");
            //}
        }
        #endregion

        #region //--------- Public Methods --------------//
        /// <summary>
        /// Thêm option rỗng vào đầu tiên của DropDownList nếu không có. Mục đích để tạo place holder.
        /// </summary>
        public void CheckPlaceHolder()
        {
            if (mainDropDownList.Items.Count > 0 && !String.IsNullOrEmpty(mainDropDownList.Items[0].Text))
            {
                mainDropDownList.Items.Insert(0, "");
            }
        }
        #endregion
    }
}