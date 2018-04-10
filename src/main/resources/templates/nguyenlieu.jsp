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
<title>Nguồn nguyên liệu</title>

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
				<h1>Nguồn nguyên liệu của TTSFood</h1>

				<h2>TTSFood có nhà cung cấp chất lượng</h2>
				<h2>YÊU CẦU NGUYÊN LIỆU CHẤT LƯỢNG</h2>
				<p>Tất cả những nhà hàng của McDonald's chỉ lấy các sản phẩm tốt
					nhất từ các nhà cung cấp chọn lọc. Những nhà cung cấp này được yêu
					cầu phải tuân theo các tiêu chuẩn nghiêm ngặt để chuẩn bị các
					nguyên liệu thực phẩm thật chất lượng và hợp vệ sinh.</p>

				<p>Chúng tôi hiểu rằng thức ăn ngon nhất chỉ có thể được làm từ
					nguyên liệu thực phẩm chất lượng cao nhất. McDonald's luôn duy trì
					chính sách kiểm soát chất lượng nghiêm ngặt đối với tất cả các
					nguyên liệu, từ rau củ cho đến các động vật chăn nuôi, bao gồm heo,
					bò và gà.</p>

				<h2>Rau củ</h2>
				<p>Thường xuyên kiểm tra độ tươi và chất lượng</p>

				<p>Được chăm sóc với lượng phân bón phù hợp và chỉ sử dụng các
					loại thuốc trừ sâu được phép
				<p>Thường xuyên kiểm tra nồng độ vi khuẩn</p>

				<h2>Động vật chăn nuôi</h2>
				<p>Các trang trại được giữ sạch sẽ rất cẩn thận, đầy đủ ánh
					sáng, thông gió và ở nhiệt độ luôn được kiểm soát</p>

				<p>Luôn đảm bảo có nguồn nước sạch và thức ăn sạch</p>

				<p>Thức ăn phải được đựng trong máng ăn để tránh ô nhiễm</p>

				<p>Từ chăn nuôi đến vận chuyển, chỉ có các nhân viên đã được đào
					tạo mới có thể được phép thực hiện các công việc này</p>


				<h2>YÊU CẦU THỦ TỤC NGHIÊM NGẶT</h2>
				<p>Việc đảm bảo các thủ tục chặt chẽ và nghiêm ngặt sẽ tạo nên
					sản phẩm có chất lượng tốt nhất. Sự giám sát khắt khe trong từng
					bước quy trình sẽ đảm bảo độ tươi và vệ sinh an toàn thực phẩm.</p>

				<h2>Kiểm soát chất lượng</h2>
				<p>Chỉ những nguyên liệu tươi tốt nhất mới được sử dụng .</p>


				<p>Nhiệt độ và thời gian được kiểm soát chặt chẽ trong suốt quá
					trình sản xuất</p>


				<p>Tuân thủ các tiêu chẩn về vi sinh</p>
				<p>Chương trình Effective Hazard Analysis and Critical Control
					Point (HACCP) and Good Manufacturing Practice (GMP) được áp dụng và
					tất cả các nhân viên đều được đào tạo</p>
				<h2>Qui trình</h2>
				<p>Tất cả những sản phẩm của TTS, từ việc lựa chọn nguyên
					liệu cho đến chuẩn bị và chế biến, đều tuân thủ theo những tiêu
					chuẩn chất lượng về an toàn thực phẩm. Các thủ tục được giám sát
					một cách cẩn thận và tỉ mỉ để đảm bảo rằng thức ăn mà chúng tôi
					phục vụ là ngon với chất lượng tốt nhất.</p>
			</div>

		</div>
	</div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>