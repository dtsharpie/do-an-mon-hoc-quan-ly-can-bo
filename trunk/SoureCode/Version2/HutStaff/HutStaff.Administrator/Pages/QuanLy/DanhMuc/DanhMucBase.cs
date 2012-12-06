using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    /// <summary>
    /// Lớp cha cho tất cả các trang xem danh mục.
    /// </summary>
    public abstract class DanhMucBase : Page
    {
        
        #region //--------- Protected Fields ------------//
        
        /// <summary>
        /// GridView chứa dữ liệu, nằm trong DanhMucMaster page.
        /// </summary>
        protected GridView dataGridView;
        
        #endregion

        #region //--------- Public Constructors ---------//
        
        /// <summary>
        /// Khởi tạo đối tượng DanhMucBase.
        /// </summary>
        public DanhMucBase()
        {
            if (!Page.IsPostBack)
            {
                this.Load += new EventHandler(OnLoaded);
            }
        }

        #endregion
        
        #region //--------- CLR Properties --------------//
        
        /// <summary>
        /// Lấy trang MasterPage của trang xem danh mục hiện tại.
        /// </summary>
        /// <value>Đối tượng kiểu DanhMucMaster.</value>
        public new DanhMucMaster Master
        {
            get
            {
                return base.Master as DanhMucMaster;
            }
        }
        
        #endregion
        
        #region //--------- Event Handlers --------------//
        
        /// <summary>
        /// Đăng kí các sự kiện cần thiết.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="args"></param>
        private void OnLoaded(object sender, EventArgs args)
        {
            dataGridView = Master.DataGridView;

            Master.InsertButton.Click += new EventHandler(OnInsertButtonClick);
            Master.EditButton.Click += new EventHandler(OnEditButtonClick);
            dataGridView.SelectedIndexChanged += new EventHandler(OnDataGridViewSelectedIndexChanged);
            dataGridView.RowDeleting += new GridViewDeleteEventHandler(OnDataGridViewRowDeleting);
        }

        #endregion
        
        #region //--------- Abstract Methods ------------//
        
        /// <summary>
        /// Khi được cài đặt, xử lý tác vụ thêm thông tin vào csdl.
        /// </summary>
        protected abstract void OnInsertButtonClick(object sender, EventArgs args);
        
        /// <summary>
        /// Khi được cài đặt, xử lý tác vụ chỉnh sửa 1 bản ghi có sẵn.
        /// </summary>
        protected abstract void OnEditButtonClick(object sender, EventArgs args);
        
        /// <summary>
        /// Khi được cài đặt, xử lý theo tác khi chọn 1 dòng của GridView.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="args"></param>
        protected abstract void OnDataGridViewSelectedIndexChanged(object sender, EventArgs args);
        
        /// <summary>
        /// Khi cài đặt, xử lý tác vụ 1 dòng của GridView sắp sửa được xóa, có thể Cancel tác vụ này.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected abstract void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs e);

        #endregion
        
        #region //--------- Protected Methods -----------//
        
        /// <summary>
        /// Chèn 1 cột mới (mặc định là BoundField) vào GridView tại vị trí xác định.
        /// </summary>
        /// <param name="index">Vị trí chèn cột mới.</param>
        /// <param name="dataField">DataField dùng để bind vào csdl.</param>
        /// <param name="headerText">HeaderText cho cột.</param>
        /// <param name="insertVisible">Có cho cột này được phép chỉnh sửa hay không.</param>
        protected void InsertColumn(int index, string dataField, string headerText, bool insertVisible)
        {
            Master.DataGridView.Columns.Insert(
                index,
                new BoundField
                {
                    HeaderText = headerText,
                    DataField = dataField,
                    InsertVisible = insertVisible
                });
        }
        
        /// <summary>
        /// Đổ dữ liệu vào GridView.
        /// </summary>
        /// <param name="source">Dữ liệu.</param>
        protected void FillData(object source)
        {
            Master.DataGridView.DataSource = source;
            Master.DataGridView.DataBind();
        }

        #endregion

    }
}