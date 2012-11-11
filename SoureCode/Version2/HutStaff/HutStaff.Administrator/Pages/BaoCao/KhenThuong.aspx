<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true"
    CodeBehind="KhenThuong.aspx.cs" Inherits="HutStaff.Administrator.Pages.BaoCao.KhenThuong" %>

<%@ Register Src="/Controls/Common/SlideBaocao.ascx" TagName="SlideBaocao" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#divHeader .nav a').removeClass("active");
            $('#divHeader .nav a').eq(2).addClass('active');
        });
    </script>
    <style type="text/css">
        .button
        {
            margin-left: 650px;
        }
        .timkiem
        {
            background-color: Green;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
    <uc1:SlideBaocao ID="SlideBaocao1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="content">
        <!-- InstanceBeginEditable name="content" -->
        <br />
        <h1>
            Tìm kiếm thông tin khen thưởng</h1>
        <hr width="800px" />
        <form name="myform" action="" method="post" onsubmit="return false">
        <div id="timkiem" class="timkiem" style="background-color: Aqua; color: Black; border-color: Blue;">
            <div class="hang">
                <h4>
                    Hình thức khen thưởng:</h4>
                <span class="ddl">
                    <asp:DropDownList ID="ddlHinhThucKhenThuong" runat="server" CssClass="ddl" />
                </span>
            </div>
            <div class="hang">
                Năm khen thưởng: Từ năm <span class="textbox">
                    <asp:TextBox ID="tbFrom" runat="server" Width="50px" /></span> đến năm <span class="textbox">
                        <asp:TextBox ID="tbTo" runat="server" Width="50px" /></span>
            </div>
            <div class="hang">
                <h4>
                    Đơn vị cấp 1,2,3:</h4>
                <div class="f_input row-right">
                    <asp:DropDownList ID="ddlUnit123" runat="server" CssClass="ddl">

                        <%--<asp:ListItem Value="1.00200000" Text="Toàn trường"></asp:ListItem>
                        <asp:ListItem Value="2.00203000-2.00209000" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Khoa + Viện"></asp:ListItem>
                        <asp:ListItem Value="3.00203140" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Khoa giáo dục quốc phòng"></asp:ListItem>
                        <asp:ListItem Value="3.00203150" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Khoa giáo dục thể chất"></asp:ListItem>
                        <asp:ListItem Value="3.00203100" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Khoa lí luận chính trị"></asp:ListItem>
                        <asp:ListItem Value="4.00209120" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Mô phỏng-Chuyển quy mô"></asp:ListItem>
                        <asp:ListItem Value="4.00209110" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Phân tích-Kiểm nghiệm"></asp:ListItem>
                        <asp:ListItem Value="4.00209140" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Phân tích-Tinh chế-Chuyển hóa"></asp:ListItem>
                        <asp:ListItem Value="4.00209130" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Phát triển-Quản lí dự án"></asp:ListItem>
                        <asp:ListItem Value="4.00209150" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Phát triển ứng dụng và chuyển giao công nghệ"></asp:ListItem>
                        <asp:ListItem Value="3.00203010" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Cơ khí"></asp:ListItem>
                        <asp:ListItem Value="3.00209060" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Cơ khí Động lực"></asp:ListItem>
                        <asp:ListItem Value="3.00209030" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Công nghệ sinh học và Công nghệ thực phẩm"></asp:ListItem>
                        <asp:ListItem Value="3.00203050" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Công nghệ thông tin và Truyền thông"></asp:ListItem>
                        <asp:ListItem Value="3.00203080" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Dệt may-Da dầy và Thời trang"></asp:ListItem>
                        <asp:ListItem Value="3.00209010" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Khoa học và Công nghệ môi trường"></asp:ListItem>
                        <asp:ListItem Value="3.00209040" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Khoa học và Công nghệ nhiệt lạnh"></asp:ListItem>
                        <asp:ListItem Value="3.00203060" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Khoa học và Kĩ thuật Vật liệu"></asp:ListItem>
                        <asp:ListItem Value="3.00203070" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Kinh tế và Quản lí"></asp:ListItem>
                        <asp:ListItem Value="3.00209090" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Kĩ thuật Hạt nhân và Vật lí Môi trường"></asp:ListItem>
                        <asp:ListItem Value="3.00203020" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Kĩ thuật Hóa học"></asp:ListItem>
                        <asp:ListItem Value="3.00209200" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Kĩ thuật Điều khiển và Tự động hóa"></asp:ListItem>
                        <asp:ListItem Value="3.00209100" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Nghiên cứu và Phát triển ứng dụng các hợp chất thiên nhiên"></asp:ListItem>
                        <asp:ListItem Value="3.00203110" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Ngoại ngữ"></asp:ListItem>
                        <asp:ListItem Value="3.00203120" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Sư phạm Kĩ thuật"></asp:ListItem>
                        <asp:ListItem Value="3.00209070" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Tiên tiến Khoa học Và Công nghệ (AIST)"></asp:ListItem>
                        <asp:ListItem Value="3.00203090" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Toán ứng dụng và Tin học"></asp:ListItem>
                        <asp:ListItem Value="3.00209020" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Vật lí Kĩ thuật"></asp:ListItem>
                        <asp:ListItem Value="3.00203130" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Đào tạo liên tục"></asp:ListItem>
                        <asp:ListItem Value="3.00209050" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Đào tạo Quốc tế về Khoa học Vật liệu (ITIMS)"></asp:ListItem>
                        <asp:ListItem Value="3.00209080" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Đào tạo Sau đại học"></asp:ListItem>
                        <asp:ListItem Value="3.00203030" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Điện"></asp:ListItem>
                        <asp:ListItem Value="3.00203040" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Điện tử-Viễn thông"></asp:ListItem>
                        <asp:ListItem Value="2.00204000" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng"></asp:ListItem>
                        <asp:ListItem Value="2.00204000" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Tổ chức Cán bộ"></asp:ListItem>
                        <asp:ListItem Value="3.00204020" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Đào tạo Đại học"></asp:ListItem>
                        <asp:ListItem Value="3.00204030" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Hành chính tổng hợp"></asp:ListItem>
                        <asp:ListItem Value="3.00204040" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Kế hoạch-Tài vụ"></asp:ListItem>
                        <asp:ListItem Value="3.00204050" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Hợp tác Quốc tế"></asp:ListItem>
                        <asp:ListItem Value="3.00204060" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Khoa học Công nghệ"></asp:ListItem>
                        <asp:ListItem Value="3.00204070" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Công tác Chính trị và Công tác sinh viên"></asp:ListItem>
                        <asp:ListItem Value="3.00204080" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Quản trị"></asp:ListItem>
                        <asp:ListItem Value="3.00204090" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Bảo vệ"></asp:ListItem>
                        <asp:ListItem Value="3.00204100" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Thiết bị"></asp:ListItem>
                        <asp:ListItem Value="3.00204110" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ba văn phòng"></asp:ListItem>
                        <asp:ListItem Value="3.00204120" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Y tế Bách Khoa"></asp:ListItem>
                        <asp:ListItem Value="2.00205000" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ban"></asp:ListItem>
                        <asp:ListItem Value="3.00205010" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Đảm bảo chất lượng"></asp:ListItem>
                        <asp:ListItem Value="3.00205020" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Thư viện Tạ Quang Bửu"></asp:ListItem>
                        <asp:ListItem Value="3.00205030" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ban Quản lý Công trình"></asp:ListItem>
                        <asp:ListItem Value="3.00205050" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ban Xây dựng và Quản lí Dự án"></asp:ListItem>
                        <asp:ListItem Value="3.00205070" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ban Quản trị các tòa nhà cao tầng"></asp:ListItem>
                        <asp:ListItem Value="3.00205080" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Ngoại ngữ"></asp:ListItem>
                        <asp:ListItem Value="3.00205100" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Mạng thông tin"></asp:ListItem>
                        <asp:ListItem Value="2.00206000" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bộ môn"></asp:ListItem>
                        <asp:ListItem Value="2.0020B000" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm"></asp:ListItem>
                        <asp:ListItem Value="3.0020B040" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Nghiên cứu vật liệu Polyme"></asp:ListItem>
                        <asp:ListItem Value="3.0020B070" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Quản lý Kí túc xá"></asp:ListItem>
                        <asp:ListItem Value="3.0020B090" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Nghiên cứu triển khai công nghệ cao"></asp:ListItem>
                        <asp:ListItem Value="3.0020B120" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm tiếng Pháp"></asp:ListItem>
                        <asp:ListItem Value="3.0020B140" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm trao đổi KHKT Việt Đức"></asp:ListItem>
                        <asp:ListItem Value="3.0020B150" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Điện tử-Y sinh học"></asp:ListItem>
                        <asp:ListItem Value="3.0020B160" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Tính toán hiệu năng cao"></asp:ListItem>
                        <asp:ListItem Value="3.0020B170" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm PT và ƯD Công nghệ phần mềm"></asp:ListItem>
                        <asp:ListItem Value="3.0020B180" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Phần mềm và giải pháp an ninh mạng"></asp:ListItem>
                        <asp:ListItem Value="3.0020B190" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm hợp tác Quốc tế về ĐT & Chuyển giao công nghệ"></asp:ListItem>
                        <asp:ListItem Value="3.0020B220" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Quốc tế Nghiên cứu và Phát triển công nghệ định vị sử dụng vệ tinh (NAVIS)"></asp:ListItem>
                        <asp:ListItem Value="3.0020B230" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Nghiên cứu Quốc tế về  thông tin đa phương tiện, Truyền thông và ứng dụng (MICA)"></asp:ListItem>
                        <asp:ListItem Value="3.0020B240" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Thí nghiệm trọng điểm vật liệu Polyme và Compozit"></asp:ListItem>
                        <asp:ListItem Value="3.0020B260" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Đào tạo Tài năng và Chất lượng cao"></asp:ListItem>
                        <asp:ListItem Value="3.0020B270" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Đào tạo Bảo dưỡng công nghiệp"></asp:ListItem>
                        <asp:ListItem Value="3.0020B300" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Thể thao-Văn hóa"></asp:ListItem>
                        <asp:ListItem Value="3.0020B310" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Đào tạo Quốc tế"></asp:ListItem>
                        <asp:ListItem Value="3.0020B320" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Nghiên cứu Quốc tế về Khoa học vật liệu tính toán"></asp:ListItem>
                        <asp:ListItem Value="3.0020B330" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Nghiên cứu Ứng dụng và Sáng tạo công nghệ"></asp:ListItem>
                        <asp:ListItem Value="3.0020B340" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Chương trình Hợp tác đào tạo Quốc tế Genetic Bách Khoa"></asp:ListItem>
                        <asp:ListItem Value="2.0020E000" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Các đơn vị Sản xuất-Dịch vụ"></asp:ListItem>
                        <asp:ListItem Value="3.0020E010" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Công ty TNHH MTV Tư vấn và CGCN Bách Khoa"></asp:ListItem>
                        <asp:ListItem Value="3.0020E030" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nhà Xuất bản Bách Khoa Hà Nội"></asp:ListItem>
                        <asp:ListItem Value="3.0020E040" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Phục vụ Bách Khoa"></asp:ListItem>
                        <asp:ListItem Value="3.0020E050" Text="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bách Khoa Hà Nội-Holdings"></asp:ListItem>--%>

                    </asp:DropDownList>
                </div>
            </div>
            <div class="hang">
                <h4>
                    Đơn vị cấp 4:</h4>
                <div class="row-right">
                    <asp:DropDownList ID="ddlUnit4" runat="server" CssClass="ddl">

                        <%--<asp:ListItem Value="0" Text=""></asp:ListItem>
                        <asp:ListItem Value="4.00203011" Text="Bộ môn CN chế tạo máy"></asp:ListItem>
                        <asp:ListItem Value="4.00203012" Text="Bộ môn Cơ khí chính xác & Quang học"></asp:ListItem>
                        <asp:ListItem Value="4.00203013" Text="Bộ môn GCVL & Dụng cụ CN"></asp:ListItem>
                        <asp:ListItem Value="4.00203014" Text="Bộ môn Máy & Ma sát học"></asp:ListItem>
                        <asp:ListItem Value="4.00203015" Text="Bộ môn Hàn và công nghệ kim loại"></asp:ListItem>
                        <asp:ListItem Value="4.00203017" Text="Bộ môn Gia công áp lực"></asp:ListItem>
                        <asp:ListItem Value="4.00203018" Text="Bộ môn Cơ ứng dụng"></asp:ListItem>
                        <asp:ListItem Value="4.0020301B" Text="Bộ môn Cơ học vật liệu"></asp:ListItem>
                        <asp:ListItem Value="4.0020301C" Text="Bộ môn Sức bền vật liệu"></asp:ListItem>
                        <asp:ListItem Value="4.0020301E" Text="Bộ môn Cơ sở thiết kế máy và Rôbôt"></asp:ListItem>
                        <asp:ListItem Value="4.0020301F" Text="Bộ môn Hình hoạ - VKT"></asp:ListItem>
                        <asp:ListItem Value="4.0020301G" Text="Phòng TN: CAD-CAM/CNC"></asp:ListItem>
                        <asp:ListItem Value="4.0020301H" Text="Trung tâm Thực hành Công nghệ Cơ khí"></asp:ListItem>
                        <asp:ListItem Value="4.0020301I" Text="Trung tâm Ðào tạo và Nghiên cứu phát triển công nghệ CNC"></asp:ListItem>
                        <asp:ListItem Value="4.0020301Z" Text="Văn phòng Viện Cơ khí"></asp:ListItem>
                        <asp:ListItem Value="4.00203021" Text="Bộ môn Hóa Lý"></asp:ListItem>
                        <asp:ListItem Value="4.00203022" Text="Bộ môn Hoá Hữu cơ"></asp:ListItem>
                        <asp:ListItem Value="4.00203023" Text="Bộ môn Hoá Phân tích"></asp:ListItem>
                        <asp:ListItem Value="4.00203024" Text="Bộ môn Hoá vô cơ"></asp:ListItem>
                        <asp:ListItem Value="4.00203025" Text="Bộ môn Máy hóa"></asp:ListItem>
                        <asp:ListItem Value="4.00203026" Text="Bộ môn CN Hữu cơ - Hoá dầu"></asp:ListItem>
                        <asp:ListItem Value="4.00203027" Text="Bộ môn Công nghệ các chất vô cơ"></asp:ListItem>
                        <asp:ListItem Value="4.00203028" Text="Bộ môn CN Ðiện hoá - BVKL"></asp:ListItem>
                        <asp:ListItem Value="4.00203029" Text="Bộ môn QT & TB hoá học"></asp:ListItem>
                        <asp:ListItem Value="4.0020302A" Text="Bộ môn CN Vật liệu Silicat"></asp:ListItem>
                        <asp:ListItem Value="4.0020302B" Text="Bộ môn CN In"></asp:ListItem>
                        <asp:ListItem Value="4.0020302C" Text="Bộ môn Xây dựng công nghiệp"></asp:ListItem>
                        <asp:ListItem Value="4.0020302D" Text="Bộ môn Công nghệ Xenluloza và Giấy"></asp:ListItem>
                        <asp:ListItem Value="4.0020302E" Text="Bộ môn Công nghệ Hoá dược và Hoá chất bảo vệ thực vật"></asp:ListItem>
                        <asp:ListItem Value="4.0020302G" Text="PTN CN Lọc hoá Dầu và VL Xúc tác, hấp phụ"></asp:ListItem>
                        <asp:ListItem Value="4.0020302Z" Text="Văn phòng Viện Kĩ thuật Hoá học"></asp:ListItem>
                        <asp:ListItem Value="4.00203031" Text="Bộ môn Hệ thống điện"></asp:ListItem>
                        <asp:ListItem Value="4.00203032" Text="Bộ môn Thiết bị điện - Ðiện tử"></asp:ListItem>
                        <asp:ListItem Value="4.00203033" Text="Bộ môn Kĩ thuật Ðo và Tin học CN"></asp:ListItem>
                        <asp:ListItem Value="4.00203034" Text="Bộ môn Tự động hoá xí nghiệp Công nghiệp"></asp:ListItem>
                        <asp:ListItem Value="4.00203035" Text="Bộ môn Ðiều khiển tự động"></asp:ListItem>
                        <asp:ListItem Value="4.0020303Z" Text="Văn phòng Viện Ðiện"></asp:ListItem>
                        <asp:ListItem Value="4.00203041" Text="Bộ môn Kĩ thuật thông tin"></asp:ListItem>
                        <asp:ListItem Value="4.00203042" Text="Bộ môn Công nghệ điện tử và Kĩ thuật điện tử Y sinh"></asp:ListItem>
                        <asp:ListItem Value="4.00203043" Text="Bộ môn Hệ thống viễn thông"></asp:ListItem>
                        <asp:ListItem Value="4.00203044" Text="Bộ môn Mạch và xử lý tín hiệu số"></asp:ListItem>
                        <asp:ListItem Value="4.00203045" Text="Bộ môn Ðiện tử tin học"></asp:ListItem>
                        <asp:ListItem Value="4.00203046" Text="TT Ðào tạo thực hành ÐT-TH-VT"></asp:ListItem>
                        <asp:ListItem Value="4.0020304Z" Text="Văn phòng Viện Ðiện tử Viễn thông"></asp:ListItem>
                        <asp:ListItem Value="4.00203051" Text="Bộ môn Khoa học máy tính"></asp:ListItem>
                        <asp:ListItem Value="4.00203052" Text="Bộ môn Công nghệ phần mềm"></asp:ListItem>
                        <asp:ListItem Value="4.00203053" Text="Bộ môn Kĩ thuật máy tính"></asp:ListItem>
                        <asp:ListItem Value="4.00203054" Text="Bộ môn Hệ thống thông tin"></asp:ListItem>
                        <asp:ListItem Value="4.00203055" Text="Bộ môn Truyền thông & mạng MT"></asp:ListItem>
                        <asp:ListItem Value="4.00203056" Text="Trung tâm máy tính"></asp:ListItem>
                        <asp:ListItem Value="4.00203057" Text="Phòng thí nghiệm Hệ thống máy tính"></asp:ListItem>
                        <asp:ListItem Value="4.00203058" Text="Ban điều hành Dự án Hỗ trợ và PT đào tạo ÐH và sau ÐH về CNTT và Truyền thông"></asp:ListItem>
                        <asp:ListItem Value="4.0020305Z" Text="Văn phòng Viện CN Thông tin và TT"></asp:ListItem>
                        <asp:ListItem Value="4.00203061" Text="Bộ môn Kĩ thuật gang thép"></asp:ListItem>
                        <asp:ListItem Value="4.00203062" Text="Bộ môn Vật liệu kim loại màu và compozit"></asp:ListItem>
                        <asp:ListItem Value="4.00203063" Text="Bộ môn Vật liệu & Công nghệ đúc"></asp:ListItem>
                        <asp:ListItem Value="4.00203064" Text="Bộ môn Vật liệu học, xử lý nhiệt và bề mặt"></asp:ListItem>
                        <asp:ListItem Value="4.00203065" Text="Bộ môn Cơ học vật liệu & cán kim loại"></asp:ListItem>
                        <asp:ListItem Value="4.00203066" Text="Phòng Thí nghiệm Công nghệ Vật liệu kim loại"></asp:ListItem>
                        <asp:ListItem Value="4.0020306Z" Text="Văn phòng Viện Khoa học & Kĩ thuật vật liệu"></asp:ListItem>
                        <asp:ListItem Value="4.00203071" Text="Bộ môn Kinh tế năng luợng"></asp:ListItem>
                        <asp:ListItem Value="4.00203072" Text="Bộ môn Quản trị kinh doanh"></asp:ListItem>
                        <asp:ListItem Value="4.00203073" Text="Bộ môn Kinh tế học"></asp:ListItem>
                        <asp:ListItem Value="4.00203074" Text="Bộ môn Quản lý tài chính"></asp:ListItem>
                        <asp:ListItem Value="4.00203075" Text="Bộ môn Quản lý Công nghi?p"></asp:ListItem>
                        <asp:ListItem Value="4.0020307Z" Text="Văn phòng Viện Kinh tế & Quản lý"></asp:ListItem>
                        <asp:ListItem Value="4.00203081" Text="Bộ môn Công nghệ Dệt"></asp:ListItem>
                        <asp:ListItem Value="4.00203082" Text="Bộ môn VL & CN hoá dệt"></asp:ListItem>
                        <asp:ListItem Value="4.00203083" Text="Bộ môn CN May & thời trang"></asp:ListItem>
                        <asp:ListItem Value="4.00203084" Text="Trung tâm Thí nghiệm vật liệu Dệt may-Da giầy"></asp:ListItem>
                        <asp:ListItem Value="4.0020308Z" Text="Văn phòng Viện Dệt may- Da giầy và Thời trang"></asp:ListItem>
                        <asp:ListItem Value="4.00203091" Text="Bộ môn Toán - Tin"></asp:ListItem>
                        <asp:ListItem Value="4.00203092" Text="Bộ môn Toán ứng dụng"></asp:ListItem>
                        <asp:ListItem Value="4.00203093" Text="Bộ môn Toán cơ bản"></asp:ListItem>
                        <asp:ListItem Value="4.0020309Z" Text="Van phòng Viện Toán ứng dụng và Tin học"></asp:ListItem>
                        <asp:ListItem Value="4.00203101" Text="Bộ môn Những Nguyên lý cơ bản của CN Mác-Lênin"></asp:ListItem>
                        <asp:ListItem Value="4.00203104" Text="Bộ môn Ðường lối cách mạng của Ðảng Cộng sản Việt Nam"></asp:ListItem>
                        <asp:ListItem Value="4.00203105" Text="Bộ môn Tư tưởng Hồ Chí Minh"></asp:ListItem>
                        <asp:ListItem Value="4.0020310Z" Text="Văn phòng khoa Lý luận chính trị"></asp:ListItem>
                        <asp:ListItem Value="4.00203111" Text="Bộ môn Anh văn"></asp:ListItem>
                        <asp:ListItem Value="4.00203112" Text="Bộ môn Pháp văn"></asp:ListItem>
                        <asp:ListItem Value="4.00203113" Text="Bộ môn Nga văn"></asp:ListItem>
                        <asp:ListItem Value="4.00203114" Text="Bộ môn LT Tiếng & văn minh A.M"></asp:ListItem>
                        <asp:ListItem Value="4.00203115" Text="Bộ môn CS ngôn ngữ học & Việt học"></asp:ListItem>
                        <asp:ListItem Value="4.00203116" Text="Bộ môn Thực hành tiếng & dịch"></asp:ListItem>
                        <asp:ListItem Value="4.0020311Z" Text="Văn phòng Viện Ngoại ngữ"></asp:ListItem>
                        <asp:ListItem Value="4.00203121" Text="Bộ môn Khoa học và Công nghệ Giáo dục"></asp:ListItem>
                        <asp:ListItem Value="4.00203122" Text="Bộ môn Sư phạm các ngành kĩ thuật"></asp:ListItem>
                        <asp:ListItem Value="4.00203123" Text="Văn phòng Viện Sư phạm kĩ thuật"></asp:ListItem>
                        <asp:ListItem Value="4.00203141" Text="Bộ môn Đường lối quân sự"></asp:ListItem>
                        <asp:ListItem Value="4.00203142" Text="Bộ môn Quân sự chung"></asp:ListItem>
                        <asp:ListItem Value="4.00203143" Text="Bộ môn Quân binh chủng"></asp:ListItem>
                        <asp:ListItem Value="4.00203144" Text="Bộ môn Công tác Quốc phòng"></asp:ListItem>
                        <asp:ListItem Value="4.00203151" Text="Bộ môn Lý luận và Giáo dục thể chất cơ bản"></asp:ListItem>
                        <asp:ListItem Value="4.00203152" Text="Bộ môn Thể thao tự chọn"></asp:ListItem>
                        <asp:ListItem Value="4.00203153" Text="Văn phòng Khoa Giáo dục thể chất"></asp:ListItem>
                        <asp:ListItem Value="4.00204111" Text="Văn phòng Ðảng uỷ"></asp:ListItem>
                        <asp:ListItem Value="4.00204112" Text="Văn phòng Công doàn"></asp:ListItem>
                        <asp:ListItem Value="4.00204113" Text="Văn phòng Ðoàn TN CSHCM"></asp:ListItem>
                        <asp:ListItem Value="4.00205022" Text="Phòng Dịch vụ Thông tin tư liệu"></asp:ListItem>
                        <asp:ListItem Value="4.00205023" Text="Phòng Xử lý thông tin"></asp:ListItem>
                        <asp:ListItem Value="4.00205024" Text="Phòng Công nghệ thư viện điện tử"></asp:ListItem>
                        <asp:ListItem Value="4.00205061" Text="Phòng Kĩ thuật Ban Quản lý dự án khu dô thị Ðại học Hà Nội"></asp:ListItem>
                        <asp:ListItem Value="4.00209011" Text="Bộ môn Công nghệ môi trường"></asp:ListItem>
                        <asp:ListItem Value="4.00209012" Text="Bộ môn Quản lý môi trường"></asp:ListItem>
                        <asp:ListItem Value="4.00209013" Text="Phòng TNNC & PTCN môi trường"></asp:ListItem>
                        <asp:ListItem Value="4.00209014" Text="TT Sản xuất sạch"></asp:ListItem>
                        <asp:ListItem Value="4.00209015" Text="TT Quan trắc MT & kiểm soát ô nhiễm CN"></asp:ListItem>
                        <asp:ListItem Value="4.00209016" Text="Phòng Thí nghiệm R&D Công nghệ Môi trường"></asp:ListItem>
                        <asp:ListItem Value="4.0020901Z" Text="Văn phòng Viện KH&CN Môi trường"></asp:ListItem>
                        <asp:ListItem Value="4.00209021" Text="Bộ môn Vật lý đại cương"></asp:ListItem>
                        <asp:ListItem Value="4.00209022" Text="Bộ môn Vật lý Lý thuyết"></asp:ListItem>
                        <asp:ListItem Value="4.00209023" Text="Bộ môn Kĩ thuật hạt nhân và Vật lý môi trường"></asp:ListItem>
                        <asp:ListItem Value="4.00209024" Text="Bộ môn Vật liệu điện tử"></asp:ListItem>
                        <asp:ListItem Value="4.00209025" Text="Bộ môn Vật lý Tin học"></asp:ListItem>
                        <asp:ListItem Value="4.00209026" Text="Bộ môn Quang học và Quang điện tử"></asp:ListItem>
                        <asp:ListItem Value="4.00209028" Text="Trung tâm Nghiên cứu và Phát triển công nghệ chiếu sáng bằng LED"></asp:ListItem>
                        <asp:ListItem Value="4.0020902Z" Text="Van phòng Viện Vật lý Kĩ thuật"></asp:ListItem>
                        <asp:ListItem Value="4.00209031" Text="Bộ môn Quá trình-Thiết bị CN Sinh học-CN Thực phẩm"></asp:ListItem>
                        <asp:ListItem Value="4.00209032" Text="Bộ môn Công nghệ Thực phẩm"></asp:ListItem>
                        <asp:ListItem Value="4.00209034" Text="Bộ môn Quản lý chất lượng"></asp:ListItem>
                        <asp:ListItem Value="4.00209035" Text="Bộ môn Vi sinh-Hoá sinh-Sinh học phân tử"></asp:ListItem>
                        <asp:ListItem Value="4.00209037" Text="Bộ môn Công nghệ sinh học"></asp:ListItem>
                        <asp:ListItem Value="4.00209038" Text="Trung tâm Ðào tạo và Phát triển sản phẩm thực phẩm"></asp:ListItem>
                        <asp:ListItem Value="4.00209039" Text="Trung tâm Nghiên cứu và Phát triển công nghệ sinh học"></asp:ListItem>
                        <asp:ListItem Value="4.0020903Z" Text="Văn phòng Viện CNSP-TP"></asp:ListItem>
                        <asp:ListItem Value="4.00209041" Text="Bm Kĩ thuật nhiệt"></asp:ListItem>
                        <asp:ListItem Value="4.00209042" Text="Bm KT lạnh & điều hoà không khí"></asp:ListItem>
                        <asp:ListItem Value="4.00209043" Text="Bm Hệ thống năng lượng nhiệt"></asp:ListItem>
                        <asp:ListItem Value="4.00209044" Text="Bm Hệ thống và Tự động hoá quá trình nhiệt"></asp:ListItem>
                        <asp:ListItem Value="4.00209045" Text="TT Tiết kiệm năng lượng và CGCN"></asp:ListItem>
                        <asp:ListItem Value="4.00209046" Text="TT Nghiên cứu ứng dụng"></asp:ListItem>
                        <asp:ListItem Value="4.00209047" Text="PTN Quá trình và Thiết bị Nhiệt - Lạnh"></asp:ListItem>
                        <asp:ListItem Value="4.0020904Z" Text="Văn phòng Viện KH&CN Nhiệt - Lạnh"></asp:ListItem>
                        <asp:ListItem Value="4.00209051" Text="PTN. Nano từ và Siêu dẫn Nhiệt độ cao"></asp:ListItem>
                        <asp:ListItem Value="4.00209052" Text="PTN. Công nghệ Vi hệ thống và cảm biến"></asp:ListItem>
                        <asp:ListItem Value="4.00209061" Text="Bm Ðộng cơ đốt trong"></asp:ListItem>
                        <asp:ListItem Value="4.00209062" Text="Bm Ôtô và xe chuyên dụng"></asp:ListItem>
                        <asp:ListItem Value="4.00209063" Text="Bm Kĩ thuật hàng không và vũ trụ"></asp:ListItem>
                        <asp:ListItem Value="4.00209064" Text="Bm Máy và Tự động thuỷ khí"></asp:ListItem>
                        <asp:ListItem Value="4.00209065" Text="Bm Kĩ thuật Thuỷ khí và Tàu thuỷ"></asp:ListItem>
                        <asp:ListItem Value="4.00209066" Text="Phòng Thí nghiệm Ðộng cơ đốt trong"></asp:ListItem>
                        <asp:ListItem Value="4.00209067" Text="Trung tâm Tư vấn và chuyển giao công nghệ cơ khí dùng lực"></asp:ListItem>
                        <asp:ListItem Value="4.00209068" Text="Van phòng viện Cơ khí Ðộng lực"></asp:ListItem>
                        <asp:ListItem Value="4.00209071" Text="Bm Hệ thống Năng lượng bền vững"></asp:ListItem>
                        <asp:ListItem Value="4.00209072" Text="Bm Khoa học và Công nghệ Nanô"></asp:ListItem>
                        <asp:ListItem Value="4.00209073" Text="Phòng thí nghiệm Nano Quang-Ðiện tử"></asp:ListItem>
                        <asp:ListItem Value="4.00209074" Text="Văn phòng Viện Tiên tiến KH&CN (AIST)"></asp:ListItem>
                        <asp:ListItem Value="4.00209110" Text="Phòng Phân tích-Kiểm nghiệm"></asp:ListItem>
                        <asp:ListItem Value="4.00209120" Text="Phòng Mô phỏng-Chuyển quy mô"></asp:ListItem>
                        <asp:ListItem Value="4.00209130" Text="Phòng Phát triển-Quản lý dự án"></asp:ListItem>
                        <asp:ListItem Value="4.00209140" Text="Phòng Phân tích-Tinh chế-Chuyển hóa"></asp:ListItem>
                        <asp:ListItem Value="4.00209150" Text="Trung tâm Phát triển ứng dụng và chuyển giao công nghệ"></asp:ListItem>
                        <asp:ListItem Value="4.0020B231" Text="Phòng Thị giác Máy tính"></asp:ListItem>
                        <asp:ListItem Value="4.0020B232" Text="Phòng Giao tiếp tiếng nói"></asp:ListItem>
                        <asp:ListItem Value="4.0020B233" Text="Phòng Môi trường cảm thụ và Tương tác"></asp:ListItem>
                        <asp:ListItem Value="4.0020B234" Text="Phòng Thí nghiệm Tương tác người-máy đa phương thức"></asp:ListItem>
                        <asp:ListItem Value="4.0020B235" Text="Trung tâm Phát triên ứng dụng và chuyển giao công nghệ"></asp:ListItem>--%>

                    </asp:DropDownList>
                </div>
            </div>
            <div class="hang">
                <h4>
                    Diện cán bộ:</h4>
                <div class="row-right">
                    <span class="ddl">
                        <asp:DropDownList ID="ddlDienCanBo" runat="server" CssClass="ddl" />
                    </span>
                </div>
            </div>
            <%-- <div class="hang">
        	<h4>Hiện nay:</h4>
             <div class="row-right">
                 <asp:DropDownList ID="ddlHiennay" runat="server">
                    <asp:ListItem Value ="-1" Text ="---Không chọn---" Selected ="True"></asp:ListItem>
                    <asp:ListItem Value ="0" Text ="Hiện đang công tác"></asp:ListItem>
                    <asp:ListItem Value ="1" Text ="Đã nghỉ hưu"></asp:ListItem>
                    <asp:ListItem Value ="2" Text ="Đã mất"></asp:ListItem>
                    <asp:ListItem Value ="3" Text ="Đã chuyển cơ quan khác"></asp:ListItem>
                    <asp:ListItem Value ="4" Text ="Thôi việc"></asp:ListItem>
                    <asp:ListItem Value ="5" Text ="Hiện không hưởng lương"></asp:ListItem>
                 </asp:DropDownList>  
        	</div> 
        </div>--%>
            <div class="hang">
                <h4>
                    Khối cán bộ:</h4>
                <div class="row-right">
                    <asp:DropDownList ID="ddlKhoiCb" runat="server" CssClass="ddl">
                        <%--<asp:ListItem Value ="-1" Text ="---Không chọn---" Selected ="True"></asp:ListItem>
                        <asp:ListItem Value ="0" Text ="Giảng dạy"></asp:ListItem>
                        <asp:ListItem Value ="1" Text ="Phục vụ"></asp:ListItem>
                        <asp:ListItem Value ="2" Text ="Hành chính"></asp:ListItem>
                        <asp:ListItem Value ="3" Text ="Nghiên cứu"></asp:ListItem>
                        <asp:ListItem Value ="4" Text ="Khác"></asp:ListItem>--%>
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <asp:ImageButton ID="btnSearch" runat="server" Text="Tìm kiếm" ImageUrl="~/Images/timkiem.png"
            CssClass="button" OnClick="btnSearch_Click" />
        <%--<input type="image" src="../../Images/timkiem.png" style=" margin-left:650px;"  onclick="this.form.submit();"/>  --%>
        </form>
        <!-- InstanceEndEditable -->
        <div id="ResultSearch" class="kqtk_kt">
            <asp:Label ID="x" runat="server" Text="Ket qua: co "></asp:Label><asp:Label ID="lbllblResultSearch"
                runat="server"></asp:Label><br />
            <h1>
                <asp:HyperLink ID="xuatdata" Text="Xuat du lieu" CssClass="hpl" runat="server" NavigateUrl="~/Pages/BaoCao/KhenThuong.aspx"></asp:HyperLink></h1>
            <asp:GridView ID="gvResultSearch" runat="server" CssClass="gvResultSearch" Width="100%"
                PageSize="40" BackColor="White" BorderColor="#3366CC" BorderStyle="Groove" BorderWidth="2px"
                CellPadding="4">
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
        </div>
    </div>
    <!--id=content -->
</asp:Content>
