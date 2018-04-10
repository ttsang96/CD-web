<%@page import="model.Food"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.Dao"%>
<%@page import="model.*"%>
<%@page import="java.util.StringTokenizer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/Home_page.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Trang cá nhân</title>
</head>
<body style="height: auto">
	<%
	String id_user = null;
	if(session.getAttribute("user_webTMDT") == null){
		response.sendRedirect("login_page.jsp");
			}else{
				id_user = session.getAttribute("user_webTMDT").toString();
			}
		ArrayList<Food> listfood_like = Dao.getListFood_Like(id_user);
		ArrayList<Food> listfood = Dao.getListFood();
		ArrayList<Category> listLH = Dao.getListCategory();
		//String password_old = Dao.getPasswordToReset(Dao.getEmail_User("id_user"));
		ArrayList<Order_info> listOrder = Dao.getOrderInfo(id_user);
		ArrayList<Food> listUserFormula = Dao.getUserFormula(id_user);
	%>
	<div
		style="width: 800px; height: auto; border-left: 0.5px solid black; border-right: 0.5px solid black; margin-left: 280px; float: left;">
<h1 style="background: #183544; margin-top: -0px; color: white;">
			<a href="new_food.jsp"
				style="text-decoration: none; margin-left: 20px;color: white">TTS Food</a>
		</h1>

		<div class="left_menu_profile"
			style="width: 225px; height: auto; background: silver; margin-top: 0px; float: left; position: fixed;">
			<div
				style="height: 100px; margin-left: 5px; background: white; width: 215px">
				<div
					style="width: 90px; height: 100px; margin-left: -5px; float: left">
					<img alt="" src="GetUserImage?your_id=<%= id_user%>" onerror=this.src="images/chief.png"	
					style="width: 90px; height: 100px;">
				</div>
				<div
					style="width: 120px; height: 100px; margin-left: 3px; float: left; font-size: medium;">
					<p style="margin-top: 15px"><%= Dao.getUser_Name(id_user) %></p>
					<p style="margin-top: 10px;font-size: small;"><%= Dao.getEmail_User(id_user) %></p>
					<p style="margin-top: 10px; display: none">
						<a href="#" style="color: blue; font-size: small;">Thay ảnh
							đại diện</a>
					</p>
					<p style="margin-top: 5px;">Giới tính: <%= Dao.getGenderUser(id_user) %></p>
				</div>


			</div>
			<div
				style="background: white; width: 214px; height: 245px; margin-left: 5px; margin-top: 10px; float: none; padding: 0.5px">
				<p style="margin-left: 2px; margin-top: 15px;">
					<a class="dialog_foodlike" href="#" style="color: blue">Món ăn
						yêu thích</a>
				</p>
				<p style="margin-left: 2px; margin-top: 15px;">
					<a class="dialog_foodformula" href="#" style="color: blue">Công
						thức của tôi</a>
				</p>
				<p style="margin-left: 2px; margin-top: 15px;">
					<a class="dialog_foodadd" href="#" style="color: blue">Thêm
						công thức</a>
				</p>
				<p style="margin-left: 2px; margin-top: 15px;">
					<a class="dialog_orderhistory" href="#" style="color: blue">Lịch
						sử Đơn hàng</a>
				</p>

				<p style="margin-left: 2px; margin-top: 15px;">
					<a class="dialog_profile" href="#" style="color: blue">Chỉnh
						sửa thông tin</a>
				</p>
				<p style="margin-left: 2px; margin-top: 15px;">
					<a class="dialog_password" href="ChangePassword_user.jsp?success=not" style="color: blue">Đổi mật
						khẩu</a>
				</p>
			</div>
			<div
				style="background: white; width: 214px; height: 240px; margin-left: 5px; margin-top: 10px; float: none;">
				<h1
					style="text-align: center; font-weight: bold; background: yellow">
					Thống kê</h1>

				<p style="margin-left: 3px; margin-top: 15px">
					Món ăn yêu thích:
					<%=listfood_like.size()%>
				</p>
				<p style="margin-left: 3px; margin-top: 15px">
					Công thức của tôi:
					<%=Dao.getsumFood_user(id_user)%>
				</p>
				<p
					style="margin-left: 3px; margin-top: 15px; background: black; color: white; text-align: center;">
					Thời gian tham gia</p>

				<p ><a href="new_food.jsp" style="margin-left: 70px;font-size: medium;">Trang chủ</a></p>
			</div>

		</div>
		<div
			style="background: white; float: right; width: 565px; height: auto; margin-top: 0px; margin-right: 5px">
			<div id="order_history" style="height: 600px;display: none">
		<h3 style="background: black; color: white">Lịch sử đơn hàng</h3>
		<%
		if(listOrder.size()==0){
		%>
		<hr>
		<p style="margin-top: 50px;width: 100%; text-align: center;font-size: large;"> Chưa có đơn hàng nào!</p>
		<%
		}
		else{
		%>
		<table class="table  table-hover" style="display: block; width: 600px">
		<%
		int num=1;
		String info_cart = ",";
		for(Order_info order_info : listOrder){
			
			Card_info card_info = Dao.getCart_info(order_info.getId_oder_info());
			
		%>
			
			
		<tr style="font-size: small;background: silver; font-weight: bold;border: 0.5px solid gray">
		<td style="width: 5%"><%= num %></td>
		<td style="width: 30%">Đơn hàng: <%= order_info.getId_oder_info() %></td>
		<td style="width: 45%"><%= Dao.getDetail_Cart(card_info.getId_order()) %></td>
		<td style="width: 20%"><%= Dao.getinfo_statusorder(order_info.getStatus_order()) %></td>
		</tr>
		
			<% 
			num++;
				
		}
		}
		%>
		</table >
		</div>
		<div id="info_user_change" style="height: 600px;display: none">
		<form method="post" action="Update_avarta" enctype="multipart/form-data">
					<h3 style="text-align: center;margin-top: 0px;background: black; color: white">Chỉnh sửa thông tin</h3>
					<table class="addfood"
						style="height: 210px; background: white; width: 500px; margin-left: 35px;margin-top: -10px">
						
						<tr>
							<td class="title-col" style="width: 90px">Tên</td>
							<td class="content-col"><input type="text"
								style="width: 370px; height: 40px" name="Lastname" 
								value="<%= Dao.getLast_Name(id_user) %>"
								>
								</td>
						</tr>
						<tr>
							<td class="title-col" style="width: 90px">Họ</td>
							<td class="content-col"><input type="text"
								style="width: 370px;height: 40px" name="Firstname"
								value="<%= Dao.getFirst_Name(id_user) %>"
								>
								</td>
						</tr>
						<tr>
							<td class="title-col" style="width: 90px">Ảnh đại diện</td>
							<td class="content-col" id="image_selected"
								style="height: 50px;">
								<img
						 onerror=this.src="images/chief.png" src="GetUserImage?your_id=<%= id_user%>" style="width: 90px; height: 100px;"> <a id="change_image" href="#">Thay
							đổi?</a></td>
								
					<td class="content-col" id="image_update" style="display: none"><input
						type="file" accept="image/*" name="avarta_user"> <a
						id="cancel_change" href="#">Hoàn tác!</a></td>

						</tr>


						<tr>
							<td class="title-col" style="width: 90px">giới tính</td>
							<td class="content-col"><select name="gender_update" class="gender_update"
								style="width: 370px;height: 40px">
									<option value="1">Nam</option>
									<option value="0">nử</option>

							</select></td>
						</tr>
						
						</table>
						<div id="dialog-option-food" style="margin-top: 10px;">
						<button class="btn-success" style="margin-left: 420px;width: 70px">Cập nhật</button>
					</div>
						</form>
						
		
		</div>
		<div id="dialog-add-food" style="background: white; height: 600px;display: none">


				<form method="post" action="Addfood_user" enctype="multipart/form-data">
					<h1 style="text-align: center;margin-top: 0px ;background: black; color: white">Thông tin món ăn</h1>
					<table class="addfood"
						style="height: 510px; background: white; width: 500px; margin-left: 35px;margin-top: -10px">
						
						<tr>
							<td class="title-col">Tên món ăn</td>
							<td class="content-col"><input type="text"
								style="width: 370px" name="name" placeholder="tên món ăn.."
								>
								</td>
						</tr>
						<tr>
							<td class="title-col">Hình ảnh</td>
							<td class="content-col" id="image_food_update"
								style="height: 50px;"><input type="file"
								accept="image/*" name="image_food"></td>

						</tr>


						<tr>
							<td class="title-col">Loại hình</td>
							<td class="content-col"><select name="category" class="err"
								style="width: 370px">
									<%
										for (Category category : listLH) {
													out.print("<option  value='" + category.getId_category() + "'>" + category.getName_category()
															+ "</option>");
												}
									%>

							</select></td>
						</tr>
						<tr>
							<td class="title-col">Mô tả</td>
							<td class="content-col"><textarea rows="4" id="mota"
									cols="50" name="description"
									placeholder="mô tả chi tiết về món ăn..." style=" resize: none;"></textarea></td>
						</tr>

						

						<tr>
							<td class="title-col">Nguyên liệu</td>
							<td class="content-col"><input type="text" name="id_material" style="display: none">
							<textarea rows="4" cols="50"
									name="material" placeholder="Nguyên liệu nấu ăn..." style=" resize: none;"></textarea></td>
						</tr>
						
						<tr>
							<td class="title-col">Cách làm</td>
							<td class="content-col"><input type="text" name="id_stepcook"  style="display: none">
							<textarea rows="8" cols="50"
									name="fomular" placeholder=" cách làm món ăn..." style=" resize: none;"></textarea></td>
						</tr>
						<tr>
							<td class="title-col">Hình ảnh</td>
							<td class="content-col" id="image_formula_update"
								style="height: 50px"><input type="file"
								accept="image/*" name="image_fomular"> </td>

						</tr>
					

					</table>
					<div id="dialog-option-food" style="margin-top: 10px;">
						<button class="btn-success" style="margin-left: 420px;width: 65px">Thêm</button>
					</div>
				</form>

			</div>
			<div class="foods_like" style="width: 565px;height: auto;background: white;display: none">
		<h1 style="text-align: center;margin-top: 0px;background: black;color: white">Món ăn yêu thích</h1>
		<%
		if(listfood_like.size()==0){
			%>
			<p style="text-align: center; font-size: medium">Không có món ăn nào</p>
			<% 
		}else{
		%>
			<% 
			for (int i = 0; i < listfood_like.size(); i++) {
				
		%>
			<div class="food_layout" style="width: 280px">
			<div class="food_wallpaper">

				<img class="icon-images" alt=""
					src="Getfoodimage?your_id=<%=listfood_like.get(i).getId_food()%>">
					<%
						if(Dao.isAdministrator(listfood_like.get(i).getId_owmner())){
						%>
				<span class="btn_order "><button class="btn_oder_action">
						<a style="color: black"
							href="Card_servlet?command=insert&food_id=<%=listfood_like.get(i).getId_food()%>">Đặt
							Giao Hàng</a>
					</button></span>
					<%
						}
					%>
			</div>
			<div class="food_infor">
				<div class="food_point">
					<p><%=listfood_like.get(i).getVote_point()%></p>

				</div>

				<div class="food_info_layout">
					<div class="food_name" style="width: 230px">
						<a 
							href="food_info.jsp?food_id=<%=listfood_like.get(i).getId_food()%>"><%=listfood_like.get(i).getName_food()%></a>
					</div>
					<div class="food_description" style="width: 240px">
						<p style="width: 230px">
							<%
								if (listfood_like.get(i).getDescription_food().length() == 0) {
										out.print("món này ngon tuyệt với!!!");
									}
									if (listfood_like.get(i).getDescription_food().length() <= 100) {
										out.print(listfood_like.get(i).getDescription_food());
									}
									if (listfood_like.get(i).getDescription_food().length() > 100) {
										out.print(listfood_like.get(i).getDescription_food().substring(0, 100) + "...");
									}
							%>
						</p>
					</div>
				</div>

			</div>
			<div class="food_interac">
				<i class="fa fa-commenting-o" aria-hidden="true"><span
					class="num_interac"><%=listfood_like.get(i).getSum_comment()%></span>
				</i> <i class="fa fa-thumbs-o-up" aria-hidden="true"> <span
					class="num_interac"><%=listfood_like.get(i).getSum_like()%></span></i> <i
					class="fa fa-eye" aria-hidden="true"> <span class="num_interac"><%=listfood_like.get(i).getSum_view()%></span></i>
			</div>

		</div>
		<%
			}
		}
		%>
		</div>
		<div class="foods_formula" style="width: 565px;height: auto;background: white;display: none">
		<h1 style="text-align: center;margin-top: 0px;background: black;color: white">Công thức của tôi</h1>
		<%
		if(listUserFormula.size()==0){
			%>
			<p style="text-align: center;font-size: large;">chưa có công thức nào!</p>
			<% 
		}else{
		%>
			<% 
			for (Food food : listUserFormula) {
				
		%>
		<div style="width: 500px">
			<div class="food_layout" style="width: 360px;float: left">
			<div class="food_wallpaper">

				<img class="icon-images" alt=""
					src="Getfoodimage?your_id=<%=food.getId_food()%>">

			</div>
			<div class="food_infor">
				<div class="food_point">
					<p><%=food.getVote_point()%></p>

				</div>

				<div class="food_info_layout">
					<div class="food_name" style="width: 310px">
						<a 
							href="food_info.jsp?food_id=<%=food.getId_food()%>"><%=food.getName_food()%></a>
					</div>
					<div class="food_description" style="width: 320px">
						<p style="width: 310px">
							<%
								if (food.getDescription_food().length() == 0) {
										out.print("món này ngon tuyệt với!!!");
									}
									if (food.getDescription_food().length() <= 200) {
										out.print(food.getDescription_food());
									}
									if (food.getDescription_food().length() > 200) {
										out.print(food.getDescription_food().substring(0, 200) + "...");
									}
							%>
						</p>
					</div>
				</div>

			</div>
			<div class="food_interac">
				<i class="fa fa-commenting-o" aria-hidden="true"><span
					class="num_interac"><%=food.getSum_comment()%></span>
				</i> <i class="fa fa-thumbs-o-up" aria-hidden="true"> <span
					class="num_interac"><%=food.getSum_like()%></span></i> <i
					class="fa fa-eye" aria-hidden="true"> <span class="num_interac"><%=food.getSum_view()%></span></i>
			</div>

		</div>
		<div style="float: right;background: white; width: 200px; height: 285px;margin-right: -65px">
		<div style="width: 200px;height: 20px;margin-top: 263px;border-bottom: 2px solid black"><a href="Deletefood?index=<%= food.getId_food()%>" style="color: blue;margin-left: 40px;text-decoration: none">Xóa</a>  <a href="update_food_user.jsp?id_food=<%=food.getId_food()%>" style="color: blue;margin-left: 40px;text-decoration: none;">Chỉnh sửa</a></div>
		</div>
		</div>
		<%
			}
		}
		%>
		</div>
			<div id="password_user_change" style="height: 600px; display: block">
				<form method="post" action="Update_user_password">
				
					<h3
						style="text-align: center; margin-top: 0px; background: black; color: white">Đổi
						mật khẩu</h3>
					<table class="addfood"
						style="height: 210px; background: white; width: 500px; margin-left: 35px; margin-top: -10px">

						<tr>
							<td class="title-col">Mật khẩu cũ</td>
							<td class="content-col"><input type="password"
								style="width: 370px; height: 40px" name="pass_old"
								placeholder="nhập mật khẩu cũ.." class="pass_old">
								<%
											if (request.getSession().getAttribute("oldpass_err") != null && request.getParameter("success") != null) {
												out.print("<br><font color=\"red\">" + (String) request.getSession().getAttribute("oldpass_err") + "</font");
											}
								%>
								</td>
						</tr>
						<tr>
							<td class="title-col">Mật khẩu mới</td>
							<td class="content-col"><input type="password"
								style="width: 370px; height: 40px" id="password_field" name="pass_new"
								placeholder="Nhập mật khẩu mới.." class="pass_new"></td>
						</tr>
						<tr>
							<td class="title-col">Nhập lại Mật khẩu</td>
							<td class="content-col"><input type="password"
								style="width: 370px; height: 40px" name="repass_new" id="repassword_field"
								placeholder="nhập lại mật khẩu mới.." class="repass_new"><br> <a id="err_pass"></a>
							</td>
						</tr>





					</table>
					<div id="dialog-option-food" style="margin-top: 10px;">
					<button class="btn-success" id="btn-add-user" style="margin-left: 420px; width: 90px">Đổi
						mật khẩu</button>
				</div>
				</form>
				
				<%
				if(request.getParameter("success").toString().equals("done")){
					%>
					<span style="color: green; text-align: center;margin-left: 30px">Đổi mật khẩu thành công!</span>
					<% 
				}
				%>

			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$('.gender_update').val(<%= Dao.getGender_value(id_user)%>);
			$('#change_image').on('click', function() {
				$('#image_selected').css('display', 'none');
				$('#image_update').css('display', 'block');

			});
			$('#cancel_change').on('click', function() {
				$('#image_selected').css('display', 'block');
				$('#image_update').css('display', 'none');

			});
			$('.dialog_foodlike').on('click', function() {
				$('#order_history').css('display', 'none');
				$('#password_user_change').css('display', 'none');
				$('#info_user_change').css('display', 'none');
				$('#dialog-add-food').css('display', 'none');
				$('.foods_like').css('display', 'block');
				$('.foods_formula').css('display', 'none');
				

			});
			$('.dialog_foodformula').on('click', function() {
				$('#order_history').css('display', 'none');
				$('#password_user_change').css('display', 'none');
				$('#info_user_change').css('display', 'none');
				$('#dialog-add-food').css('display', 'none');
				$('.foods_like').css('display', 'none');
				$('.foods_formula').css('display', 'block');

			});
			$('.dialog_foodadd').on('click', function() {
				$('#order_history').css('display', 'none');
				$('#password_user_change').css('display', 'none');
				$('#info_user_change').css('display', 'none');
				$('#dialog-add-food').css('display', 'block');
				$('.foods_like').css('display', 'none');
				$('.foods_formula').css('display', 'none');

			});
			$('.dialog_orderhistory').on('click', function() {
				$('#order_history').css('display', 'block');
				$('#password_user_change').css('display', 'none');
				$('#info_user_change').css('display', 'none');
				$('#dialog-add-food').css('display', 'none');
				$('.foods_like').css('display', 'none');
				$('.foods_formula').css('display', 'none');

			});
			$('.dialog_profile').on('click', function() {
				$('#order_history').css('display', 'none');
				$('#password_user_change').css('display', 'none');
				$('#info_user_change').css('display', 'block');
				$('#dialog-add-food').css('display', 'none');
				$('.foods_like').css('display', 'none');
				$('.foods_formula').css('display', 'none');

			});
			
			$('#repassword_field')
			.on(
					'keyup',
					function() {
						var pass = $(
								'#repassword_field')
								.val();
						var repass = $(
								'#password_field')
								.val();
						if (pass != repass) {
							$('#btn-add-user').prop(
									'disabled', true);
							$('#err_pass')
									.text(
											"mật khẩu vửa nhập không khớp!");
						}
						if (pass == repass) {
							$('#btn-add-user').prop(
									'disabled', false);
							$('#err_pass').text(
									"mật khẩu OK!");
						}
						if (pass == " "
								|| repass == " ") {
							$('#btn-add-user').prop(
									'disabled', true);
							$('#err_pass').text("");
						}

					});
		});
	</script>
	<%
	request.getSession().setAttribute("oldpass_err", null);
	%>
</body>
</html>