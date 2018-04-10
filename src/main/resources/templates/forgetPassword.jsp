<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Đăng nhập hệ thống</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet">
</head>

<body>
	<div class="container" style="width: 500px; height: 600px; background: silver; margin-left: 450px">
		<h1 style="background: #183544; margin-top: -0px; color: white;width: 500px; margin-left: 0px;">
			<a href="new_food.jsp"
				style="text-decoration: none; margin-left: 20px;color: white">TTS Food</a>
		</h1>
		<div style="background: #F2F2F2;width: 400px; height: 300px; margin-left: 50px; border: 0.2px solid gray;margin-top: -20px">
		
		
							<h2 class="n1" style="text-align: center">Quên mật khẩu</h2>	
							<p style="text-align: center">Nhập địa chỉ email để tiếp tục lấy lại mật khẩu!</p>																													
							<form method="post" action="Resetpassword">
								<div class="fa fa-user" style="color: #cdcdcd; padding-left: 10px; font-size: 15px"><input type="text" name="email_reset_password" placeholder="Địa chỉ email" style="height: 30px; margin-left: 40px;width: 300px"><br>
								</div>																		
								<br>
								
								<input type="submit"  value="Xác nhận" style="height: 30px; margin-left: 60px;width: 300px;margin-top: 10px;background: #0495BA">
							</form>
							
							<div class="footer-login" style="height: 30px; margin-left: 120px;width: 300px;margin-top: 30px">
								Chưa có tài khoản?<a href="register_page.jsp"><ins>Đăng
										kí</ins></a>
		</div>
		</div>
		</div>	
				
</body>
</html>