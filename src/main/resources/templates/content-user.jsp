<%@page import="dao.Dao"%>
<%@page import="java.util.Date"%>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script src="dialog.js"></script>

<link rel="stylesheet" type="text/css" href="css/Admin_page.css">

<!-- Latest compiled and minified CSS -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<title></title>

</head>

<body style="height: auto">
	<%
		ArrayList<User> listUser = Dao.getListUser();
		//ArrayList<Diadiem> listDD = DAO_ifood.getListDiaDiem();
		//ArrayList<Category> listLH = Dao.getListCategory();
		if(session.getAttribute("user_webTMDT") == null){
			response.sendRedirect("login_page.jsp");
		}
	%>



	<div id="dialog-add-user">


		<form method="post" action="Adduser" enctype="multipart/form-data">
			<h1>Thông tin Tài khoản</h1>
			<table class="addfood">
				<tr>
					<td class="title-col">Họ</td>
					<td class="content-col"><input type="text" id="name"
						name="first_name" placeholder="Họ.."></td>
				</tr>
				<tr>
					<td class="title-col">Tên</td>
					<td class="content-col"><input type="text" id="name"
						name="last_name" placeholder="Tên.."></td>
				</tr>

				<tr>
					<td class="title-col">Ảnh đại diện</td>
					<td class="content-col"><input type="file" accept="image/*"
						name="image_user"></td>
				</tr>
				<tr>
					<td class="title-col">Email</td>
					<td class="content-col"><input type="text" id="email_user"
						name="email_user" placeholder="email.."> <a id="err_email"></a>
					</td>
				</tr>
				<tr>
					<td class="title-col">Mật khẩu</td>
					<td class="content-col"><input type="password"
						id="password_field" name="pass_user" placeholder="Mật khẩu.."></td>
				</tr>
				<tr>
					<td class="title-col">Nhập lại mật khẩu</td>
					<td class="content-col"><input type="password"
						id="repassword_field" name="repass_user"
						placeholder="nhập lại mật khẩu"> <a id="err_pass"></a></td>
				</tr>
				<tr>
					<td class="title-col">Giới tính</td>
					<td class="content-col"><select name=gender_user>

							<option value="1">Nam</option>
							<option value="0">nử</option>

					</select></td>
				</tr>
				<tr>
					<td class="title-col">Tài khoản</td>
					<td class="content-col"><select name=type_user>
							<option value="Member">Thành viên</option>
							<option value="Administrator">Quản trị viên</option>


					</select></td>
				</tr>


			</table>
			<div id="dialog-option-food" style="margin-top: 10px;">
				<button class="btn-success" type="button" id="btn-cancel">Trở
					về</button>
				<button class="btn-success" id="btn-add-user">Thêm</button>
			</div>
		</form>

	</div>
	<div id="dialog-role-admin">
		<form method="post" action="Role_admin">
			<h1>Phân quyền tài khoản</h1>
			<table class="updatefood">
				<tr>
					<td style="display: none"><input type="text" id="id_update"
						name="id_role"></td>
					<td class="title-col">Loại Tài khoản</td>
					<td class="content-col"><select name="role_user"
						id="role_update">
							<option value="Member">thành viên</option>
							<option value="Administrator">Quản trị viên</option>

					</select></td>
				</tr>


			</table>
			<div id="dialog-option-food" style="margin-top: 10px;">
				<button class="btn-success" type="button" id="btn-cancel-update">Trở
					về</button>
				<button class="btn-success">Cập nhật</button>
			</div>
		</form>

	</div>

	<div id="food-content"
		style="background: white; height: auto; border-bottom: 2px solid black;">
		<div id="option">
			<a id="pagename"> <img class="icon" src="images/page.ico">Quản
				lí tài khoản hệ thống
			</a>
			<div id="search">
				<button id="btn-add">
					<img class="icon" src="images/add.png"> Thêm
				</button>

				<input type="text" name="search" id="search-value"
					placeholder="nhập giá trị tìm kiếm ..."> <br>
				<div id="select-quan">
					<form action="Getfooddistrict">
						Hiển thị: <select id="type_user" name="typeUser">
							<option value="all" selected="selected">Tất cả tài khoản</option>
							<option value="Member">thành viên</option>
							<option value="Administrator">Quản trị viên</option>
						</select> <select id="status_user" name="statusUser">
							<option value="all" selected="selected">Tất cả trạng
								thái</option>
							<option value="Đã kích hoạt">Đã kích hoạt</option>
							<option value="Chưa kích hoạt">Chưa kích hoạt</option>
						</select>

					</form>
				</div>
				<div class="working">
					<img class="working-icon" src="images/working.ico">: <a
						href="#"> <%
 	if (request.getSession().getAttribute("user_webTMDT") != null) {
 		out.print(Dao.getUser_Name(request.getSession().getAttribute("user_webTMDT").toString()));
 	}
 %>
					</a>
				</div>
			</div>
		</div>
		<div id="content"
			style="background: white; height: auto; border-bottom: 2px solid black;">
			<table class="table  table-hover table-bordered ">
				<thead>
					<tr class="bg-info">
						<th style="width: 5%; text-align: center">STT</th>
						<th style="width: 10%; text-align: center">Fisrt name</th>
						<th style="width: 10%; text-align: center">Last name</th>
						<th style="width: 10%; text-align: center">Avatar</th>
						<th style="width: 10%; text-align: center">Status</th>
						<th style="width: 5%; text-align: center">Gender</th>
						<th style="width: 10%; text-align: center">Type Account</th>
						<th style="width: 15%;">Email address</th>
						<th style="width: 15%; text-align: center">Date create</th>
						<th style="width: 10%; text-align: center">Action</th>


					</tr>
				</thead>

				<tbody id="main-content">

					<%
						int page_number = 1;
						if (request.getParameter("page") != null) {
							page_number = Integer.parseInt(request.getParameter("page").toString());
						}
						int val_end = page_number * 10;
						int val_start = val_end - 10;
						int tmp = 0;
						if ((val_end > listUser.size())) {
							tmp = val_end - listUser.size();
						}

						for (int i = val_start; i < val_end - tmp; i++) {
							out.print("<tr style='height: 10'><td>" + (i + 1) + "</td><td style='text-align: left'>"
									+ User.showUser(listUser.get(i)));

						}
					%>

				</tbody>
			</table>
			<div id="page_devider"
				style="background: white; height: 40px; width: 100%; margin-top: -20px; text-align: center">
				<div
					style="background: white; padding: 10px; font-size: larger; font-weight: bold;">
					<span>Trang: </span>
					<%
						for (int i = 0; i < (listUser.size() / 10) + 1; i++) {
							out.print("<a style='padding-right: 7px' href='Admin-user_system.jsp?page=" + (i + 1) + "'>" + (i + 1)
									+ "</a>");
						}
					%>
				</div>
			</div>
		</div>
	</div>


	<script>
		$(document)
				.ready(
						function() {
							$('#btn-add-user').prop('disabled', true);
							$('#btn-add').on('click', function() {
								$('#dialog-add-user').css('display', 'block');

							});
							$('.role_admin').on(
									'click',
									function() {
										$('#dialog-role-admin').css('display',
												'block');
										$('#role_update').val(
												$(this).closest('tr').find(
														'td:eq(6)').text());
										$('#id_update').val(
												$(this).closest('tr').find(
														'td:eq(7)').text());

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

							$('#search-value').on('keyup', function() {
								var searchTerm = $(this).val().toLowerCase();
								$('#main-content tr').each(function() {
									var lineStr = $(this).text().toLowerCase();
									if (lineStr.indexOf(searchTerm) === -1) {
										$(this).hide();
									} else {
										$(this).show();
									}
								});
							});
							$('#email_user')
									.on(
											'keyup',
											function() {
												var searchTerm = $(this).val()
														.toLowerCase();
												$('#main-content tr td')
														.each(
																function() {
																	var lineStr = $(
																			this)
																			.text()
																			.toLowerCase();
																	if (lineStr == searchTerm) {
																		$(
																				'#err_email')
																				.text(
																						"địa chỉ email đã được sử dụng");
																	} else {
																		$(
																				'#err_email')
																				.text(
																						"");
																	}
																});
											});
							$('#type_user').on('change', function() {
								var searchTerm = $(this).val().toLowerCase();
								$('#main-content td').each(function() {
									var lineStr = $(this).text().toLowerCase();
									if (lineStr.indexOf(searchTerm) === -1) {
										$(this).hide();
									} else {
										$(this).show();
									}
									if (searchTerm == "all") {
										$(this).show();
									}
								});
							});
							$('#status_user').on('change', function() {
								var searchTerm = $(this).val().toLowerCase();
								$('#main-content tr').each(function() {
									var lineStr = $(this).text().toLowerCase();
									if (lineStr.indexOf(searchTerm) === -1) {
										$(this).hide();
									} else {
										$(this).show();
									}
									if (searchTerm == "all") {
										$(this).show();
									}
								});
							});
							$('.update_food')
									.on(
											'click',
											function() {
												$('#dialog-update-food').css(
														'display', 'block');
												$('#dialog-add-food').css(
														'display', 'none');
												$('#id_update')
														.val(
																$(this)
																		.closest(
																				'tr')
																		.find(
																				'td:eq(17)')
																		.text());
												$('#name_update')
														.val(
																$(this)
																		.closest(
																				'tr')
																		.find(
																				'td:eq(1)')
																		.text());
												$('.thumbnail_food')
														.attr(
																"src",
																"Getfoodimage?your_id="
																		+ $(
																				this)
																				.closest(
																						'tr')
																				.find(
																						'td:eq(17)')
																				.text());
												$('#price_update')
														.val(
																$(this)
																		.closest(
																				'tr')
																		.find(
																				'td:eq(12)')
																		.text());
												$('#description_update')
														.val(
																$(this)
																		.closest(
																				'tr')
																		.find(
																				'td:eq(7)')
																		.text());
												$('#category_update')
														.val(
																$(this)
																		.closest(
																				'tr')
																		.find(
																				'td:eq(18)')
																		.value());

											});
							$('#btn-add').on('click', function() {
								$('#dialog-add-user').css('display', 'block');
							});
							$('#btn-cancel').on('click', function() {
								$('#dialog-add-user').css('display', 'none');
							});
							$('#btn-cancel-update').on('click', function() {
								$('#dialog-role-admin').css('display', 'none');
							});
							$('#change_image').on('click', function() {
								$('#image_selected').css('display', 'none');
								$('#image_update').css('display', 'block');

							});
							$('#cancel_change').on('click', function() {
								$('#image_selected').css('display', 'block');
								$('#image_update').css('display', 'none');

							});
							$('.delete-row')
									.on(
											'click',
											function() {
												var choice = confirm('Chắc chắn xóa? '
														+ $(this)
																.closest('tr')
																.find(
																		'td:eq(1)')
																.text()
														+ " "
														+ $(this)
																.closest('tr')
																.find(
																		'td:eq(2)')
																.text());
												if (choice === true) {
													window.location = 'Deleteuser?index='
															+ $(this).closest(
																	'tr').find(
																	'td:eq(7)')
																	.text();
												}
												return false;
											});

						});
	</script>
</body>
</html>