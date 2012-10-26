<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Admin.Master" AutoEventWireup="true" CodeBehind="BangDanhMuc.aspx.cs" Inherits="HutStaff.Administrator.Pages.QuanLy.BangDanhMuc" %>

<%@ Register Src="/Controls/Common/SlideQuanLy.ascx" TagPrefix="uc1" TagName="SlideQuanLy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#divHeader .nav a').removeClass("active");
            $('#divHeader .nav a').eq(1).addClass('active');
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContentPlaceHolder" runat="server">
        <uc1:SlideQuanLy runat="server" ID="SlideQuanLy" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<div class="content">
    <h1 class="title">Bảng danh mục</h1>
    <hr width="750px" />
    <div class="main">
        <table width="100%" cellspacing="1" cellpadding="4" border="0" style="border-spacing: 1px; border-collapse:separate;">
            <tr>
			<td class="row1"><a href="dm_dv.php">01 - Bảng danh mục đơn vị</a></td>
			<td class="row1"><a href=" dm_hh.php">02 - Bảng danh mục học hàm </a></td>
		</tr>
		<tr>
			<td class="row1"><a href=" dm_dcb.php">03 - Bảng danh mục diện cán bộ</a></td>
			<td class="row1"><a href=" dm_kt.php ">04 - Bảng danh mục hình thức khen thưởng </a></td>
		</tr>
		<tr>
			<td class="row1"><a href=" dm_tt.php ">05 - Bảng danh mục tình trạng công tác </a></td>
			<td class="row1"><a href=" dm_kl.php ">06 - Bảng danh mục hình thức kỷ luật </a></td>
		</tr>
		<tr>
			<td class="row1"><a href="dm_cqtd.php">07 - Bảng danh mục cơ quan tuyển dụng</a></td>
			<td class="row1"><a href=" dm_tdnn.php ">08 - Bảng danh mục trình độ ngoại ngữ</a></td>
		</tr>
		<tr>
			<td class="row1"><a href="dm_cvdn.php">09 - Bảng danh mục công việc đảm nhận</a></td>
			<td class="row1"><a href=" dm_tnn.php ">10 - Bảng danh mục tên ngoại ngữ </a></td>
		</tr>
		<tr>
			<td class="row1"><a href="dm_qhgd.php">11 - Bảng danh mục quan hệ gia đình</a></td>
			<td class="row1"><a href=" dm_tdhv.php ">12 - Bảng danh mục trình độ học vấn </a></td>
		</tr>
		<tr>
			<td class="row1"><a href="dm_cn.php">13 - Bảng danh mục chuyên ngành đào tạo</a></td>
			<td class="row1"><a href=" dm_tdql.php ">14 - Bảng danh mục trình độ quản lý</a></td>
		</tr>
		<tr>
			<td class="row1"><a href=" dm_htdt.php">15 - Bảng danh mục hình thức đào tạo</a></td>
			<td class="row1"><a href=" dm_tdll.php ">16 - Bảng danh mục trình độ lý luận </a></td>
		</tr>
		<tr>
			<td class="row1"><a href=" dm_vbdt.php ">17 - Bảng danh mục văn bằng đào tạo</a></td>
			<td class="row1"><a href=" dm_tdth.php ">18 - Bảng danh mục trình độ  tin học </a></td>
		</tr>
		<tr>
			<td class="row1"><a href="dm_csbd.php">19 - Bảng danh mục cơ sở bồi dưỡng</a></td>
			<td class="row1"><a href=" dm_qg.php ">20 - Bảng danh mục quốc gia </a></td>
		</tr>
		<tr>
			<td class="row1"><a href=" dm_cvcq.php ">21 - Bảng danh mục chức vụ chính quyền </a></td>
			<td class="row1"><a href="dm_dp.php">22 - Bảng danh mục tỉnh, thành phố Việt Nam</a></td>
		</tr>
		<tr>
			<td class="row1"><a href="dm_cvcu.php">23 - Bảng danh mục chức vụ Đảng</a></td>
			<td class="row1"><a href=" dm_ngach.php ">24 - Bảng danh mục ngạch lương</a></td>
		</tr>
		<tr>
			<td class="row1"><a href="dm_cvdt.php">25 - Bảng danh mục chức vụ đoàn thể</a></td>
			<td class="row1"><a href="dm_mlcb.php">26 - Bảng danh mục mặt bằng lương</a></td>
		</tr>
		<tr>
			<td class="row1"><a href="dm_dhdp.php">27 - Bảng danh mục danh hiệu</a></td>
			<td class="row1"><a href="dm_nkpnndd.php">28 - Bảng danh mục nguồn kinh phí đi nước ngoài</a></td>
		</tr>
		<tr>
			<td class="row1"><a href="dm_ttnndd.php">29 - Bảng danh mục tình trạng đi nước ngoài</a></td>
			<td class="row1"><a href="dm_mdnndd.php">30 - Bảng danh mục mục đích đi nước ngoài</a></td>
		</tr>
		<tr>
			<td class="row1"><a href="dm_ptldh.php">31 - Bảng danh mục % lương được hưởng</a></td>
			<td class="row1"><a href="dm_tthn.php">32 - Bảng danh mục tình trạng hôn nhân</a></td>
		</tr>
				<tr>
			<td class="row1"><a href="dm_dp1.php">33 - Bảng danh mục quận, huyện Việt Nam</a></td>
			<td class="row1"><a href="dm_csdtcm.php">34 - Bảng danh mục cơ sở đào tạo chuyên môn</a></td>
		</tr>
        <tr>
			<td class="row1"><a href="dm_bh.php">35 - Bảng danh mục Bảo hiểm</a></td>
			<td class="row1"></td>
		</tr>
	
        </table>
    </div>
</div>
</asp:Content>
