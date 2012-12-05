using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using HutStaff.BO.PagesBO.TimKiem;
using HutStaff.BO.Thongtinchung;
using System.Globalization;

namespace HutStaff.Administrator.Pages.TimKiem
{
    public partial class KyLuat : System.Web.UI.Page
    {
        protected int iShcc;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
                return;
            try
            {
                string id = Request.QueryString["id"];
                if (!"".Equals(id))
                {
                    iShcc = Convert.ToInt32(id);
                    ViewState["ishcc"] = iShcc;
                }
            }
            catch (Exception e1)
            {
            }
            if (iShcc > 0)
            {
                Bind();
            }

            string sDirectory = HttpContext.Current.Server.MapPath("/Anhcanbo");
            sDirectory = sDirectory.EndsWith("\\") ? sDirectory : sDirectory + "\\";
            string sImage = "";
            if (File.Exists(sDirectory + iShcc.ToString() + ".jpg"))
            {
                sImage = "/Anhcanbo/" + iShcc.ToString() + ".jpg";
            }
            else if (File.Exists(sDirectory + iShcc.ToString() + ".png"))
            {
                sImage = "/Anhcanbo/" + iShcc.ToString() + ".png";
            }
            else
            {
                sImage = "/Images/" + "no_avatar.jpg";
            }

            FaceImage.ImageUrl = sImage;
        }

        protected void Bind()
        {
            // add name
            iShcc = Int32.Parse(ViewState["ishcc"].ToString());
            DataTable thongtinchitiet = SearchDetailBO.ThongTinChiTiet(iShcc);
            string htbHoVaTenDem = thongtinchitiet.Rows[0]["hodem"].ToString();
            string htbTen = thongtinchitiet.Rows[0]["ten"].ToString();
            string dpkNgaySinh = thongtinchitiet.Rows[0]["ntns"] != null ? Convert.ToDateTime(thongtinchitiet.Rows[0]["ntns"]).ToString("dd/MM/yyyy") : "";

            int ma_dvql = int.Parse(thongtinchitiet.Rows[0]["ma_dvql"].ToString());
            DataTable donviquanli = SearchDetailBO.getAllDonViQuanLi();
            donviquanli.PrimaryKey = new DataColumn[1] { donviquanli.Columns[0] };
            DataRow dataRow = donviquanli.Rows.Find(ma_dvql.ToString());
            if (dataRow != null)
            {
                object tableRow = dataRow.ItemArray[1];
                string nameDonVi = tableRow.ToString();
                nameLabel.Text = string.Format("{0} {1}({2}) - {3}", htbHoVaTenDem, htbTen, dpkNgaySinh, nameDonVi);
            }

            nameLabel.Text = string.Format("{0} {1}({2})", htbHoVaTenDem, htbTen, dpkNgaySinh);
            DataTable tblData = BO.Thongtinchung.Thongtinchung.GetQuatrinhKyLuatById(iShcc);
            if (tblData.Rows.Count > 0)
            {
                GridView1.DataSource = tblData;
                GridView1.DataBind();
            }
            else
            {
                divNodata.InnerText = "Không có dữ liệu";
            }


            DataTable dataTable = BO.Thongtinchung.Thongtinchung.GetAllKyLuat();
            DropDownlistHinhThucKyLuat.DataSource = dataTable;
            DropDownlistHinhThucKyLuat.DataTextField = "kl";
            DropDownlistHinhThucKyLuat.DataValueField = "ma_kl";
            DropDownlistHinhThucKyLuat.DataBind();
            
            txtLyDo.Text = "";
            txtNamKyLuat.Text = "";
            txtNamXoaKyLuat.Text = "";
            txtThongTinKhac.Text = "";
            saveButton.Text = "Ghi nhận";



        }

