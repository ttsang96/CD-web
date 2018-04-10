<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@page import="dao.Dao"%>
<%@page import="java.util.Date"%>
<%@page import="model.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Oswald|Playfair+Display|Roboto"
	rel="stylesheet">
<title>Tin tuyển dụng</title>

</head>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
	font-family: "Roboto", sans-serif;
}

.main-header {
	background-color: #ffffff;
	border-bottom: 1px solid #ededed;
	padding: 10px;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	z-index: 1000;
}

.main-container {
	width: 100%;
	position: relative;
	background-color: #EEEEEE;
}

.content {
	padding-top: 70px;
	max-width: 680px;
	margin: auto;
}

.legal h1 {
	padding-bottom: 10px;
}

.legal h2 {
	padding-bottom: 10px;
	padding-top: 10px;
	font-size: 20px;
}

.legal p {
	padding-top: 10px;
	padding-bottom: 10px;
}
</style>
<body>
<%
		ArrayList<Category> listLH = Dao.getListCategory();
	ArrayList<Food> listSufferFood = Dao.getListSufferFood();
		Card_item card_item = (Card_item) session.getAttribute("card");
		if (card_item == null) {
			card_item = new Card_item();
			session.setAttribute("card", card_item);
		}
		if(session.getAttribute("user_webTMDT") == null){
			response.sendRedirect("login_page.jsp");
		}
	%>
	<div class="main-header">
		<div style="margin-right: 7%;">
			<div class="filter_bar" style="background: white; margin-top: 0px;">
			<div class="ads"
				style="width: 86%; height: 30px; margin-left: 7%; margin-right: 7%;">
				<a href="new_food.jsp"><img alt="logo" src="images/logo_TTS.png"></a>
				<div id="filter_option_menu"
					style="background: white; width: 95%; margin-top: -30px; height: 30px; margin-left: 9%;">

					<select name="phase_filter" class="phase_filter_selected"
						style="height: 34px">
						<%
							for (Category category : listLH) {
								out.print("<option  value='" + category.getId_category() + "'>" + category.getName_category()
										+ "</option>");
							}
						%>

					</select> <input type="text" class="phase_search"
						style="height: 30px; width: 400px"
						placeholder="Món ăn, nguyên liệu, loại hình..."> <input
						type="submit" class="btn_search" value="Tìm kiếm"
						style="height: 32px; width: 65px;"> <a  href="formula_request.jsp"
						style="margin-left: 10px; overflow: auto !important; text-decoration: none">Đặt
						món ăn theo cách làm</a> <a href="profile_user.jsp"
						style="margin-left: 50px; overflow: auto !important; text-decoration: none; position: relative;"><img
						alt="" src="GetUserImage?your_id=<%= session.getAttribute("user_webTMDT")%>" onerror=this.src="images/chief.png"	style="width: 35px; height: 35px; position: absolute; margin-left: -35px">
						Trang của tôi</a> <span class="tengicungdc"
						style="position: relative;"><a href="card_manage.jsp"
						style="position: absolute; margin-left: 10px; text-decoration: none; top: -30%">
							<img alt="" src="images/icon_cart.png"
							style="width: 32px; height: 32px; margin-left: 10px;">
					</a></span> <span
						style="margin-left: 45px; position: absolute; color: red; font-weight: bold;">
						<%
							if (card_item.getCartItems().size() > 0) {
						%>
						<p
							style="width: 20px; height: 20px; border-radius: 100%; background: red; color: white; line-height: 20px; text-align: center; border: none; cursor: pointer;">
							<%= card_item.getCartItems().size() %>
							</p>

						<%
							}
						%>
					</span>
				</div>
			</div>
		</div>
		</div>
	</div>
	<div class="main-container">
		<div class="content">

			<div class="legal">
				<h1>Ship đồ ăn TTSFood cần tuyển :</h1>

				<h2>TTSFood tuyển ứng viên cho các vị trí như sau :</h2>

				<p>1. Nhân viên Seo/ IT (Part time )</p>

				<p>2.Nhân viên Chăm sóc khách hàng Call center (Part time)</p>


				<p><b>** Lĩnh vực làm việc:</b> Quản lí website và chăm sóc khách
					hàng</p>

				<p><b>** Nơi làm việc:</b> 15 đường số 4 P. Thảo Điền, Quận 2, Hồ Chí
					Minh</p>

				<h2>** Mô tả công việc:</h2>
				<p>==> Vị trí 1: hỗ trợ Seo Leader đăng tin nhà cửa, đi link,
					tương tác thành viên trên các diễn đàn, mạng xã hội,…thu hút người
					truy cập website.</p>

				<p>==> Vị trí 2: trợ thủ cho Giám đốc kinh doanh trong việc giới
					thiệu dự án, chăm sóc khách hàng , tiếp nhận và xử lý thông tin
					bằng điện thoại</p>

				<h2>** Yêu cầu công việc:</h2>
				<p>-- Chịu khó, chịu học hỏi, trung thực và nhiệt tình với công việc</p>

				<p>-- Vị trí 2 ưu tiên ứng viên ăn nói lưu loát, sử dụng được ngoại ngữ là 1 lợi thế</p>

				<p>-- Vị trí 1 cần có laptop.</p>

				

				<h2>** Quyền lợi:</h2>
				<p>--Lương thỏa thuận trao đổi khi phỏng vấn.</p>

				
				<p>-- Không yêu cầu kinh nghiệm chuyên sâu, được đào tạo khi làm việc</p>

				
				<p>-- Chế độ thưởng: Thưởng năng lực làm việc + Thưởng lễ tết + Thưởng lương tháng 13.</p>

				
				<p>
					-- Môi trường làm việc chuyên nghiệp, năng động, vui vẻ và có cơ hội thăng tiến.
				</p>

				<h2>Liên Hệ với Chúng Tôi!</h2>
				<p>-- CV nộp về email: ttsfood@gmail.com</p>
				<p>-- Nơi làm việc: 15 đường số 4 P. Thảo Điền, Quận 2, Hồ Chí Minh</p>
				<p>-- Phone ngay nếu cần hỗ trợ: 0909-090-xxx</p>
			</div>

		</div>
	</div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>