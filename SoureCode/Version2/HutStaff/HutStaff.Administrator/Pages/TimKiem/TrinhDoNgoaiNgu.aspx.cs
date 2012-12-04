using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using HutStaff.BO.PagesBO.TimKiem;
using HutStaff.BO.Thongtinchung;

namespace HutStaff.Administrator.Pages.TimKiem
{
    public partial class TrinhDoNgoaiNgu : System.Web.UI.Page
    {
        public int iShcc;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (IsPostBack)
            //    return;
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

        public void Bind()
        {
            //add name
            DataTable thongtinchitiet = SearchDetailBO.ThongTinChiTiet(iShcc);
            string htbHoVaTenDem = thongtinchitiet.Rows[0]["hodem"].ToString();
            string htbTen  = thongtinchitiet.Rows[0]["ten"].ToString();
            string dpkNgaySinh  = thongtinchitiet.Rows[0]["ntns"] != null ? Convert.ToDateTime(thongtinchitiet.Rows[0]["ntns"]).ToString("dd/MM/yyyy") : "";
           
            int ma_dvql = int.Parse(thongtinchitiet.Rows[0]["ma_dvql"].ToString());
            DataTable donviquanli = SearchDetailBO.getAllDonViQuanLi();
            donviquanli.PrimaryKey = new DataColumn[1] { donviquanli.Columns[0]};
            DataRow dataRow = donviquanli.Rows.Find(ma_dvql.ToString());
            if (dataRow != null)
            {
                object tableRow = dataRow.ItemArray[1];
                string nameDonVi = tableRow.ToString();
                nameLabel.Text = string.Format("{0} {1}({2}) - {3}", htbHoVaTenDem, htbTen, dpkNgaySinh, nameDonVi);
            }

            nameLabel.Text = string.Format("{0} {1}({2})", htbHoVaTenDem, htbTen, dpkNgaySinh);
            /*
            DataTable ngoaingu = SearchDetailBO.getAllNgoaiNgu();
            ngoainguDropdownList.DataTextField = "tnn";
            ngoainguDropdownList.DataValueField = "ma_tnn";
            ngoainguDropdownList.DataSource = ngoaingu;
            ngoainguDropdownList.DataBind();

            DataTable trinhdoNgoaingu = SearchDetailBO.getAllTrinhDoNgoaiNgu();
            trinhdoDropdownList.DataTextField = "tdnn";
            trinhdoDropdownList.DataValueField = "ma_tdnn";
            trinhdoDropdownList.DataSource = trinhdoNgoaingu;
            trinhdoDropdownList.DataBind();
            */

            DataTable tblData = BO.Thongtinchung.Thongtinchung.GetTrinhdoNgoaiNguById(iShcc);
            if (tblData.Rows.Count > 0)
            {
                GridView1.DataSource = tblData;
                GridView1.DataBind();
                for (int i = 0; i < tblData.Rows.Count; i++)
                {
                    DataRow r = tblData.Rows[i];
                    string tnn = r["tnn"].ToString();
                    string tdnn = r["tdnn"].ToString();
                    //
                    Control ctr1 = GridView1.Rows[i].FindControl("ddlNgoaiNgu");
                    if (ctr1 != null)
                    {
                        DropDownList ddlNgoaiNgu = ctr1 as DropDownList;
                        if (ddlNgoaiNgu.Items.Count > 0)
                        {
                            if (!"".Equals(tnn))
                            {
                                ddlNgoaiNgu.SelectedIndex = ddlNgoaiNgu.Items.IndexOf(ddlNgoaiNgu.Items.FindByText(tnn));                                
                            }
                            else
                            {
                                ddlNgoaiNgu.SelectedIndex = ddlNgoaiNgu.Items.Count-1;
                            }
                            ddlNgoaiNgu.Enabled = false;
                        }
                    }
                    //
                    Control ctr2 = GridView1.Rows[i].FindControl("ddlTrinhDo");
                    if (ctr2 != null)
                    {
                        DropDownList ddlTrinhDo = ctr2 as DropDownList;
                        if (ddlTrinhDo.Items.Count > 0)
                        {
                            if (!"".Equals(tdnn))
                            {
                                ddlTrinhDo.SelectedIndex = ddlTrinhDo.Items.IndexOf(ddlTrinhDo.Items.FindByText(tdnn));
                            }
                            else
                            {
                                ddlTrinhDo.SelectedIndex = ddlTrinhDo.Items.Count - 1;
                            }
                            ddlTrinhDo.Enabled = false;
                        }
                    }
                    //lbResult.Text = tnn + ", " + tdnn + ", ";
                }
            }
            else
            {
                divNodata.InnerText = "Không có dữ liệu";
            }
        }

