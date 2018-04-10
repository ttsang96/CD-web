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
<title>Tin tức ẩm thực</title>

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
	max-width: 1170px;
	margin: auto;
	height: 715px;
}

.product {
	width: 23%;
	height: 300px;
	box-shadow: 2px 2px 2px #cdcdcd;
	position: relative;
	overflow: hidden;
	padding: 10px;
	float: left;
}

.tintuc {
	width: 300px;
	height: 100px;
	background: rgba(0, 0, 0, 0.5);
	position: absolute;
	top: 80%;
}

.tintuc p {
	color: #fff;
}

.product:hover .tintuc {
	top: 68%;
	transition: all 1s;
}

.product:hover {
	transition: all 1s;
}

.content h3 {
	padding-left: 10px;
	font-size: 30px;
	font-family: "Roboto", sans-serif;
	color: gray;
}

.nd {
	width: 90%;
	margin: auto;
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
			<h3>Thông tin ẩm thực</h3>
			<div class="product">
				<a href="#"> <img src="img/h1.jpg"></a>
				<div class="tintuc">
					<div class="nd">
						<p style="padding-bottom: 7px;">MÓN NGON MỖI NGÀY</p>
						<p>8 cách làm món khô cực hấp dẫn không thể thiếu trên bàn
							nhậu ngày Tết</p>
					</div>
				</div>
			</div>
			<div class="product">
				<a href="#"> <img src="img/h2.jpg"></a>
				<div class="tintuc">
					<div class="nd">
						<p style="padding-bottom: 7px; padding-top: 10px;">KHÁM PHÁ
							ẨM THỰC</p>
						<p>Những món ăn vặt thống trị năm 2017- Bạn đã chinh phục được
							bao nhiêu món?</p>
					</div>
				</div>
			</div>
			<div class="product">
				<a href="#"> <img src="img/h3.jpg"></a>
				<div class="tintuc">
					<div class="nd">
						<p style="padding-bottom: 7px; padding-top: 10px;">MÓN NGON
							MỖI NGÀY</p>
						<p>Mách bạn cách làm mứt nghệ ngon lạ, đặc sắc trong ngày Tết
							nguyên đán sắp đến</p>
					</div>
				</div>
			</div>
			<div class="product">
				<a href="#"> <img src="img/h4.jpg"></a>
				<div class="tintuc">
					<div class="nd">
						<p style="padding-bottom: 7px; padding-top: 10px;">MÓN NGON
							MỖI NGÀY</p>
						<p>Hướng dẫn 5 cách làm Kim chi đúng chuẩn Hàn Quốc ngay tại
							nhà</p>
					</div>
				</div>
			</div>
			<div class="product">
				<a href="#"> <img src="img/h5.jpg"></a>
				<div class="tintuc">
					<div class="nd">
						<p style="padding-bottom: 7px; padding-top: 10px;">Khám phá
							ẩm thực</p>
						<p>Học ngay 4 cách làm mứt dừa hình hoa đẹp mắt và cực đơn
							giản để ngày Tết thêm vui vẻ</p>
					</div>
				</div>
			</div>
			<div class="product">
				<a href="#"> <img src="img/h6.jpg"></a>
				<div class="tintuc">
					<div class="nd">
						<p style="padding-bottom: 7px; padding-top: 10px;">Khám phá
							ẩm thực</p>
						<p>Cách làm mứt me nguyên trái chua chua ngọt ngọt cho mâm trà
							Tết mừng năm mới</p>
					</div>
				</div>
			</div>
			<div class="product">
				<a href="#"> <img src="img/h7.jpg"></a>
				<div class="tintuc">
					<div class="nd">
						<p style="padding-bottom: 7px; padding-top: 10px;">Khám phá
							ẩm thực</p>
						<p>Bật mí cách làm lạp xưởng tươi ngon và an toàn ngay tại nhà
							để ngày Tết được trọn vẹn hơn</p>
					</div>
				</div>
			</div>
			<div class="product">
				<a href="#"> <img src="img/h8.jpg"></a>
				<div class="tintuc">
					<div class="nd">
						<p style="padding-bottom: 7px; padding-top: 10px;">Khám phá
							ẩm thực</p>
						<p>4 cách nấu lẩu hải sản chua cay nghi ngút khói cho những
							ngày cuối năm thêm ấm cúng</p>
					</div>
				</div>
			</div>

		</div>
	</div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>