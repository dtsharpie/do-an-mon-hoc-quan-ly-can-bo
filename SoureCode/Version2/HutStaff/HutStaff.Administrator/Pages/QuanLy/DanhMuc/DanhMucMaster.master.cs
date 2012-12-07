using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    /// <summary>
    /// MasterPage cho trang xem thông tin các bảng danh mục.
    /// Cung cấp sẵn nút thêm và GridView.
    /// </summary>
    public partial class DanhMucMaster : System.Web.UI.MasterPage
    {

        #region //--------- Event Handlers --------------//
        
        /// <summary>
        /// Handles the Load event of the Page control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="System.EventArgs" /> instance containing the event data.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        #endregion
        
        #region //--------- CLR Properties --------------//
        
        /// <summary>
        /// Lấy button làm nhiệm vụ thêm mới 1 bản ghi vào csdl.
        /// </summary>
        public Button InsertButton
        {
            get
            {
                return insertButton;
            }
        }

        /// <summary>
        /// Lấy nút làm nhiệm vụ chỉnh sửa 1 bản ghi trong csdl.
        /// </summary>
        public Button SaveButton
        {
        	get
        	{
                return saveButton;
        	}
        }
        
        /// <summary>
        /// Lấy GridView hiện thị thông tin bảng danh mục.
        /// </summary>
        public GridView DataGridView
        {
            get
            {
                return dataGridView;
            }
        }

        #endregion

        protected void dataGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            int sum = e.Row.Cells.Count;
            for (int i = 0; i < e.Row.Cells.Count; i++)
            {
                e.Row.Cells[i].Style.Add("background-color"," #EFEFEF");
                e.Row.Cells[i].Style.Add("border-color", " #FFFFFF");
                e.Row.Cells[i].Style.Add("font-size", " 13px");
                e.Row.Cells[i].Style.Add("padding", " 3px");

                if ((i == (sum - 2))||(i==(sum-1)))
                {
                    e.Row.Cells[i].Style.Add("text-align", "center");
                }
            }
        }
        
    }
}