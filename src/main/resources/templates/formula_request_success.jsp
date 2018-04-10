<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="dao.Dao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Đặt lại mật khẩu</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet">
</head>

<body>
<%
if(session.getAttribute("user_webTMDT") == null){
	response.sendRedirect("login_page.jsp");
}
%>
<div class="container" style="width: 650px; height: 200px; background: silver; margin-left: 450px">
		<h1 style="background: #183544; margin-top: -0px; color: white;width: 650px; margin-left: 0px;">
			<a href="new_food.jsp"
				style="text-decoration: none; margin-left: 20px;color: white">TTS Food</a>
		</h1>
		<div style="background: #F2F2F2;width: 550px; height: 100px; margin-left: 50px; border: 0.2px solid gray;margin-top: -20px">
		<div style=" margin-top: 30px; " >
		<span style="color: green; margin-left: 60px;">Đăt món ăn thành công, nhân viên của chúng tôi sẽ liên lạc ngay</span>
		</div>					
							
							
		</div>
		
		<a href="new_food.jsp" style="margin-left: 320px; font-size: medium;margin-top: 30px;">Trang chủ</a>
		</div>	
	

</body>
</html>