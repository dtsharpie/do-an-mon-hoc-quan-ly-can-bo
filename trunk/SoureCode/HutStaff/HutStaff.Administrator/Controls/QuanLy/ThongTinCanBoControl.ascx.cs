using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HutStaff.Administrator.Controls.QuanLy
{
    public partial class ThongTinCanBoControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Giới tính
            chzGioiTinh.AddItem(new ListItem());
            chzGioiTinh.AddItem(new ListItem("Nam", "1"));
            chzGioiTinh.AddItem(new ListItem("Nữ", "0"));

            // Tình trạng sức khỏe
            chzTinhTrangSucKhoe.AddItem(new ListItem());
            chzTinhTrangSucKhoe.AddItem(new ListItem("Tốt", "Tốt"));
            chzTinhTrangSucKhoe.AddItem(new ListItem("Trung bình", "Trung bình"));
            chzTinhTrangSucKhoe.AddItem(new ListItem("Yếu", "Yếu"));

            // Nhóm máu
            chzNhomMau.AddItem(new ListItem());
            chzNhomMau.AddItem(new ListItem("A", "A"));
            chzNhomMau.AddItem(new ListItem("AB", "AB"));
            chzNhomMau.AddItem(new ListItem("B", "B"));
            chzNhomMau.AddItem(new ListItem("O", "O"));

            // Tháng gián đoạn
            chzThangGianDoan.AddItems(
                new ListItem[] 
                {
                    new ListItem(),
                    new ListItem("1", "1"),
                    new ListItem("2", "2"),
                    new ListItem("3", "3"),
                    new ListItem("4", "4"),
                    new ListItem("5", "5"),
                    new ListItem("6", "6"),
                    new ListItem("7", "7"),
                    new ListItem("8", "8"),
                    new ListItem("9", "9"),
                    new ListItem("10", "11"),
                    new ListItem("11", "11"),
                    new ListItem("12", "12"),
                }
            );

            
        }
    }
}