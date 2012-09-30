<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="KhenThuong.aspx.cs" Inherits="QLCB_BK.Pages.BaoCao.KhenThuong" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<div id="content">
	<!-- InstanceBeginEditable name="content" -->
    <br>
    <h1>Tìm kiếm thông tin khen thưởng</h1>
    <hr width="800px">
    <form name="myform" action="" method="post" onsubmit="return false">  
    <div id="timkiem">
    	<div class="hang">
            <h4> Đơn vị cấp 1,2,3:</h4>
            <div class="f_input row-right">
                <select name="dv1" id="dv1" onchange="donvicap1();" onfocus="donvicap1();" onblur="donvicap1();">
				    <option value="1.00200000">Toàn trường</option>&gt;
                    <option value="2.00203000-2.00209000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Khoa + Viện</option>
                    <option value="3.00203140">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Khoa Giáo dục Quốc phòng</option>
                    <option value="3.00203150">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Khoa Giáo dục Thể chất</option>
                    <option value="3.00203100">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Khoa Lý luận chính trị</option>
                    <option value="4.00209120">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Mô phỏng-Chuyển quy mô</option>
                    <option value="4.00209110">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Phân tích-Kiểm nghiệm</option>
                    <option value="4.00209140">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Phân tích-Tinh chế-Chuyển hóa</option>
                    <option value="4.00209130">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Phát triển-Quản lý dự án</option>
                    <option value="4.00209150">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Phát triển ứng dụng và chuyển giao công nghệ</option>
                    <option value="3.00203010">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Cơ khí</option>
                    <option value="3.00209060">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Cơ khí Động lực</option>
                    <option value="3.00209030">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Công nghệ Sinh học và Thực phẩm</option>
                    <option value="3.00203050">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Công nghệ Thông tin và Truyền thông</option>
                    <option value="3.00203080">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Dệt may-Da giầy và Thời trang</option>
                    <option value="3.00209010">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Khoa học và Công nghệ Môi trường</option>
                    <option value="3.00209040">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Khoa học và Công nghệ Nhiệt Lạnh</option>
                    <option value="3.00203060">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Khoa học và Kỹ thuật vật liệu</option>
                    <option value="3.00203070">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Kinh tế và Quản lý</option>
                    <option value="3.00209090">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Kỹ thuật Hạt nhân và Vật lý Môi trường</option>
                    <option value="3.00203020">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Kỹ thuật Hoá học</option>
                    <option value="3.00209200">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Kỹ thuật điều khiển và Tự động hóa</option>
                    <option value="3.00209100	">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Nghiên cứu và Phát triển ứng dụng các hợp chất thiên nhiên</option>
                    <option value="3.00203110">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Ngoại ngữ</option>
                    <option value="3.00203120">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Sư phạm Kỹ thuật</option>
                    <option value="3.00209070">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Tiên tiến Khoa học và Công nghệ (AIST)</option>
                    <option value="3.00203090">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Toán ứng dụng và Tin học</option>
                    <option value="3.00209020">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Vật lý kỹ thuật</option>
                    <option value="3.00203130">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Đào tạo liên tục</option>
                    <option value="3.00209050">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Đào tạo Quốc tế về Khoa học Vật liệu (ITIMS)</option>
                    <option value="3.00209080">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Đào tạo Sau đại học</option>
                    <option value="3.00203030">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Điện</option>
                    <option value="3.00203040">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Điện tử - Viễn thông</option>
                    <option value="2.00204000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng</option>
                    <option value="3.00204010">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Tổ chức Cán bộ</option>
                    <option value="3.00204020">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Đào tạo Đại học</option>
                    <option value="3.00204030">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Hành chính tổng hợp</option>
                    <option value="3.00204040">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Kế hoạch -Tài vụ</option>
                    <option value="3.00204050">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Hợp tác Quốc tế</option>
                    <option value="3.00204060">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Khoa học - Công nghệ</option>
                    <option value="3.00204070">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Công tác Chính trị và Công tác sinh viên</option>
                    <option value="3.00204080">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Quản trị</option>
                    <option value="3.00204090">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Bảo vệ</option>
                    <option value="3.00204100">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Thiết bị</option>
                    <option value="3.00204110">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ba văn phòng</option>
                    <option value="3.00204120">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Y tế Bách khoa</option>
                    <option value="2.00205000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ban</option>
                    <option value="3.00205010">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Đảm bảo chất lượng</option>
                    <option value="3.00205020">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Thư viện Tạ Quang Bửu</option>
                    <option value="3.00205030">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ban Quản lý Công trình</option>
                    <option value="3.00205050">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ban Xây dựng và Quản lý Dự án</option>
                    <option value="3.00205070">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ban Quản trị các tòa nhà cao tầng</option>
                    <option value="3.00205080">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Ngoại ngữ</option>
                    <option value="3.00205100">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Mạng thông tin</option>
                    <option value="2.00206000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bộ môn</option><option value="2.0020B000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm</option>
                    <option value="3.0020B040">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Nghiên cứu vật liệu Polyme</option>
                    <option value="3.0020B070">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Quản lý Ký túc xá</option>
                    <option value="3.0020B090">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm nghiên cứu triển khai công nghệ cao</option>
                    <option value="3.0020B120">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm tiếng Pháp</option>
                    <option value="3.0020B140">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm trao đổi KHKT Việt Đức</option>
                    <option value="3.0020B150">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Điện tử  - Y sinh học</option>
                    <option value="3.0020B160">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm tính toán hiệu năng cao</option>
                    <option value="3.0020B170">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm PT và UD Công nghệ phần mềm</option>
                    <option value="3.0020B180">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm phần mềm và giải pháp an ninh mạng</option>
                    <option value="3.0020B190">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm hợp tác QT về ĐT&amp;CGCN</option>
                    <option value="3.0020B220">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Quốc tế Nghiên cứu và Phát triển công nghệ định vị sử dụng vệ tinh (NAVIS)</option>
                    <option value="3.0020B230">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Nghiên cứu quốc tế về Thông tin đa phương tiện, truyền thông và ứng dụng (MICA)</option>
                    <option value="3.0020B240">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phòng Thí nghiệm trọng điểm Vật liệu Polyme và Compozit</option>
                    <option value="3.0020B260">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Đào tạo Tài năng và Chất lượng cao</option>
                    <option value="3.0020B270">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Đào tạo Bảo dưỡng công nghiệp</option>
                    <option value="3.0020B300">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Thể thao-Văn hoá</option>
                    <option value="3.0020B310">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viện Đào tạo quốc tế</option>
                    <option value="3.0020B320">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Nghiên cứu Quốc tế về Khoa học vật liệu tính toán</option>
                    <option value="3.0020B330">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Nghiên cứu ứng dụng và Sáng tạo công nghệ </option>
                    <option value="3.0020B340">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Chương trình Hợp tác đào tạo Quốc tế Genetic Bách khoa</option>
                    <option value="2.0020E000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Các đơn vị Sản xuất - Dịch vụ</option>
                    <option value="3.0020E010">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Công ty TNHH MTV Tư vấn và CGCN Bách khoa</option>
                    <option value="3.0020E030">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nhà xuất bản Bách Khoa Hà Nội</option>
                    <option value="3.0020E040">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trung tâm Phục vụ Bách khoa</option>
                    <option value="3.0020E050">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bách khoa Hà Nội-Holdings</option>
                </select>
            </div>
        </div>
        <div class="hang">
        	<h4> Đơn vị cấp 4:</h4>
            
            <div class="row-right">
            <select name="dv2">
                <option value="0"></option>
                <option value="4.00203011">Bm CN Chế tạo máy</option>
                <option value="4.00203012">Bm Cơ khí chính xác &amp; Quang học</option>
                <option value="4.00203013">Bm GCVL &amp; Dụng cụ CN</option>
                <option value="4.00203014">Bm Máy &amp; Ma sát học</option>
                <option value="4.00203015">Bm Hàn và công nghệ kim loại</option>
                <option value="4.00203017">Bm Gia công áp lực</option>
                <option value="4.00203018">Bm Cơ ứng dụng</option>
                <option value="4.0020301B">Bm Cơ học vật liệu </option>
                <option value="4.0020301C">Bm Sức bền vật liệu</option>
                <option value="4.0020301E">Bm Cơ sở thiết kế máy và Rôbốt</option>
                <option value="4.0020301F">Bm Hình hoạ - VKT</option>
                <option value="4.0020301G">Phòng TN: CAD-CAM/CNC</option>
                <option value="4.0020301H">Trung tâm Thực hành Công nghệ Cơ khí</option>
                <option value="4.0020301I">Trung tâm Đào tạo và Nghiên cứu phát triển công nghệ CNC</option>
                <option value="4.0020301Z">Văn phòng Viện Cơ khí</option>
                <option value="4.00203021">Bm Hoá lý</option>
                <option value="4.00203022">Bm Hoá Hữu cơ</option>
                <option value="4.00203023">Bm Hoá Phân tích</option>
                <option value="4.00203024">Bm Hoá vô cơ &amp; đại cương</option>
                <option value="4.00203025">Bm Máy hoá</option>
                <option value="4.00203026">Bm CN Hữu cơ - Hoá dầu</option>
                <option value="4.00203027">Bm Công nghệ các chất vô cơ</option>
                <option value="4.00203028">Bm CN Điện hoá - BVKL</option>
                <option value="4.00203029">Bm QT&amp;TB hoá học</option>
                <option value="4.0020302A">Bm CN Vật liệu Silicat</option>
                <option value="4.0020302B">Bm Công nghệ In</option>
                <option value="4.0020302C">Bm Xây dựng công nghiệp</option>
                <option value="4.0020302D">Bm Công nghệ Xenluloza và Giấy</option>
                <option value="4.0020302E">Bm Công nghệ Hoá dược và Hoá chất bảo vệ thực vật</option>
                <option value="4.0020302G">PTN CN Lọc hoá Dầu và VL Xúc tác, hấp phụ</option>
                <option value="4.0020302Z">Văn phòng Viện Kỹ thuật Hoá học</option>
                <option value="4.00203031">Bm Hệ thống điện</option>
                <option value="4.00203032">Bm Thiết bị điện - Điện tử</option>
                <option value="4.00203033">Bm Kỹ thuật Đo và Tin học CN</option>
                <option value="4.00203034">Bm Tự động hoá xí nghiệp Công nghiệp</option>
                <option value="4.00203035">Bm Điều khiển tự động</option>
                <option value="4.0020303Z">Văn phòng Viện Điện</option>
                <option value="4.00203041">Bm Kỹ thuật thông tin</option>
                <option value="4.00203042">Bm Công nghệ điện tử và Kỹ thuật điện tử Y sinh</option>
                <option value="4.00203043">Bm Hệ thống viễn thông</option><option value="4.00203044">Bm Mạch và xử lý tín hiệu số</option><option value="4.00203045">Bm Điện tử tin học</option><option value="4.00203046">TT Đào tạo thực hành ĐT-TH-VT</option><option value="4.0020304Z">Văn phòng Viện Điện tử Viễn thông</option><option value="4.00203051">Bm Khoa học máy tính</option><option value="4.00203052">Bm Công nghệ phần mềm</option><option value="4.00203053">Bm Kỹ thuật máy tính</option><option value="4.00203054">Bm Hệ thống thông tin</option><option value="4.00203055">Bm Truyền thông &amp; mạng MT</option><option value="4.00203056">Trung tâm máy tính</option><option value="4.00203057">Phòng thí nghiệm Hệ thống máy tính</option><option value="4.00203058">Ban điều hành Dự án Hỗ trợ và PT đào tạo ĐH và sau ĐH về CNTT và Truyền thông </option><option value="4.0020305Z">Văn phòng Viện CN Thông tin và TT</option><option value="4.00203061">Bm Kỹ thuật gang thép</option><option value="4.00203062">Bm Vật liệu kim loại màu và compozit</option><option value="4.00203063">Bm Vật liệu &amp; Công nghệ đúc</option><option value="4.00203064">Bm Vật liệu học, xử lý nhiệt và bề mặt</option><option value="4.00203065">Bm Cơ học vật liệu &amp; cán kim loại</option><option value="4.00203066">Phòng Thí nghiệm Công nghệ Vật liệu kim loại</option><option value="4.0020306Z">Văn phòng Viện Khoa học &amp; Kỹ thuật vật liệu</option><option value="4.00203071">Bm Kinh tế năng lượng</option><option value="4.00203072">Bm Quản trị kinh doanh</option><option value="4.00203073">Bm Kinh tế học</option><option value="4.00203074">Bm Quản lý tài chính</option><option value="4.00203075">Bm Quản lý Công nghiệp</option><option value="4.0020307Z">Văn phòng Viện Kinh tế &amp; Quản lý</option><option value="4.00203081">Bm Công nghệ Dệt</option><option value="4.00203082">Bm VL&amp;CN hoá dệt</option><option value="4.00203083">Bm CN May &amp; thời trang</option><option value="4.00203084">Trung tâm Thí nghiệm vật liệu Dệt may-Da giầy</option><option value="4.0020308Z">Văn phòng Viện Dệt may- Da giầy và Thời trang</option><option value="4.00203091">Bm Toán - Tin</option><option value="4.00203092">Bm Toán ứng dụng</option><option value="4.00203093">Bm Toán cơ bản</option><option value="4.0020309Z">Văn phòng Viện Toán ứng dụng và Tin học</option><option value="4.00203101">Bm Những Nguyên lý cơ bản của CN Mác-Lênin</option><option value="4.00203104">Bm Đường lối cách mạng của Đảng Cộng sản Việt Nam</option><option value="4.00203105">Bm Tư tưởng Hồ Chí Minh</option><option value="4.0020310Z">Văn phòng khoa Lý luận chính trị</option><option value="4.00203111">Bm Anh văn</option><option value="4.00203112">Bm Pháp văn</option><option value="4.00203113">Bm Nga văn</option><option value="4.00203114">Bm LT tiếng &amp; văn minh A.M</option><option value="4.00203115">Bm CS ngôn ngữ học &amp; Việt học</option><option value="4.00203116">Bm Thực hành tiếng &amp; dịch</option><option value="4.0020311Z">Văn phòng Viện Ngoại ngữ</option><option value="4.00203121">Bm Khoa học và Công nghệ Giáo dục</option><option value="4.00203122">Bm Sư phạm các ngành kỹ thuật</option><option value="4.00203123">Văn phòng Viện Sư phạm kỹ thuật</option><option value="4.00203141">Bm Đường lối quân sự</option><option value="4.00203142">Bm Quân sự chung</option><option value="4.00203143">Bm Quân binh chủng</option><option value="4.00203144">Bm Công tác Quốc phòng</option><option value="4.00203151">Bm Lý luận và Giáo dục thể chất cơ bản</option><option value="4.00203152">Bm Thể thao tự chọn</option><option value="4.00203153">Văn phòng Khoa Giáo dục thể chất</option><option value="4.00204111">Văn phòng Đảng uỷ</option><option value="4.00204112">Văn phòng Công đoàn</option><option value="4.00204113">Văn phòng Đoàn TN CSHCM</option><option value="4.00205022">Phòng Dịch vụ Thông tin tư liệu</option><option value="4.00205023">Phòng Xử lý thông tin</option><option value="4.00205024">Phòng Công nghệ thư viện điện tử</option><option value="4.00205061">Phòng Kỹ thuật Ban Quản lý dự án khu đô thị Đại học Hà Nội</option><option value="4.00209011">Bm Công nghệ môi trường</option><option value="4.00209012">Bm Quản lý môi trường</option><option value="4.00209013">Phòng TNNC&amp;PTCN môi trường</option><option value="4.00209014">TT Sản xuất sạch</option><option value="4.00209015">TT Quan trắc MT &amp; kiểm soát ô nhiễm CN</option><option value="4.00209016">Phòng Thí nghiệm R&amp;D Công nghệ Môi trường</option><option value="4.0020901Z">Văn phòng Viện KH&amp;CN Môi trường</option><option value="4.00209021">Bm Vật lý đại cương</option><option value="4.00209022">Bm Vật lý lý thuyết</option><option value="4.00209023">Bm Kỹ thuật hạt nhân và Vật lý môi trường</option><option value="4.00209024">Bm Vật liệu điện tử</option><option value="4.00209025">Bm Vật lý Tin học</option><option value="4.00209026">Bm Quang học và Quang điện tử</option><option value="4.00209028">Trung tâm Nghiên cứu và Phát triển công nghệ chiếu sáng bằng LED</option><option value="4.0020902Z">Văn phòng Viện Vật lý Kỹ thuật</option><option value="4.00209031">Bm Quá trình-Thiết bị CN Sinh học-CN Thực phẩm</option><option value="4.00209032">Bm Công nghệ Thực phẩm </option><option value="4.00209034">Bm Quản lý chất lượng </option><option value="4.00209035">Bm Vi sinh-Hoá sinh-Sinh học phân tử</option><option value="4.00209037">Bm Công nghệ sinh học</option><option value="4.00209038">Trung tâm Đào tạo và Phát triển sản phẩm thực phẩm</option><option value="4.00209039">Trung tâm Nghiên cứu và Phát triển công nghệ sinh học</option><option value="4.0020903Z">Văn phòng Viện CNSP-TP</option><option value="4.00209041">Bm Kỹ thuật nhiệt</option><option value="4.00209042">Bm KT lạnh &amp; điều hoà không khí</option><option value="4.00209043">Bm Hệ thống năng lượng nhiệt</option><option value="4.00209044">Bm Hệ thống và Tự động hoá quá trình nhiệt</option><option value="4.00209045">TT Tiết kiệm năng lượng và CGCN</option><option value="4.00209046">TT Nghiên cứu ứng dụng</option><option value="4.00209047">PTN Quá trình và Thiết bị Nhiệt - Lạnh</option><option value="4.0020904Z">Văn phòng Viện KH&amp;CN Nhiệt - Lạnh</option><option value="4.00209051">PTN. Nano từ và Siêu dẫn Nhiệt độ cao</option><option value="4.00209052">PTN. Công nghệ Vi hệ thống và cảm biến</option><option value="4.00209061">Bm Động cơ đốt trong</option><option value="4.00209062">Bm Ôtô và xe chuyên dụng</option><option value="4.00209063">Bm Kỹ thuật hàng không và vũ trụ</option><option value="4.00209064">Bm Máy và Tự động thuỷ khí</option><option value="4.00209065">Bm Kỹ thuật Thuỷ khí và Tàu thuỷ</option><option value="4.00209066">Phòng Thí nghiệm Động cơ đốt trong</option><option value="4.00209067">Trung tâm Tư vấn và chuyển giao công nghệ cơ khí động lực</option><option value="4.00209068">Văn phòng viện Cơ khí Động lực</option><option value="4.00209071">Bm Hệ thống Năng lượng bền vững</option><option value="4.00209072">Bm Khoa học và Công nghệ Nanô</option><option value="4.00209073">Phòng thí nghiệm Nano Quang-Điện tử</option><option value="4.00209074">Văn phòng Viện Tiên tiến KH&amp;CN (AIST)</option><option value="4.00209110">Phòng Phân tích-Kiểm nghiệm</option><option value="4.00209120">Phòng Mô phỏng-Chuyển quy mô</option><option value="4.00209130">Phòng Phát triển-Quản lý dự án</option><option value="4.00209140">Phòng Phân tích-Tinh chế-Chuyển hóa</option><option value="4.00209150">Trung tâm Phát triển ứng dụng và chuyển giao công nghệ</option><option value="4.0020B231">Phòng Thị giác Máy tính</option><option value="4.0020B232">Phòng Giao tiếp tiếng nói</option><option value="4.0020B233">Phòng Môi trường cảm thụ và Tương tác</option><option value="4.0020B234">Phòng Thí nghiệm Tương tác người-máy đa phương thức</option><option value="4.0020B235">Trung tâm Phát triển ứng dụng và chuyển giao công nghệ</option>
                </select>
            </div>
        </div>
        
        
       
        <div class="hang">
        	<h4>Diện cán bộ:</h4>
             <div class="row-right">
                 <select name="dcb" style="width:200px;">
                 <option value="-1" selected="selected">---Không chọn---</option><option value="0">Tuyển dụng 2008</option><option value="1">Biên chế</option><option value="2">Hợp đồng dài hạn</option><option value="3">Hợp đồng ngắn hạn</option><option value="4">Nghiên cứu khoa học</option><option value="5">Hợp đồng chờ biên chế</option><option value="6">Đã rời biên chế</option><option value="7">Tuyển dụng 2003</option><option value="8">Gửi lương</option><option value="9">Tuyển dụng 10/2004</option><option value="10">Tuyển dụng 2005</option><option value="11">Tuyển dụng 2006</option><option value="12">Tuyển dụng 2007</option><option value="13">Biệt phái</option><option value="14">Tuyển dụng 2009</option><option value="15">Tuyển dụng 2010</option><option value="16">Tuyển dụng 2011</option><option value="17">Tuyển dụng 2012</option>             </select>
        	</div>
        </div>
         <div class="hang">
        	<h4>Hiện nay:</h4>
             <div class="row-right">
                 <select name="hiennay" style="width:200px;">
                 <option value="-1" selected="selected">---Không chọn---</option><option value="1">Hiện đang công tác</option><option value="2">Đã nghỉ hưu</option><option value="3">Đã mất</option><option value="4">Đã chuyển cơ quan khác</option><option value="5">Thôi việc</option><option value="6">Hiện không hưởng lương</option>             </select>
        	</div> 
        </div>
          <div class="hang">
        	<h4>Khối cán bộ:</h4>
             <div class="row-right">
                 <select name="khoicanbo" style="width:200px;">
                 <option value="-1" selected="selected">---Không chọn---</option><option value="1">Giảng dạy</option><option value="2">Phục vụ</option><option value="3">Hành chính</option><option value="4">Nghiên cứu</option>			 <option value="5">Khác</option>
                 </select>
        	</div>
        </div>
          
        
    </div>
    
    <input type="image" src="../../Images/timkiem.png" style=" margin-left:650px;"  onclick="this.form.submit();"/>  
    </form> 							
	<!-- InstanceEndEditable -->
</div><!--id=content -->
</asp:Content>
