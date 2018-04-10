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
<div class="container" style="width: 650px; height: 600px; background: silver; margin-left: 450px">
		<h1 style="background: #183544; margin-top: -0px; color: white;width: 650px; margin-left: 0px;">
			<a href="new_food.jsp"
				style="text-decoration: none; margin-left: 20px;color: white">TTS Food</a>
		</h1>
		<div style="background: #F2F2F2;width: 550px; height: 500px; margin-left: 50px; border: 0.2px solid gray;margin-top: -20px">
		
		
							<h2 class="n1" style="text-align: center">Chi tiết món ăn</h2>																														
							<form method="post" action="Add_formula_request">
							<input type="text" name="Nameformula" placeholder="tên món ăn.." style="height: 30px; margin-left: 40px;width: 474px">
								<%
											if (request.getSession().getAttribute("namef_err") != null) {
												out.print("<font style='margin-left: 40px;' color=\"red\">" + (String) request.getSession().getAttribute("namef_err") + "</font");
											}
	
								%>
								<br>
								<input type="text" name="SDT" placeholder="số điện thoại liên lạc.." style="height: 30px; margin-left: 40px;width: 474px">
								<%
											if (request.getSession().getAttribute("SDT_err") != null) {
												out.print("<font style='margin-left: 40px;' color=\"red\">" + (String) request.getSession().getAttribute("SDT_err") + "</font");
											}
										%>	
								<br>											
								<textarea rows="17" cols="65"  name="Descriptionformula" placeholder="mô tả cách làm món ăn"  style="margin-left: 40px;margin-top: 10px;resize: none"></textarea>
								<%
											if (request.getSession().getAttribute("desF_err") != null) {
												out.print("<font style='margin-left: 40px;' color=\"red\">" + (String) request.getSession().getAttribute("desF_err") + "</font");
											}
										%>
								
								
								
								
								<br>
								
								<input type="submit"  value="Đặt hàng" style="height: 30px; margin-left: 370px;width: 150px;margin-top: -10px;background: #0495BA">
							</form>
							
							
		</div>
		<a href="new_food.jsp" style="margin-left: 320px; font-size: medium;margin-top: 30px;">Trang chủ</a>
		</div>	
<%
request.getSession().setAttribute("desF_err", null);
request.getSession().setAttribute("SDT_err", null);
request.getSession().setAttribute("namef_err", null);
%>	

</body>
</html>