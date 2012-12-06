using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace HutStaff.BO.QuanLy.DanhMuc
{
    /// <summary>
    /// Lớp cha cho tất cả các BO của bảng danh mục.
    /// </summary>
    public abstract class DanhMucTableBase
    {
        
        #region //--------- Protected Fields ------------//
        
        /// <summary>
        /// Tên sp kiểm tra tồn tại bản ghi với khóa xác định.
        /// </summary>
        protected string checkExistedSpName;
        
        /// <summary>
        /// Tên sp xóa bản ghi.
        /// </summary>
        protected string deleteSpName;
        
        /// <summary>
        /// Tên sp tìm kiếm bởi khóa chính.
        /// </summary>
        protected string findByIdSpName;
        
        /// <summary>
        /// Tên sp tìm kiếm bởi 1 trường.
        /// </summary>
        protected string findByNameSpName;
        
        /// <summary>
        /// Tên sp thêm bản ghi.
        /// </summary>
        protected string insertSpName;
        
        /// <summary>
        /// Tên sp update bản ghi.
        /// </summary>
        protected string updateSpName;
        
        /// <summary>
        /// Tên sp lấy tất cả các bản ghi.
        /// </summary>
        protected string viewAllSpName;
        
        /// <summary>
        /// Tự động gán tên các stored procedure dựa vào tên bảng 'TableName'
        /// </summary>
        protected bool isAutoName = true;
        
        #endregion
        
        #region //--------- Public Constructors ---------//
        
        /// <summary>
        /// Khởi tạo đối tượng và thiết lập tên các sp nếu cần.
        /// </summary>
        public DanhMucTableBase()
        {
            if (isAutoName)
            {
                checkExistedSpName = "sp_check_existed_" + TableName;
                deleteSpName = "sp_delete_" + TableName;
                findByIdSpName = "sp_find_by_id_" + TableName;
                findByNameSpName = "sp_find_by_name_" + TableName;
                insertSpName = "sp_insert_" + TableName;
                updateSpName = "sp_update_" + TableName;
                viewAllSpName = "sp_view_all_" + TableName;
            }
        }

        #endregion
        
        #region //--------- Abstract Properties ---------//
        
        /// <summary>
        /// Tên của bảng trong csdl mà class này đại diện.
        /// Bắt buộc phải giống trong csdl. 
        ///     
        ///     Ví dụ: dm_dv, dm_dt
        /// </summary>
        protected abstract string TableName { get; }
        
        /// <summary>
        /// Mảng chứa tên tham số của sp check_existed.
        /// </summary>
        protected abstract string[] CheckExistedParamNames { get; }
        
        /// <summary>
        /// Mảng chứa tên tham số của sp delete.
        /// </summary>
        protected abstract string[] DeleteParamNames { get; }
        
        /// <summary>
        /// Mảng chứa tên tham số của sp find_by_id.
        /// </summary>
        protected abstract string[] FindByIdParamNames { get; }
        
        /// <summary>
        /// Mảng chứa tên tham số của sp find_by_name.
        /// </summary>
        protected abstract string[] FindByNameParamNames { get; }
        
        /// <summary>
        /// Mảng chứa tên tham số của sp insert.
        /// </summary>
        protected abstract string[] InsertParamNames { get; }
        
        /// <summary>
        /// Mảng chứa tên tham số của sp update.
        /// </summary>
        protected abstract string[] UpdateParamNames { get; }
        
        #endregion
        
        #region //--------- Virtual Methods -------------//
        
        /// <summary>
        /// Lấy tất cả dữ liệu trong bảng.
        /// </summary>
        /// <returns></returns>
        public virtual DataTable GetAll()
        {
            return HutStaff.DAL.Quanly.Repository.GetAll(viewAllSpName);
        }
        
        /// <summary>
        /// Tìm kiếm bằng khóa chính.
        /// </summary>
        /// <param name="id">Giá trị khóa chính dùng để tìm kiếm.</param>
        /// <returns></returns>
        public virtual DataTable FindById(string id)
        {
            string[] paramValues = new string[] { id };
            DataTable result = HutStaff.DAL.Quanly.Repository.Execute(findByIdSpName, FindByIdParamNames, paramValues);
        
            return result;
        }
        
        /// <summary>
        /// Tìm kiếm bằng 1 trường nào đó ở trong bảng.
        /// </summary>
        /// <param name="name">Giá trị dùng để tìm kiếm.</param>
        public virtual DataTable FindByName(string name)
        {
            string[] paramValues = new string[] { name };
            DataTable result = HutStaff.DAL.Quanly.Repository.Execute(findByNameSpName, FindByNameParamNames, paramValues);
        
            return result;
        }
        
        /// <summary>
        /// Kiểm tra xem có tồn tại bản ghi có id='id' không.
        /// </summary>
        /// <param name="id">id cần kiểm tra</param>
        /// <returns>true nếu trong csdl đã có bản ghi trùng id.</returns>
        public virtual bool CheckExisted(string id)
        {
            string[] paramValues = new string[] { id };
            DataTable result = HutStaff.DAL.Quanly.Repository.Execute(findByIdSpName, FindByIdParamNames, paramValues);
            
            if (result.Rows.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        
        /// <summary>
        /// Cập nhật bản ghi trong csdl. Thứ tự các giá trị tham số phải đúng với
        /// UpdateParamNames.
        /// </summary>
        /// <param name="paramValues">Các giá trị được update, theo đúng thứ tự với UpdateParamNames.</param>
        public virtual void Update(string[] paramValues)
        {
            HutStaff.DAL.Quanly.Repository.Execute(updateSpName, UpdateParamNames, paramValues);
        }

        /// <summary>
        /// Thêm 1 bản ghi mới. Thứ tự tham số phải đúng với InsertParamNames.
        /// </summary>
        public virtual void Insert(string[] paramValues)
        {
            HutStaff.DAL.Quanly.Repository.Execute(insertSpName, InsertParamNames, paramValues);
        }

        /// <summary>
        /// Xóa 1 bản ghi với id được truyền vào.
        /// </summary>
        public virtual void Delete(string id)
        {
            HutStaff.DAL.Quanly.Repository.Execute(deleteSpName, DeleteParamNames, new string[] { id });
        }

        #endregion

    }
}