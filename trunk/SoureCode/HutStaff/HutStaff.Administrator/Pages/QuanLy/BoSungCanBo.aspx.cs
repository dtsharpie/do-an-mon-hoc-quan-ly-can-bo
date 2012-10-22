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

            List<String> date = new List<string> { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14",
                "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27"};

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
            // bind DropDownList6 -- Thang
            // bind DropDownList7 -- Hon nhan
            // bind DropDownList8 -- Noi sinh
            // bind DropDownList9 -- Que quan
            // bind DropDownList10 -- Ho khau thuong tru
            // bind DropDownList11 -- Noi cap CMTND
            // bind DropDownList12 -- Dan toc
            // bind DropDownList14 -- Ton giao
            // bind DropDownList18 - Thanh phan xuat than
            // bind DropDownList19 -- Gia dinh chinh sach
            // bind DropDownList20 -- Dien uu tien
            // bind DropDownList13 -- Ngay hop dong
            // bind DropDownList15 -- Thang hop dong
            // bind DropDownList16 -- Ngay thi tuyen vien chuc
            // bind DropDownList17 -- Thang thi tuyen vien chuc
            // bind ddlCoQuanTiepNhan
            // bind DropDownList21 -- Cong viec duoc giao
            // bind DropDownList22 -- Ngay ve co quan
            // bind DropDownList23 -- Thang ve co quan
            // bind DropDownList24 -- Khoi can bo
            // bind DropDownList25 -- Cong viec hien nay
            // bind DropDownList26 -- Ngay dong BHXH
            // bind DropDownList27 -- Thang dong BHXH
            // bind DropDownList28 -- Ngay vao Dang
            // bind DropDownList29 -- Thang vao Dang
            // bind DropDownList30 -- Ngay chinh thuc
            // bind DropDownList31 -- Thang chinh thuc
            // bind DropDownList32 -- Ngay nhap ngu
            // bind DropDownList33 -- Thang nhap ngu
            // bind DropDownList34 -- Ngay xuat ngu
            // bind DropDownList35 -- Thang xuat ngu
            // bind DropDownList36 -- Trinh do LLCT
            // bind DropDownList37 -- Trinh do DLNN
            // bind DropDownList38 -- Trinh do hoc van pho thong
            // bind DropDownList39 -- Trinh do tin hoc
            // bind DropDownList40 -- Suc khoe
            // bind DropDownList41 -- Nhom mau
            // bind DropDownList42 -- Ngay ket thuc hop dong
            // bind DropDownList43 -- Thang ket thuc hop dong
            // bind DropDownList44 -- Ngay bat dau tinh tham nien
            // bind DropDownList45 -- Thang bat dau tinh tham nien
        }
    }
}