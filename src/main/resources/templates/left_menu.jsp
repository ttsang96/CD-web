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
<style type="text/css">
#listoption a:hover{
	font-size: x-large;
	background: white!important;
	
	}
</style>
</head>
<body>

	<div class="Left_menu" style="background: silver">
		<div class="type_food_option" id="listoption"
			style="text-align: left; background: silver;font-weight: bold;font-size: medium;">
			<p
				style="background: black; color: silver; text-align: center; font-size: large; height: 35px; font-weight: bold; padding-top: 10px">Danh
				mục</p>
			<table>
				<tr height="35px">
					<td style="width: 200px;"><a href="new_food.jsp"
							style="width: 100%; height: 40px; text-align: left; background: silver;color: black;text-decoration: none">Món
							ăn mới</a></td>

				</tr>
				<tr height="35px">
					<td style="width: 200px;"><a href="more_order.jsp"
							style="width: 100%; height: 40px; text-align: left; background: silver;color: black;text-decoration: none">Đăt
							hàng nhiều</a></td>


				</tr>
				<tr height="35px">
					<td style="width: 200px;"><a href="more_view.jsp"
							style="width: 100%; height: 40px; text-align: left; background: silver;color: black;text-decoration: none">Quan
							tâm nhiều</a></td>

				</tr>
				<tr height="35px">
					<td style="width: 200px;"><a href="more_comment.jsp"
							style="width: 100%; height: 40px; text-align: left; background: silver;color: black;text-decoration: none">Bình
							luận nhiều</a></td>


				</tr>
				<tr height="35px">
					<td style="width: 200px;"><a href="more_like.jsp"
							style="width: 100%; height: 40px; text-align: left; background: silver;color: black;text-decoration: none">Yêu
							thích nhiều</a></td>

				</tr>
				<tr height="35px">
					<td style="width: 200px;"><a href="more_point.jsp"
							style="width: 100%; height: 40px; text-align: left; background: silver;color: black;text-decoration: none">Đánh
							giá cao</a></td>
				</tr>
				

			</table>


		</div>

	</div>

</body>
</html>