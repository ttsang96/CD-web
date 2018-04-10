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
<%
ArrayList<Category> listLH = Dao.getListCategory();
%>
	<div class="footer" style="background: silver; color: white; font-weight: bold;">
	<div class="actions" style="width: 290px; height: 100%; float: left; margin-left: 210px;text-align: center;font-size: medium;">
	<h4 style="background: #b72309;height: 30px">Tác vụ</h4>
	<p style="margin-top: 15px"><a href="#" class="scrolltop" style="text-decoration: none;color: black">Đầu trang</a></p>
	<p style="margin-top: 15px"><a  href="#"  style="text-decoration: none;color: black">Trang chủ</a></p>
	<p style="margin-top: 15px"><a  href="nguyenlieu.jsp"  style="text-decoration: none;color: black">Nguyên liệu</a></p>
	<p style="margin-top: 15px"><a  href="noiqui.jsp" style="text-decoration: none;color: black">Quy định</a></p>
	<p style="margin-top: 15px"><a href="tuyendung.jsp"  style="text-decoration: none;color: black">Tuyển dụng</a></p>
	<p style="margin-top: 15px"><a  href="tintuc.jsp" style="text-decoration: none;color: black">Tin tức</a></p>
	<p style="margin-top: 15px"><a  href="Logout"  style="text-decoration: none;color: black">Đăng xuất</a></p>
	
	</div>
	<div class="join_me" style="width: 300px; height: 100%; float: left; margin-left: 20px;text-align: center;font-size: medium;">
	<h4 style="background: #b72309;height: 30px">Khám phá</h4>
	<%
	for(int i = 0; i < 9 ;i++ ){
		%>
		<p style="margin-top: 10px"><a href="filter_page.jsp?phase_filter=<%= listLH.get(i).getId_category()%>"  style="text-decoration: none;color: black"><%= listLH.get(i).getName_category() %></a></p>
	<% 
	}
	%>
	
	
	</div>
	<div class="category_bottom" style="width: 290px; height: 100%; float: left; margin-left: 20px;text-align: center;font-size: medium;">
	<h4 style="background: #b72309;height: 30px">Kết nối với chúng tôi</h4>
	<p style="margin-top: 20px"><a href="#" style="text-decoration: none;color: black">Facebook</a></p>
	<p style="margin-top: 20px"><a  href="#"  style="text-decoration: none;color: black">Youtube</a></p>
	<p style="margin-top: 20px"><a  href="#"  style="text-decoration: none;color: black">Twiter</a></p>
	<p style="margin-top: 20px"><a  href="#"  style="text-decoration: none;color: black">Google</a></p>
	<p style="margin-top: 20px"><a  href="#"  style="text-decoration: none;color: black">Instagram</a></p>
	</div>
	
	
	</div>
<script>
		$(document).ready(
				function() {
					$('.scrolltop').on('click',
					function() {
						window.scrollTo(0, 0);
					});
				});
		</script>
</body>
</html>