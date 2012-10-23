using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HutStaff.BO.PagesBO.QuanLy;

namespace HutStaff.Administrator.Pages.QuanLy
{
    public partial class BoSungCanBo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }
        protected void BindData()
        {

            List<String> date = new List<String> { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14",
                "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"};
            List<String> month = new List<String> { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12" };
            Dictionary<string, int> homeList = new Dictionary<string, int>(); // danh sach ten Quehuong
            homeList = BoSungCanBoBO.getQueHuong();
            Dictionary<string, int> provinceList = new Dictionary<string, int>(); // danh sach ten Tinh
            provinceList = BoSungCanBoBO.getTinh();


            // bind ddl DienCanBo
            ddlDiencanbo.DataSource = BoSungCanBoBO.getDienCanBo();
            ddlDiencanbo.DataBind();
            // bind ddl DropDownList1 - Hiennay
            DropDownList1.Items.Add(new ListItem("Hiện đang công tác", "0"));
            DropDownList1.Items.Add(new ListItem("Đã nghỉ hưu", "1"));
            DropDownList1.Items.Add(new ListItem("Đã mất", "2"));
            DropDownList1.Items.Add(new ListItem( "Đã chuyển cơ quan khác", "3"));
            DropDownList1.Items.Add(new ListItem("Thôi việc", "4"));
            DropDownList1.Items.Add(new ListItem("Hiện không hưởng lương", "5"));
            //bind DropDownList2 - Trang thai
            DropDownList2.Items.Add(new ListItem("", "0"));
            DropDownList2.Items.Add(new ListItem("Nghỉ thai sản có lương", "1"));
            DropDownList2.Items.Add(new ListItem("Nghỉ thai sản không lương", "2"));
            DropDownList2.Items.Add(new ListItem("Nghỉ không lương", "3"));
            DropDownList2.Items.Add(new ListItem("Nghỉ ốm dài hạn", "4"));
            DropDownList2.Items.Add(new ListItem("Đang đi nước ngoài", "5"));
            //bind DropDownList3 - Don vi
            DropDownList3.DataSource = BoSungCanBoBO.getDonVi();
            // bind DropDownList4 -- Gioi tinh
            DropDownList4.Items.Add(new ListItem("Nam", "0"));
            DropDownList4.Items.Add(new ListItem("Nữ", "1"));
            // bind DropDownList5 -- Ngay
            DropDownList5.DataSource = date;
            DropDownList5.DataBind();
            // bind DropDownList6 -- Thang
            DropDownList6.DataSource = month;
            DropDownList6.DataBind();
            // bind DropDownList7 -- Hon nhan
            // bind DropDownList8 -- Noi sinh
            DropDownList8.DataSource = homeList;
            DropDownList8.DataBind();
            // bind DropDownList9 -- Que quan
            DropDownList9.DataSource = homeList;
            DropDownList9.DataBind();
            // bind DropDownList10 -- Ho khau thuong tru
            DropDownList10.DataSource = homeList;
            DropDownList10.DataBind();
            // bind DropDownList11 -- Noi cap CMTND
            DropDownList11.DataSource = provinceList;
            DropDownList11.DataBind();
            // bind DropDownList12 -- Dan toc
            // bind DropDownList14 -- Ton giao
            // bind DropDownList18 - Thanh phan xuat than
            // bind DropDownList19 -- Gia dinh chinh sach
            // bind DropDownList20 -- Dien uu tien
            // bind DropDownList13 -- Ngay hop dong
            DropDownList13.DataSource = date;
            DropDownList13.DataBind();
            // bind DropDownList15 -- Thang hop dong
            DropDownList15.DataSource = month;
            DropDownList15.DataBind();
            // bind DropDownList16 -- Ngay thi tuyen vien chuc
            DropDownList16.DataSource = date;
            DropDownList16.DataBind();
            // bind DropDownList17 -- Thang thi tuyen vien chuc
            DropDownList17.DataSource = month;
            DropDownList17.DataBind();
            // bind ddlCoQuanTiepNhan
            // bind DropDownList21 -- Cong viec duoc giao
            // bind DropDownList22 -- Ngay ve co quan
            DropDownList22.DataSource = date;
            DropDownList22.DataBind();
            // bind DropDownList23 -- Thang ve co quan
            DropDownList22.DataSource = month;
            DropDownList22.DataBind();
            // bind DropDownList24 -- Khoi can bo
            // bind DropDownList25 -- Cong viec hien nay
            // bind DropDownList26 -- Ngay dong BHXH
            DropDownList26.DataSource = date;
            DropDownList26.DataBind();
            // bind DropDownList27 -- Thang dong BHXH
            DropDownList27.DataSource = month;
            DropDownList27.DataBind();
            // bind DropDownList28 -- Ngay vao Dang
            DropDownList28.DataSource = date;
            DropDownList28.DataBind();
            // bind DropDownList29 -- Thang vao Dang
            DropDownList29.DataSource = month;
            DropDownList29.DataBind();
            // bind DropDownList30 -- Ngay chinh thuc
            DropDownList30.DataSource = date;
            DropDownList30.DataBind();
            // bind DropDownList31 -- Thang chinh thuc
            DropDownList31.DataSource = month;
            DropDownList31.DataBind();
            // bind DropDownList32 -- Ngay nhap ngu
            DropDownList32.DataSource = date;
            DropDownList32.DataBind();
            // bind DropDownList33 -- Thang nhap ngu
            DropDownList33.DataSource = month;
            DropDownList33.DataBind();
            // bind DropDownList34 -- Ngay xuat ngu
            DropDownList34.DataSource = date;
            DropDownList34.DataBind();
            // bind DropDownList35 -- Thang xuat ngu
            DropDownList35.DataSource = month;
            DropDownList35.DataBind();
            // bind DropDownList36 -- Trinh do LLCT
            // bind DropDownList37 -- Trinh do DLNN
            // bind DropDownList38 -- Trinh do hoc van pho thong
            // bind DropDownList39 -- Trinh do tin hoc
            // bind DropDownList40 -- Suc khoe
            // bind DropDownList41 -- Nhom mau
            // bind DropDownList42 -- Ngay ket thuc hop dong
            DropDownList42.DataSource = date;
            DropDownList42.DataBind();
            // bind DropDownList43 -- Thang ket thuc hop dong
            DropDownList43.DataSource = month;
            DropDownList43.DataBind();
            // bind DropDownList44 -- Ngay bat dau tinh tham nien
            DropDownList44.DataSource = date;
            DropDownList44.DataBind();
            // bind DropDownList45 -- Thang bat dau tinh tham nien
            DropDownList45.DataSource = month;
            DropDownList45.DataBind();
        }

        
    }
}