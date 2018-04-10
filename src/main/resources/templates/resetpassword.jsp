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
				String passtmp = request.getParameter("reset_pass");
				if(passtmp==null){
					passtmp = "pass";
				}
				String email = request.getParameter("email");
				if(email==null){
					email = "email";
				}
				if(!(Dao.CheckLogin(email,passtmp))){
					response.sendRedirect("login_page.jsp");
				}else{
					
				
%>
<div class="container" style="width: 500px; height: 600px; background: silver; margin-left: 450px">
		<h1 style="background: #183544; margin-top: -0px; color: white;width: 500px; margin-left: 0px;">
			<a href="new_food.jsp"
				style="text-decoration: none; margin-left: 20px;color: white">TTS Food</a>
		</h1>
		<div style="background: #F2F2F2;width: 400px; height: 350px; margin-left: 50px; border: 0.2px solid gray;margin-top: -20px">
		
		
							<h2 class="n1" style="text-align: center">Đổi mật khẩu</h2>																														
							<form method="post" action="Change_password">
							<input type="text" name="email_user_reset" value="<%= email %>"  style="height: 30px; margin-left: 40px;width: 300px;display: none">
								<div class="fa fa-user" style="color: #cdcdcd; padding-left: 10px; font-size: 15px"><input type="password" name="password_reset" placeholder="Nhập mật khẩu mới" style="height: 30px; margin-left: 40px;width: 300px"><br>
								</div>	
									<%
											if (request.getSession().getAttribute("password_reset_err") != null) {
												out.print("<font color=\"red\">" + (String) request.getSession().getAttribute("password_reset_err") + "</font");
											}
										%>												
								<div class="fa fa-user" style="color: #cdcdcd; padding-left: 10px; font-size: 15px"><input type="password" name="repassword_reset" placeholder="Nhập lại mật khẩu mới" style="height: 30px; margin-left: 40px;width: 300px;margin-top: 10px"><br>
								
								</div>
								<%
											if (request.getSession().getAttribute("repassword_reset_err") != null) {
												out.print("<font color=\"red\">" + (String) request.getSession().getAttribute("repassword_reset_err") + "</font");
											}
										%>
								
								
								
								<br>
								
								<input type="submit"  value="Xác nhận" style="height: 30px; margin-left: 60px;width: 300px;margin-top: 10px;background: #0495BA">
							</form>
							
							
		</div>
		</div>	
	
<%
				}
			request.getSession().setAttribute("password_reset_err", null);
			request.getSession().setAttribute("repassword_reset_err", null);
			%>	
</body>
</html>