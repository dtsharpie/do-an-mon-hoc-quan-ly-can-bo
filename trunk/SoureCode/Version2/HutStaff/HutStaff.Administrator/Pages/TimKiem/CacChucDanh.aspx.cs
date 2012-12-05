using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Data;
using HutStaff.BO.PagesBO.TimKiem;
using HutStaff.BO.Thongtinchung;

namespace HutStaff.Administrator.Pages.TimKiem
{
    public partial class CacChucDanh : System.Web.UI.Page
    {
        protected int iShcc;
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                string id = Request.QueryString["id"];
                if (!"".Equals(id))
                {
                    iShcc = Convert.ToInt32(id);
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

            //add name
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


            DataTable tblData = BO.Thongtinchung.Thongtinchung.GetChucdanh(iShcc);
            if (tblData.Rows.Count > 0)
            {
                GridView1.DataSource = tblData;
                GridView1.DataBind();
            }
            else
            {
                divNodata.InnerText = "Không có dữ liệu";
            }
            
        }

        protected void saveButtonClick(object sender, EventArgs e)
        {

        }

        protected void resetButtonClick(object sender, EventArgs e)
        {

        }
    }
}