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
/* unvisited link */
a:link {
	color: black;
}

/* visited link */
a:visited {
	color: black;
}

/* mouse over link */
a:hover {
	color: blue;
}
</style>
</head>
<body>
		<div class="right_menu">
			<div id="listoption">

				<div class="ads_banner_right"
					style="width: 100%; margin-left: 1%; margin-right: 1%; height: 355px;margin-bottom: 5px">
					<img style="width: 216px; height: 100%" alt="Quảng cáo"
						src="images/banner_food_ads.png">
				</div>
				<div class="ads_banner_right"
					style="width: 100%; margin-left: 1%; margin-right: 1%; height: 313px;margin-bottom: 5px">
					<img style="width: 216px; height: 100%" alt="Quảng cáo"
						src="images/banner_food_ads.png">
				</div>
				

				<div
					style="width: 100%; margin-left: 1%; margin-right: 1%; height: 1095px;background: white; border-bottom: 2px solid black">
					<p
						style="height: 30px; font-weight: bold; font-size: large; text-align: center; color: black; background: yellow">Đề
						xuất</p>
						<%
						ArrayList<Food> listSufferFood = Dao.getListSufferFood();
						for(int i = 0; i <= 4 ; i++ ){
						
						%>
					<div class="food_layout" style="width: 214px;margin-top:1.3px; background: white; height: 215px ; border-bottom: 2px solid black;">
			<div class="food_wallpaper">

				<img style="height: 140px;" class="icon-images" alt="" src="Getfoodimage?your_id=<%= listSufferFood.get(i).getId_food()%>">
				<%
						if(Dao.isAdministrator(listSufferFood.get(i).getId_owmner())){
						%>
				 <span
					class="btn_order "><button class="btn_oder_action" style="width: 113px" ><a style="color: black"
							href="Card_servlet?command=insert&&food_id=<%=listSufferFood.get(i).getId_food()%>">Đặt
							Giao Hàng</a></button></span>
							<%
						}
							%>

			</div>
			<div class="food_infor">
				<div class="food_point" style="height: 35px; width: 35px;">
					<p style="height: 35px; width: 35px; line-height: 35px;"><%= listSufferFood.get(i).getVote_point() %></p>

				</div>

				<div class="food_info_layout">
					<div class="food_name" style="width: 164px; font-size: small;">
						<a href="food_info.jsp?food_id=<%= listSufferFood.get(i).getId_food()%>"><%= listSufferFood.get(i).getName_food() %></a>
					</div>
					<div class="food_description" >
						<p style="width: 164px; font-size: x-small;">
							<%
							if (listSufferFood.get(i).getDescription_food().length()== 0) {
								out.print("món này ngon tuyệt với!!!");
							}
							if (listSufferFood.get(i).getDescription_food().length()<= 60) {
				out.print(listSufferFood.get(i).getDescription_food());
			}
						if (listSufferFood.get(i).getDescription_food().length()> 65) {
							out.print(listSufferFood.get(i).getDescription_food().substring(0,65) + "...");
						}
			%>
						</p>
					</div>
				</div>

			</div>
			

		</div>
			<%
						}
			%>	

				</div>

			</div>

		</div>

<script>
		$(document).ready(
				function() {

					
					$('#btn_add_menu').on('click', function() {
						$('#dialog-add-menu').css('display', 'block');
						$('#dialog-update-menu').css('display', 'none');
					});
					

				});
	</script>
</body>
</html>