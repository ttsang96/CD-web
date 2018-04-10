
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%@page import="dao.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css" href="css/Admin_page.css">
<script src="dialog.js"></script>

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
		ArrayList<Menu_system> listMN = Dao.getListMenu();
		if(session.getAttribute("user_webTMDT") == null){
			response.sendRedirect("login_page.jsp");
		}
	%>
	<div id="dialog-update-menu"
		style="display: none; width: 520px; height: 285px; position: fixed; background-color: white; margin-left: 400px; margin-top: 100px; border: solid gray 2px;">
		<h1
			style="background-color: #86b0f4; text-align: center; margin-top: -1px; Color: #ffffff; font-weight: bold; color: blue;">Thông
			tin Menu update</h1>
		<form method="post" action="Updatemenu">
			<table class="addtype">

				<tr>
					<input type="text" style="display: none;" id="edit_id"
						name="id_update">
					<td class="title-col">Menu</td>
					<td class="content-col"><input type="text" id="edit_name"
						name="name_update" placeholder="tên menu.."></td>
				</tr>
				<tr>
					<td class="title-col">Liên kết</td>
					<td class="content-col"><input type="text" id="edit_link"
						name="link_update" placeholder="liên kết.."></td>
				</tr>

			</table>
			<div id="dialog-option-type">
				<button class="btn-success" type="button" id="btn-cancel-update">Trở
					về</button>
				<button class="btn-success">Chỉnh sửa</button>
			</div>
		</form>
	</div>

	<div id="dialog-add-menu"
		style="display: none; width: 520px; height: 280px; position: fixed; background-color: white; margin-left: 400px; margin-top: 100px; border: solid gray 2px;">
		<h1
			style="background-color: #86b0f4; text-align: center; margin-top: -1px; Color: #ffffff; font-weight: bold; color: blue;">Thông
			tin Menu thêm</h1>
		<form method="post" action="Addmenu">
			<table class="addtype">
				<tr>
					<td class="title-col">Menu</td>
					<td class="content-col"><input type="text" name="name_menu"
						placeholder="tên loai hinh.."></td>
				</tr>
				<tr>
					<td class="title-col">Liên kết</td>
					<td class="content-col"><input type="text" id="edit_name"
						name="link_menu" placeholder="tên menu.."></td>
				</tr>

			</table>
			<div id="dialog-option-type">
				<button class="btn-success" type="button" id="btn-cancel">Trở
					về</button>
				<button class="btn-success">Thêm</button>
			</div>
		</form>
	</div>

	<div id="type-content"
		style="background: white; height: 620px; border-bottom: 2px solid black;">
		<div id="option">
			<a id="pagename"> <img class="icon" src="images/page.ico">Quản
				lí menu hệ thống
			</a>
			<div id="search">
				<button id="btn_add_menu">
					<img class="icon" src="images/add.png"> Thêm
				</button>

				<input type="text" name="search" id="search-value"
					placeholder="nhập giá trị tìm kiếm ..."> <br>
				<div class="working">
					<img class="working-icon" src="images/working.ico">: <a
						href="#">
						<%
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


			<table class="table table-striped table-hover table-bordered ">
				<thead>
					<tr class="bg-info">
						<th style="width: 10%">STT</th>
						<th style="width: 20%">Menu</th>
						<th style="width: 15%; text-align: center">ID Menu</th>
						<th style="width: 40%">Link address</th>
						<th style="width: 15%; text-align: center">Action</th>


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
						if ((val_end > listMN.size())) {
							tmp = val_end - listMN.size();
						}

						for (int i = val_start; i < val_end - tmp; i++) {

							out.print("<tr><td>" + (i + 1) + "</td><td>" + Menu_system.showMN(listMN.get(i)));

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
						for (int i = 0; i < (listMN.size() / 10) + 1; i++) {
							out.print(
									"<a style='padding-right: 7px' href='Admin-menu.jsp?page=" + (i + 1) + "'>" + (i + 1) + "</a>");
						}
					%>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(
				function() {

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
					$('#btn_add_menu').on('click', function() {
						$('#dialog-add-menu').css('display', 'block');
						$('#dialog-update-menu').css('display', 'none');
					});
					$('.update_menu').on(
							'click',
							function() {
								$('#dialog-update-menu')
										.css('display', 'block');
								$('#dialog-add-menu').css('display', 'none');
								$('#edit_id').val(
										$(this).closest('tr').find('td:eq(2)')
												.text());
								$('#edit_name').val(
										$(this).closest('tr').find('td:eq(1)')
												.text());
								$('#edit_link').val(
										$(this).closest('tr').find('td:eq(3)')
												.text());
							});
					$('#btn-cancel').on('click', function() {
						$('#dialog-add-menu').css('display', 'none');
					});
					$('#btn-cancel-update').on('click', function() {
						$('#dialog-update-menu').css('display', 'none');
					});
					$('.delete-row').on(
							'click',
							function() {
								var choice = confirm('Chắc chắn xóa? '
										+ $(this).closest('tr')
												.find('td:eq(1)').text());
								if (choice === true) {
									window.location = 'Deletemenu?index='
											+ $(this).closest('tr').find(
													'td:eq(2)').text();
								}
								return false;
							});

				});
	</script>

</body>
</html>