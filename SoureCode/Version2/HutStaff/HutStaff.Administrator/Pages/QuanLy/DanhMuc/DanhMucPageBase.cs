using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.QuanLy.DanhMuc;

namespace HutStaff.Administrator.Pages.QuanLy.DanhMuc
{
    /// <summary>
    /// Lớp cha cho tất cả các trang xem danh mục.
    /// </summary>
    public abstract class DanhMucPageBase : Page
    {
        
        #region //--------- Protected Fields ------------//
        
        /// <summary>
        /// GridView chứa dữ liệu, nằm trong DanhMucMaster page.
        /// </summary>
        protected GridView dataGridView;
        
        /// <summary>
        /// Trường cho property DanhMucTable.
        /// </summary>
        protected DanhMucTableBase danhMucTable = null;
        
        #endregion

        #region //--------- Public Constructors ---------//
        
        /// <summary>
        /// Khởi tạo đối tượng DanhMucPageBase.
        /// </summary>
        public DanhMucPageBase()
        {
            if (!Page.IsPostBack)
            {
                this.Load += new EventHandler(OnLoaded);
                EditState = EditState.None;
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


        /// <summary>
        /// Trạng nhập hiện tại của form.
        /// </summary>
        protected EditState EditState
        {
        	get
        	{
                return (EditState)ViewState["EditState"];
        	}
            set
            {
                ViewState["EditState"] = value;
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
            
            Master.InsertButton.Click += new EventHandler(OnInsertButtonClick_);
            Master.SaveButton.Click += new EventHandler(OnSaveButtonClick_);
            dataGridView.SelectedIndexChanged += new EventHandler(OnDataGridViewSelectedIndexChanged_);
            dataGridView.RowDeleting += new GridViewDeleteEventHandler(OnDataGridViewRowDeleting_);
        }

        #endregion
        
        #region //--------- Abstract Properties ---------//
        
        /// <summary>
        /// Khi được cài đặt, trả về đối tượng Business object tương ứng của 
        /// mỗi form.
        /// </summary>
        protected abstract DanhMucTableBase DanhMucTable { get; }
        
        #endregion
        
        #region //--------- Abstract Methods ------------//
        
        /// <summary>
        /// Khi được cài đặt, xử lý tác vụ thêm thông tin vào csdl.
        /// </summary>
        protected abstract void OnInsertButtonClick(object sender, EventArgs args);
        
        /// <summary>
        /// Khi được cài đặt, xử lý tác vụ chỉnh sửa 1 bản ghi có sẵn.
        /// </summary>
        protected abstract void OnSaveButtonClick(object sender, EventArgs args);
        
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
        protected abstract void OnDataGridViewRowDeleting(object sender, GridViewDeleteEventArgs args);
        
        #endregion
        
        #region //--------- Protected Methods -----------//
        
        /// <summary>
        /// Chèn 1 cột mới (mặc định là BoundField) vào GridView tại vị trí xác định.
        /// </summary>
        /// <param name="index">Vị trí chèn cột mới.</param>
        /// <param name="dataField">DataField dùng để bind vào csdl.</param>
        /// <param name="headerText">HeaderText cho cột.</param>
        /// <param name="insertVisible">Có cho cột này được phép chỉnh sửa hay không.</param>
        protected void InsertColumn(int index, string dataField, string headerText)
        {
            Master.DataGridView.Columns.Insert(
                index,
                new BoundField
                {
                    HeaderText = headerText,
                    DataField = dataField
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
        
        /// <summary>
        /// Dữ liệu được lấy từ DanhMucTable.
        /// </summary>
        protected void FillData()
        {
            FillData(DanhMucTable.GetAll());
        }
        
        /// <summary>
        /// Lấy nội dung của Cell tại 1 vị trí xác định trong DataGridView.
        /// </summary>
        /// <param name="rowIndex">Vị trí hàng trong GridView.</param>
        /// <param name="columnIndex">Vị trí cell trong hàng.</param>
        protected string GetCellContent(int rowIndex, int columnIndex)
        {
            GridViewRow selectedRow = dataGridView.Rows[rowIndex];
            
            // string có thể đã được mã hóa
            string encodedText = selectedRow.Cells[columnIndex].Text;
            
            // giải mã và trả về
            return HttpUtility.HtmlDecode(encodedText);
        }

        #endregion
        
        #region //--------- Private Methods -------------//
        
        /// <summary>
        /// Tiền xử lý.
        /// </summary>
        protected void OnInsertButtonClick_(object sender, EventArgs args)
        {
            EditState = EditState.Insert;
            Master.SaveButton.Enabled = false;
            OnInsertButtonClick(sender, args);
        }
        
        /// <summary>
        /// Tiền xử lý.
        /// </summary>
        protected void OnSaveButtonClick_(object sender, EventArgs args)
        {
            OnSaveButtonClick(sender, args);
            FillData();
        }
        
        /// <summary>
        /// Tiền xử lý.
        /// </summary>
        protected void OnDataGridViewSelectedIndexChanged_(object sender, EventArgs args)
        {
            EditState = EditState.Update;
            Master.SaveButton.Enabled = true;
            OnDataGridViewSelectedIndexChanged(sender, args);
        }
        
        /// <summary>
        /// Tiền xử lý.
        /// </summary>
        protected void OnDataGridViewRowDeleting_(object sender, GridViewDeleteEventArgs args)
        {
            OnDataGridViewRowDeleting(sender, args);
            FillData();
            EditState = EditState.None;
            Master.SaveButton.Enabled = false;
        }

        #endregion

    }
}