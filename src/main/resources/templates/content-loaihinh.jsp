
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
		ArrayList<Category> listLH = Dao.getListCategory();
	if(session.getAttribute("user_webTMDT") == null){
		response.sendRedirect("login_page.jsp");
	}
	%>
	<div id="dialog-update-type">
		<h1>Thông tin Loại hình</h1>
		<form method="post" action="Updatetype">
			<table class="addtype">

				<tr>
					<input type="text" style="display: none;" id="edit_id"
						name="id_update">
					<td class="title-col">Loại hình</td>
					<td class="content-col"><input type="text" id="edit_name"
						name="name_update" placeholder="tên loai hinh.."></td>
				</tr>
				<tr>
					<td class="title-col">Mô tả</td>
					<td class="content-col"><textarea rows="5" cols="22"
							id="edit_description" name="description_update"
							placeholder="mô tả chi tiết..."></textarea></td>
				</tr>

			</table>
			<div id="dialog-option-type">
				<button class="btn-success" type="button" id="btn-cancel-update">Trở
					về</button>
				<button class="btn-success">Chỉnh sửa</button>
			</div>
		</form>
	</div>

	<div id="dialog-add-type">
		<h1>Thông tin Loại hình món ăn</h1>
		<form method="post" action="Addtype">
			<table class="addtype">
				<tr>
					<td class="title-col">Loại hình</td>
					<td class="content-col"><input type="text" name="name"
						placeholder="tên loai hinh.."></td>
				</tr>
				<tr>
					<td class="title-col">Mô tả</td>
					<td class="content-col"><textarea rows="5" cols="22"
							name="description" placeholder="mô tả chi tiết..."></textarea></td>
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
		style="background: white; height: 590px; border-bottom: 2px solid black;">
		<div id="option">
			<a id="pagename"> <img class="icon" src="images/page.ico">Quản
				lí loại hình
			</a>
			<div id="search">
				<button id="btn_add_category">
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
			style="background: white; height: 590px; border-bottom: 2px solid black;">


			<table class="table table-striped table-hover table-bordered ">
				<thead>
					<tr class="bg-info">
						<th style="width: 10%">STT</th>
						<th style="width: 20%">Category</th>
						<th style="width: 15%; text-align: center">ID category</th>
						<th style="width: 40%">Description</th>
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
						if ((val_end > listLH.size())) {
							tmp = val_end - listLH.size();
						}

						for (int i = val_start; i < val_end - tmp; i++) {

							out.print("<tr><td>" + (i + 1) + "</td><td>" + Category.showLH(listLH.get(i)));

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
						for (int i = 0; i < (listLH.size() / 10) + 1; i++) {
							out.print("<a style='padding-right: 7px' href='Admin-loaihinh.jsp?page=" + (i + 1) + "'>" + (i + 1)
									+ "</a>");
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
					$('#btn_add_category').on('click', function() {
						$('#dialog-add-type').css('display', 'block');
						$('#dialog-update-type').css('display', 'none');
					});
					$('.update_type').on(
							'click',
							function() {
								$('#dialog-update-type')
										.css('display', 'block');
								$('#dialog-add-type').css('display', 'none');
								$('#edit_id').val(
										$(this).closest('tr').find('td:eq(2)')
												.text());
								$('#edit_name').val(
										$(this).closest('tr').find('td:eq(1)')
												.text());
								$('#edit_description').val(
										$(this).closest('tr').find('td:eq(3)')
												.text());
							});
					$('#btn-cancel').on('click', function() {
						$('#dialog-add-type').css('display', 'none');
					});
					$('#btn-cancel-update').on('click', function() {
						$('#dialog-update-type').css('display', 'none');
					});
					$('.delete-row').on(
							'click',
							function() {
								var choice = confirm('Chắc chắn xóa? '
										+ $(this).closest('tr')
												.find('td:eq(1)').text());
								if (choice === true) {
									window.location = 'Delete_type?index='
										+ $(this).closest(
												'tr').find(
												'td:eq(2)')
												.text();
								}
								return false;
							});

				});
	</script>

</body>
</html>