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




<title></title>
<style>
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
/* unvisited link */
.food_layout a:link {
	color: black;
	text-decoration: none;
}

/* visited link */
.food_layout a:visited {
	color: black;
}

/* mouse over link */
.food_layout a:hover {
	color: blue;
}
/* unvisited link */
 .homepade_devider a:link {
	color: white;
	text-decoration: none;
}

/* visited link */
 .homepade_devider a:visited {
	color: white;
}

/* mouse over link */
 .homepade_devider a:hover {
	color: blue;
}
</style>
</head>
<body>
	<%
		ArrayList<Category> listLH = Dao.getListCategory();
		ArrayList<Food> listFood_View = Dao.getListView_food();
		if(session.getAttribute("user_webTMDT") == null){
			response.sendRedirect("login_page.jsp");
		}
	%>
<jsp:include page="header.jsp"></jsp:include>
	<div class="container" style="padding: 0px">
		<jsp:include page="left_menu.jsp"></jsp:include>

	<div class="main_content" style="height: 1760px;">


		<h1
			style="text-align: center; background: black; color: white; font-weight: bolder;">Món ăn
			được xem nhiều</h1>

		<%
			int page_number = 1;
			if (request.getParameter("page") != null) {
				page_number = Integer.parseInt(request.getParameter("page").toString());
			}
			
			int val_end = page_number * 18;
			int val_start = val_end - 18;
			int tmp = 0;
			if ((val_end > listFood_View.size())) {
				tmp = val_end - listFood_View.size();
			}
			
			for (int i = val_start; i < val_end - tmp; i++) {
				listFood_View.get(i).setSum_like(Dao.sumLike(listFood_View.get(i).getId_food()));
				listFood_View.get(i).setSum_comment(Dao.sumComment(listFood_View.get(i).getId_food()));
				listFood_View.get(i).setSum_vote(Dao.sumVote(listFood_View.get(i).getId_food()));
				listFood_View.get(i).setVote_point(Dao.computeVotePoint(listFood_View.get(i).getId_food()));
		%>

		<div class="food_layout">
			<div class="food_wallpaper">

				<img class="icon-images" alt=""
					src="Getfoodimage?your_id=<%=listFood_View.get(i).getId_food()%>">
					<%
						if(Dao.isAdministrator(listFood_View.get(i).getId_owmner())){
						%>
				<span class="btn_order "><button class="btn_oder_action"
						>	
						<a style="color: black"
							href="Card_servlet?command=insert&&food_id=<%=listFood_View.get(i).getId_food()%>">Đặt
							Giao Hàng</a></button></span>
							<%
						}
							%>

			</div>
			<div class="food_infor">
				<div class="food_point">
					<p><%=listFood_View.get(i).getVote_point()%></p>

				</div>

				<div class="food_info_layout">
					<div class="food_name">
						<a
							href="food_info.jsp?food_id=<%= listFood_View.get(i).getId_food()%>"><%=listFood_View.get(i).getName_food()%></a>
					</div>
					<div class="food_description">
						<p>
							<%
								if (listFood_View.get(i).getDescription_food().length() == 0) {
										out.print("món này ngon tuyệt với!!!");
									}
									if (listFood_View.get(i).getDescription_food().length() <= 100) {
										out.print(listFood_View.get(i).getDescription_food());
									}
									if (listFood_View.get(i).getDescription_food().length() > 100) {
										out.print(listFood_View.get(i).getDescription_food().substring(0, 100) + "...");
									}
							%>
						</p>
					</div>
				</div>

			</div>
			<div class="food_interac">
				<i class="fa fa-commenting-o" aria-hidden="true"><span
					class="num_interac"><%=listFood_View.get(i).getSum_comment()%></span>
				</i> <i class="fa fa-thumbs-o-up" aria-hidden="true"> <span
					class="num_interac"><%=listFood_View.get(i).getSum_like()%></span></i> <i
					class="fa fa-eye" aria-hidden="true"> <span class="num_interac"><%=listFood_View.get(i).getSum_view()%></span></i>
			</div>

		</div>

		<%
			}
		%>




<div class="homepade_devider"
		style="background: black;color: white; float: left; margin-left: 0.1%; margin-right: 0.1%; padding: 10px; font-size: larger; font-weight: bold; width: 100%; height: 18px; text-align: center;">
<%
	if(listFood_View.size()<=10){
		%>
		<a href="more_view.jsp">Trở về</a>
		<% 
	}
	if(listFood_View.size()>10){
	%>
		<span>Trang: </span>
		<%
			for (int i = 0; i < (listFood_View.size() / 10); i++) {
				out.print("<a style='padding-right: 7px ; ' href='more_view.jsp?page="+(i + 1)+"'>"
						+ (i + 1) + "</a>");
			}
	}
		%>

	</div>

	</div>
	<jsp:include page="right_menu.jsp"></jsp:include>

	</div>
	<jsp:include page="bottom.jsp"></jsp:include>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(

				function() {
					
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