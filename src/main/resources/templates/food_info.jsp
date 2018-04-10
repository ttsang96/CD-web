<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.Dao"%>
<%@page import="java.util.Date"%>
<%@page import="model.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/Home_page.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Oswald|Playfair+Display|Roboto"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->


<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>




<title></title>
<style>
.show_full {
	display: block !important;
	cursor: pointer;
}

.hide_detail {
	display: none;
}

.show_less {
	display: none;
}

.filter_bar_fixed {
	position: fixed;
	top: 0%;
	width: 100% !important;
	background: white;
	margin-left: 0px !important;
	z-index: 999;
	height: 40px !important;
	border-bottom: 1px solid gray;
	transition: background-color 0.5s ease;
}

.type_food_option_fixed {
	position: fixed;
	top: 5%;
	left: 0%;
	transition: background-color 0.5s ease;
}

.comment_scroll {
	overflow: auto !important;
}
</style>
</head>
<body style="font-family: Roboto">
	<%
		ArrayList<Food> listFood = Dao.getListFood();
		ArrayList<Comment_box> listFoodComment = Dao.getListComment();
		Dao.updateViewFood(request.getParameter("food_id"));
		String id_food_order = null;
		String id_user = null;
		if(request.getParameter("food_id") != null){
			id_food_order = request.getParameter("food_id").toString();
		}
		if(session.getAttribute("user_webTMDT") == null){
			response.sendRedirect("login_page.jsp");
		}else{
			id_user = session.getAttribute("user_webTMDT").toString();
		}
		for (Food food : listFood) {
			if (food.getId_food().equals(id_food_order)) {
				
				
	%>

	<jsp:include page="header.jsp"></jsp:include>
	<div class="container" style="padding: 0px">
		<jsp:include page="left_menu.jsp"></jsp:include>
		<div class="main_content" style="background: white">
			<div class="Food_order" style="width: 100%; height: 25%;">
				<div class="food_order_info"
					style="height: 20%; background: white; border-bottom: 1px solid black;">
					<table>
						<tr style="height: 30px">
							<td style="width: 800px;"><a
								style="margin-left: 10px; font-size: x-large; font-weight: bold;"><%=food.getName_food()%></a></td>
							<td style="width: 100px;">
								<div class="likefood">
									<%
										if (Dao.isLike(id_user, id_food_order) == false) {
									%>
									<a href="Addlike?id_food_like=<%=  id_food_order%>" style="color: blue"> <img class="likefood_icon"
										alt="thích" src="images/unlikefood.png"> yêu thích món
										ăn này!
									</a>
									
									<%
										}
												if (Dao.isLike(id_user, id_food_order) == true) {
									%>
									<a  style="color: black;text-decoration: none" > <img alt="thích"
										src="images/likefood.png">Đã thích <a style="color: blue" href="Delete_like?id_user=<%=id_user %>&id_food=<%= id_food_order%>">Bỏ thích</a>
									</a>
									
									<%
										}
									%>

								</div>
							</td>
						</tr>
						<tr style="height: 25px">
							<td style="width: 27%; font-size: medium;"><span
								style="margin-left: 10px;">Điểm đánh giá : <%=food.getVote_point()%></span>
							</td>
							<td><a class="vote_food_link" style="display: none">
									Đánh giá món ăn</a> <%
 	if (Dao.isvote(id_user, id_food_order) == false) {
 %>
								<div class="vote_food">
									<a href="Addvote?point=1&id_food=<%=food.getId_food()%>"><img
										class="1_star" alt="" src="images/unvote_icon.png"
										style="margin-right: 3px; height: 25px; width: 25px"></a> <a
										href="Addvote?point=2&id_food=<%=food.getId_food()%>"><img
										class="2_star" alt="" src="images/unvote_icon.png"
										style="margin-right: 3px; height: 25px; width: 25px"></a> <a
										href="Addvote?point=3&id_food=<%=food.getId_food()%>"><img
										class="3_star" alt="" src="images/unvote_icon.png"
										style="margin-right: 3px; height: 25px; width: 25px"></a> <a
										href="Addvote?point=4&id_food=<%=food.getId_food()%>"><img
										class="4_star" alt="" src="images/unvote_icon.png"
										style="margin-right: 3px; height: 25px; width: 25px"></a> <a
										href="Addvote?point=5&id_food=<%=food.getId_food()%>"><img
										class="5_star" alt="" src="images/unvote_icon.png"
										style="margin-right: 3px; height: 25px; width: 25px"></a> <span
										class="vote_guide"
										style="margin-left: 10px; font-size: medium; font-weight: bold;"><--
										Nhấn vào đây để đánh giá!</span>
								</div> <%
 	}
 			if (Dao.isvote(id_user, id_food_order) == true) {
 %> <a style="color: black;text-decoration: none"> Đã đánh giá: </a><%= Dao.getVotePoint(id_user, id_food_order ) %> sao <a style="color: blue" href="Delete_vote?id_user=<%=id_user %>&id_food=<%= id_food_order%>">Đánh giá lại</a>
 
  <%
 	}
 %></td>
						</tr>
						<tr style="height: 27px">
							<td style="width: 50%; font-size: medium; margin-left: 10px"><span
								style="margin-left: 10px;">Người đăng : 
								<%
								if(Dao.getUser_Name(food.getId_owmner()) == null){
									%>
										<a href="#"
									style="color: blue">Ẩn danh <%=food.getId_owmner().substring(3, 10)%></a>
									<% 
								}else{
								%>
								<a href="profile_user.jsp?id_user=<%= food.getId_owmner() %>"
									style="color: blue"><%=Dao.getUser_Name(food.getId_owmner())%></a>
								<%
								}
								%>	
									</span></td>
						</tr>
					</table>
				</div>
				<div class="food_order_image"
					style="height: 80%; background: white; width: 50%; float: left">
					<img alt="images" src="Getfoodimage?your_id=<%=food.getId_food()%>"
						style="width: 452px; height: 300px; margin: 5px;">
				</div>
				<div class="food_order_action"
					style="height: 80%; background: white; width: 50%; float: right;">
					<table style="height: 190px;border-bottom: 1px dotted black">
						<tr style="background: white;">
							<td
								style="width: 200px; height: 220px; border-right: 0.5px solid gray; background: white; vertical-align: top">
								<h3 style="margin-top: 0px; background: black; color: white">Nguyên
									liệu</h3>
								<p style="height: 220px; overflow: auto; margin-right: 2px;"><%=Dao.getMaterialFromID(food.getId_food())%></p>
							</td>
							<td
								style="width: 300px; height: 220px; padding: 0 !important; vertical-align: top">

								<h3 style="margin-top: 0px; background: black; color: white">Mô
									tả</h3>
								<p style="height: 220px; overflow: auto; margin-left: 2px;"><%=food.getDescription_food()%></p>
							</td>


						</tr>
						<%
						if(Dao.isAdministrator(food.getId_owmner())){
							%>
							<tr style="background: white;">
							<td style="width: 200px; height: 30px;">Số lượng <select
								style="width: 100px; margin-left: 5px;" id="quantity_food">
									<option selected="selected" value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
							</select> <input type="text" value="<%=food.getPrice_food()%>"
								id="price_food_1" style="display: none">
							</td>
							<td style="width: 300px; height: 30px;">Giá: <span
								id="price_food"><%=food.getPrice_food()%></span></td>


						</tr>
						<% 
						}
						%>						
					</table>
					<%	
						 id_food_order = food.getId_food();
						if(Dao.isAdministrator(food.getId_owmner())){
							%>
					<button class="btn_order_quantity" style="height: 50px; width: 200px; text-align: center;font-size: large;color: white; background: #F37021">Mua
						ngay</button>
						<% 
						}
						%>
				</div>
			</div>

			<div class="Food_formula"
				style="width: 100%; height: 25%; background: white; border-top: 1px solid black; border-bottom: 1px solid black">
				<div class="food_formula_title"
					style="height: 10%; background: white; width: 100%;">
					<h1 style="margin-top: 0px; background: black; color: white;">Cách
						làm</h1>
				</div>
				<div class="food_formula_image"
					style="height: 90%; background: white; width: 40%; float: left">
					<img alt="images"
						src="Getformulaimage?your_id=<%=Dao.getIDFomularFromFoodID(food.getId_food())%>"
						style="width: 360px; height: 300px; margin: 5px;">
				</div>
				<div class="food_formula_description"
					style="height: 90%; background: white; width: 60%; float: right; overflow: auto">
					<span><%=Dao.getFomularFromID(food.getId_food())%></span>
				</div>
			</div>

			<div class="Food_comment "
				style="width: 100%; height: 49.5%; background: white;">
				<div class="vote_analys"
					style="width: 100%; height: 20%; background: white;">
					<table>
						<tr>
							<td style="width: 300px; vertical-align: top;"><p
									style="text-align: center; height: 30px; margin-top: 0px; font-size: large; font-weight: bold;">Điểm
									đánh giá trung bình</p>
								<div class="food_point" style="width: 40px; height: 40px;">
									<p
										style="width: 40px; height: 40px; border-radius: 100%; background: #03AE03; color: white; line-height: 40px; text-align: center; border: none; cursor: pointer; margin: 1px; margin-left: 100px;">
										<%=food.getVote_point()%>
									</p>

								</div>

								<p
									style="margin-top: 10px; margin-left: 10px; font-size: medium; margin-left: 75px; font-weight: bold;">
									Đánh giá:
									<%=food.getSum_vote()%><br> Yêu thích:
									<%=food.getSum_like()%>
									<br> Bình luận:
									<%=food.getSum_comment()%><br>
								</p></td>
							<td style="width: 800px; font-size: medium; font-weight: bold;">
								<div style="margin-left: 100px;">
									<p style="height: 20px;">
										Đánh giá 5 sao :
										<%=Dao.getSumVote_point(5, food.getId_food())%></p>
									<p style="height: 20px;">
										Đánh giá 4 sao :
										<%=Dao.getSumVote_point(4, food.getId_food())%></p>
									<p style="height: 20px;">
										Đánh giá 3 sao :
										<%=Dao.getSumVote_point(3, food.getId_food())%></p>
									<p style="height: 20px;">
										Đánh giá 2 sao :
										<%=Dao.getSumVote_point(2, food.getId_food())%></p>
									<p style="height: 20px;">
										Đánh giá 1 sao :
										<%=Dao.getSumVote_point(1, food.getId_food())%></p>
								</div>
							</td>


						</tr>

					</table>

				</div>
				<div class="comment_box"
					style="width: 100%; height: 10%; background: silver; border-top: 1px solid black">
					<form action="Comment_food">
						<input type="text" name="food_select" id="id_food_selected"
							value="<%=food.getId_food()%>" style="display: none"> <input
							type="text" placeholder="nhập nội dung bình luận..."
							name="content_message"
							style="height: 80px; width: 80%; margin-left: 10px; margin-top: 3px;">
						<input type="submit" value="Bình luận"
							style="height: 30px; width: 100px; margin-left: 25px;">
					</form>
				</div>


				<div class="comment_dialog"
					style="width: 99%; height: 74%; background: silver; overflow: hidden; border-top: 1px solid black;">
					<%
						int i = 0;
								for (Comment_box comment_box : Dao.getListNewComment()) {

									if (comment_box.getId_food().equals(food.getId_food())) {
										i++;
					%>
					<div class="comment_content"
						style="background: white; margin-top: 2px; height: 95px; width: 100%; border-bottom: 0.5px solid silver;">

						<div style="width: 12%; float: left; height: 95px">
							<img alt=""  src="GetUserImage?your_id=<%= id_user%>" onerror=this.src="images/chief.png"
								style="width: 85px; height: 90px; margin-top: 2px; margin-left: 5px;">
						</div>
						<div style="width: 88%; float: right; height: 90px;">

							<p style="width: 350px; font-weight: bold;">
								người đăng: <a style="color: blue;" href="#"><%=Dao.getUser_Name(comment_box.getId_user())%>
								</a> <span style="margin-left: 20px;"> <%=comment_box.getComment_time()%></span>
							</p>

							<%
								if (comment_box.getComment_on_object().length() > 300) {
							%>
							<span class="comment_showless"
								style="width: 795px; height: 60px;"> <%=comment_box.getComment_on_object().substring(0, 300) + ".."%>
							</span> <span class="detail_comment"
								style="color: blue; cursor: pointer;">Xem thêm</span> <span
								class="comment_showfull"
								style="width: 795px; height: 60px; overflow: auto; display: none">
								<%=comment_box.getComment_on_object()%>

							</span>
							<%
								}
												if (comment_box.getComment_on_object().length() <= 300) {
							%>
							<span class="comment_show" style="width: 795px; height: 60px">
								<%=comment_box.getComment_on_object()%>

							</span>
							<%
								}
							%>

						</div>
					</div>
					<%
						}

								}
								if (i == 0) {
					%>
					<p
						style="text-align: center; margin-top: 100px; font-size: large; font-weight: bold;">
						Chưa có bình luận nào !!!</p>
					<%
						}
					%>
				</div>

			</div>
		</div>
		<%
			}
			}
		%>
		<jsp:include page="right_menu.jsp"></jsp:include>

	</div>
	<jsp:include page="bottom.jsp"></jsp:include>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(

				function() {
					$('.btn_order_quantity').on(
							'click',
							function() {
								window.location = 'Card_servlet?command=insert&food_id=<%= id_food_order%>&quantity='
									+ $('#quantity_food').val() ;
											
							});
					$('.detail_comment').on('click', function() {
						$(this).next().addClass('show_full')
						$(this).addClass('hide_detail')
						$(this).prev().addClass('show_less')

					});
					$('.likefood').on('mouseover', function() {
						$('.likefood_icon').attr("src", "images/likefood.png");

					});
					$('#quantity_food').on(
							'change',
							function() {
								$('#price_food').text(
										parseInt($('#price_food_1').val())
												* parseInt($('#quantity_food')
														.val()));

							});
					$('.likefood').on(
							'mouseout',
							function() {
								$('.likefood_icon').attr("src",
										"images/unlikefood.png");
							});

					$('.1_star').on('mouseover', function() {
						$('.1_star').attr("src", "images/vote_icon.png");
						$('.vote_guide').text("1 sao");

					});
					$('.1_star').on('mouseout', function() {
						$('.1_star').attr("src", "images/unvote_icon.png");
						$('.vote_guide').text("<-- Nhấn vào đây để đánh giá!");
					});
					$('.2_star').on('mouseover', function() {
						$('.1_star').attr("src", "images/vote_icon.png");
						$('.2_star').attr("src", "images/vote_icon.png");
						$('.vote_guide').text("2 sao");
					});
					$('.2_star').on('mouseout', function() {
						$('.1_star').attr("src", "images/unvote_icon.png");
						$('.2_star').attr("src", "images/unvote_icon.png");
						$('.vote_guide').text("<-- Nhấn vào đây để đánh giá!");
					});
					$('.3_star').on('mouseover', function() {
						$('.1_star').attr("src", "images/vote_icon.png");
						$('.2_star').attr("src", "images/vote_icon.png");
						$('.3_star').attr("src", "images/vote_icon.png");
						$('.vote_guide').text("3 sao");

					});
					$('.3_star').on('mouseout', function() {
						$('.1_star').attr("src", "images/unvote_icon.png");
						$('.2_star').attr("src", "images/unvote_icon.png");
						$('.3_star').attr("src", "images/unvote_icon.png");
						$('.vote_guide').text("<-- Nhấn vào đây để đánh giá!");
					});
					$('.4_star').on('mouseover', function() {
						$('.1_star').attr("src", "images/vote_icon.png");
						$('.2_star').attr("src", "images/vote_icon.png");
						$('.3_star').attr("src", "images/vote_icon.png");
						$('.4_star').attr("src", "images/vote_icon.png");
						$('.vote_guide').text("4 sao");

					});
					$('.4_star').on('mouseout', function() {
						$('.1_star').attr("src", "images/unvote_icon.png");
						$('.2_star').attr("src", "images/unvote_icon.png");
						$('.3_star').attr("src", "images/unvote_icon.png");
						$('.4_star').attr("src", "images/unvote_icon.png");
						$('.vote_guide').text("<-- Nhấn vào đây để đánh giá!");
					});
					$('.5_star').on('mouseover', function() {
						$('.1_star').attr("src", "images/vote_icon.png");
						$('.2_star').attr("src", "images/vote_icon.png");
						$('.3_star').attr("src", "images/vote_icon.png");
						$('.4_star').attr("src", "images/vote_icon.png");
						$('.5_star').attr("src", "images/vote_icon.png");
						$('.vote_guide').text("5 sao");

					});
					$('.5_star').on('mouseout', function() {
						$('.1_star').attr("src", "images/unvote_icon.png");
						$('.2_star').attr("src", "images/unvote_icon.png");
						$('.3_star').attr("src", "images/unvote_icon.png");
						$('.4_star').attr("src", "images/unvote_icon.png");
						$('.5_star').attr("src", "images/unvote_icon.png");
						$('.vote_guide').text("<-- Nhấn vào đây để đánh giá!");
					});
					$('.comment_dialog').on('mouseover', function() {
						$('.comment_dialog').addClass("comment_scroll");

					});
					$('.comment_dialog').on('mouseout', function() {
						$('.comment_dialog').removeClass("comment_scroll");

					});

					$('.comment_content').on('click', function() {
						$('.comment_dialog').removeClass("comment_scroll");

					});
					$(window).scroll(function() {
						var height = $(this).scrollTop();
						if (height > 170) {
							$('.ads').addClass('filter_bar_fixed');
						} else {
							$('.ads').removeClass('filter_bar_fixed');
						}
					});
					$(window).scroll(
							function() {
								var height = $(this).scrollTop();
								if (height > 470) {
									$('.type_food_option').addClass(
											'type_food_option_fixed');
								} else {
									$('.type_food_option').removeClass(
											'type_food_option_fixed');
								}
							});

				});
	</script>
</body>
</html>