        public void saveButtonClick(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            if (!"".Equals(id))
            {
                iShcc = Convert.ToInt32(id);
            }
            Thongtinchung.InsertNgoaiNgu (iShcc,Int32.Parse(ngoainguDropdownList.SelectedValue),Int32.Parse(trinhdoDropdownList.SelectedValue), thongtinchungTextBox.Text);
            Bind();
        }


        protected void resetButtonClick(object sender, EventArgs e)
        {
            thongtinchungTextBox.Text = "";
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int index = e.NewEditIndex;
            GridViewRow row = GridView1.Rows[index];
            Control ctrl1 = row.FindControl("ddlNgoaiNgu");
            if (ctrl1 != null)
            {
                DropDownList ddlNgoaiNgu = ctrl1 as DropDownList;
                ddlNgoaiNgu.Enabled = true;
            }
            Control ctrl2 = row.FindControl("ddlTrinhDo");
            if (ctrl2 != null)
            {
                DropDownList ddlTrinhDo = ctrl2 as DropDownList;
                ddlTrinhDo.Enabled = true;
            }
            //lbResult.Text = "Sửaaaaaaa" + tnn + ", " + tdnn + ", " + index + ", " + trinhdoDropdownList.SelectedIndex;
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int ma_tnn = -1;
            int ma_tdnn = -1;
            int index = e.RowIndex;
            GridViewRow row = GridView1.Rows[index];            
            Control ctrl1 = row.FindControl("ddlNgoaiNgu");
            if (ctrl1 != null)
            {
                DropDownList ddlNgoaiNgu = ctrl1 as DropDownList;
                //Kiểm tra nếu ddl đang là 'Chưa cập nhật'
                if (ddlNgoaiNgu.SelectedIndex != (ddlNgoaiNgu.Items.Count-1))
                {
                    int.TryParse(ddlNgoaiNgu.SelectedItem.Value, out ma_tnn);
                }
            }
            Control ctrl2 = row.FindControl("ddlTrinhDo");
            if (ctrl2 != null)
            {
                DropDownList ddlTrinhDo = ctrl2 as DropDownList;
                //Kiểm tra nếu ddl đang là 'Chưa cập nhật'
                if (ddlTrinhDo.SelectedIndex != (ddlTrinhDo.Items.Count - 1))
                {
                    int.TryParse(ddlTrinhDo.SelectedItem.Value, out ma_tdnn);
                }
            }
            int id = -1;
            int.TryParse(row.Cells[0].ToString(),out id);
            if (id>-1 && ma_tnn>-1 && ma_tdnn>-1)
            {
                SearchDetailBO.updateTrinhDoNgoaiNgu(id, ma_tnn, ma_tdnn, row.Cells[3].ToString());
            }
            GridView1.EditIndex = -1;

            lbResult.Text = "id=" + id; 
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            Bind();
        }   
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //Checking whether the Row is Data Row
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //Finding the Dropdown control.
                Control ctrl1 = e.Row.FindControl("ddlNgoaiNgu");
                if (ctrl1 != null)
                {
                    DropDownList ddlNgoaiNgu = ctrl1 as DropDownList;
                    DataTable ngoaingu = SearchDetailBO.getAllNgoaiNgu();
                    ddlNgoaiNgu.DataTextField = "tnn";
                    ddlNgoaiNgu.DataValueField = "ma_tnn";
                    ddlNgoaiNgu.DataSource = ngoaingu;
                    ddlNgoaiNgu.DataBind();
                    ddlNgoaiNgu.Items.Add("Chưa cập nhật");
                }

                //Finding the Dropdown control.
                Control ctrl2 = e.Row.FindControl("ddlTrinhDo");
                if (ctrl2 != null)
                {
                    DropDownList ddlNgoaiNgu = ctrl2 as DropDownList;
                    DataTable ngoaingu = SearchDetailBO.getAllTrinhDoNgoaiNgu();
                    ddlNgoaiNgu.DataTextField = "tdnn";
                    ddlNgoaiNgu.DataValueField = "ma_tdnn";
                    ddlNgoaiNgu.DataSource = ngoaingu;
                    ddlNgoaiNgu.DataBind();
                    ddlNgoaiNgu.Items.Add("Chưa cập nhật");
                }
            }
        }

        
    }
}