        protected void saveButtonClick(object sender, EventArgs e)
        {
            if(saveButton.Text == "Ghi nhận")
            {
                string namKL = txtNamKyLuat.Text;
                string ngaythangnamKL = string.Format("01/01/{0}", namKL);
                DateTimeFormatInfo dtfi = new DateTimeFormatInfo();
                dtfi.ShortDatePattern = "dd/MM/yyyy";
                dtfi.DateSeparator = "/";
                DateTime ngaythangKL = Convert.ToDateTime(ngaythangnamKL, dtfi);

                string ngaythangnamXoaKL = string.Format("01/01/{0}", txtNamXoaKyLuat.Text);
                DateTime ngaythangXoaKL = Convert.ToDateTime(ngaythangnamXoaKL, dtfi);


                BO.Thongtinchung.Thongtinchung.InsertKyLuat(Int32.Parse(ViewState["ishcc"].ToString()),Int32.Parse(DropDownlistHinhThucKyLuat.SelectedValue.ToString()),ngaythangKL,ngaythangXoaKL,txtLyDo.Text,txtThongTinKhac.Text);
                Bind();
            }
            if (saveButton.Text == "Cập nhật")
            {
                string namKL = txtNamKyLuat.Text;
                string ngaythangnamKL = string.Format("01/01/{0}", namKL);
                DateTimeFormatInfo dtfi = new DateTimeFormatInfo();
                dtfi.ShortDatePattern = "dd/MM/yyyy";
                dtfi.DateSeparator = "/";
                DateTime ngaythangKL = Convert.ToDateTime(ngaythangnamKL, dtfi);

                string ngaythangnamXoaKL = string.Format("01/01/{0}", txtNamXoaKyLuat.Text);
                DateTime ngaythangXoaKL = Convert.ToDateTime(ngaythangnamXoaKL, dtfi);

                BO.Thongtinchung.Thongtinchung.UpdateKyLuat(Int32.Parse(ViewState["id"].ToString()), Int32.Parse(DropDownlistHinhThucKyLuat.SelectedValue.ToString()), ngaythangKL, ngaythangXoaKL, txtLyDo.Text, txtThongTinKhac.Text);
                Bind();
            }

        }

        protected void resetButtonClick(object sender, EventArgs e)
        {
            DataTable dataTable = BO.Thongtinchung.Thongtinchung.GetAllKyLuat();
            DropDownlistHinhThucKyLuat.DataSource = dataTable;
            DropDownlistHinhThucKyLuat.DataTextField = "kl";
            DropDownlistHinhThucKyLuat.DataValueField = "ma_kl";
            DropDownlistHinhThucKyLuat.DataBind();

            txtLyDo.Text = "";
            txtNamKyLuat.Text = "";
            txtNamXoaKyLuat.Text = "";
            txtThongTinKhac.Text = "";
            saveButton.Text = "Ghi nhận";
        }

        protected void GridViewChanged(object sender, EventArgs e)
        {
            saveButton.Text = "Cập nhật";
            int id = Int32.Parse(GridView1.SelectedRow.Cells[0].Text);
            ViewState["id"] = id.ToString();

            DataTable GTKTDataTable = BO.Thongtinchung.Thongtinchung.FindByIDKyLuat(id);

            DataTable khenThuongDataTable = BO.Thongtinchung.Thongtinchung.GetAllKyLuat();
            DropDownlistHinhThucKyLuat.DataSource = khenThuongDataTable;
            DropDownlistHinhThucKyLuat.DataTextField = "kl";
            DropDownlistHinhThucKyLuat.DataValueField = "ma_kl";
            DropDownlistHinhThucKyLuat.DataBind();
            DropDownlistHinhThucKyLuat.SelectedValue = GTKTDataTable.Rows[0]["ma_htkl"].ToString();

            txtLyDo.Text = GTKTDataTable.Rows[0]["ldkl"] != null ? GTKTDataTable.Rows[0]["ldkl"].ToString() : "";
            txtThongTinKhac.Text = GTKTDataTable.Rows[0]["ttk_qtkl"] != null ? GTKTDataTable.Rows[0]["ttk_qtkl"].ToString() : "";

            string ngaythangkl = GTKTDataTable.Rows[0]["nkl"] != null ? Convert.ToDateTime(GTKTDataTable.Rows[0]["nkl"]).ToString("dd/MM/yyyy") : "";


            string nam = ngaythangkl.Substring(6, 4);
            txtNamKyLuat.Text = nam;

            string ngaythangxoakl = GTKTDataTable.Rows[0]["nxkl"] != null ? Convert.ToDateTime(GTKTDataTable.Rows[0]["nxkl"]).ToString("dd/MM/yyyy") : "";


            string namxoa = ngaythangxoakl.Substring(6, 4);
            txtNamXoaKyLuat.Text = namxoa;


        }

        protected void GridViewDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Int32.Parse(GridView1.Rows[e.RowIndex].Cells[0].Text);

            Thongtinchung.DeleteKyLuat(id);
            Bind();
        }
    }
}