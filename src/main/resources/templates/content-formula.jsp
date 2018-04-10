
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
<body>
	<%
		ArrayList<Step_cook> listFormula = Dao.getListStepCook();
		ArrayList<Food> listSP = Dao.getListFood();
		if(session.getAttribute("user_webTMDT") == null){
			response.sendRedirect("login_page.jsp");
		}
	%>
	<div id="dialog-update-formular"
		style="display: none; width: 500px; height: 360px; position: fixed; background-color: white; margin-left: 400px; margin-top: 100px; border: solid gray 2px;">
		<h1
			style="background-color: #86b0f4; text-align: center; margin-top: -1px; Color: #ffffff; font-weight: bold; color: blue;">Thông
			tin cách làm</h1>
		<form method="post" action="Updateformula"
			enctype="multipart/form-data">
			<table class="addtype">

				<tr>
					<input type="text" style="display: none;" id="edit_id"
						name="id_update">
					<td class="title-col">Cách làm</td>
					<td class="content-col"><textarea rows="10" cols="15"
							id="edit_formular" name="formula_update"></textarea></td>
				</tr>
				<tr>
					<td class="title-col">Hình ảnh</td>
					<td id="image_selected" style="text-align: left"><img
						class="thumbnail_formular"> <a id="change_image" href="#">Thay
							đổi?</a></td>
					<td class="content-col" id="image_update" style="display: none"><input
						type="file" accept="image/*" name="image_update"> <a
						id="cancel_change" href="#">Hoàn tác!</a></td>

				</tr>

			</table>
			<div id="dialog-option-type">
				<button class="btn-success" type="button" id="btn-cancel-update">Trở
					về</button>
				<button class="btn-success">Cập nhật</button>
			</div>
		</form>
	</div>



	<div id="type-content"
		style="background: white; height: auto; border-bottom: 2px solid black;">
		<div id="option">
			<a id="pagename"> <img class="icon" src="images/page.ico">Quản
				lí cách làm món ăn
			</a>
			<div id="search">


				<input type="text" name="search" id="search-value"
					placeholder="nhập giá trị tìm kiếm ..."> <br>
					<div id="select-quan">
					<form action="Getfooddistrict">
						Hiển thị: <select id="category_food" name="diadiem">
							<option value="all" selected="selected">Tất cả món ăn</option>
							<%
								for (Food food : listSP) {
									out.print("<option  value='" + food.getName_food()  + "'>" +  food.getName_food()
											+ "</option>");
								}
							%>
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


			<table class="table table-striped table-hover table-bordered ">
				<thead>
					<tr class="bg-info">
						<th style="width: 5%">STT</th>
						<th style="width: 50%">Formular</th>
						<th style="width: 10%; text-align: center">Image</th>
						<th style="width: 10%; text-align: center">ID Formular</th>
						<th style="width: 15%">Food</th>
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
						if ((val_end > listFormula.size())) {
							tmp = val_end - listFormula.size();
						}

						for (int i = val_start; i < val_end - tmp; i++) {

							out.print("<tr><td>" + (i + 1) + "</td><td style='text-align: left'>"
									+ Step_cook.showStepCook(listFormula.get(i)));

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
						for (int i = 0; i < (listFormula.size() / 10) + 1; i++) {
							out.print("<a style='padding-right: 7px' href='Admin-formula.jsp?page=" + (i + 1) + "'>" + (i + 1)
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
					$('#btn_add_menu').on('click', function() {
						$('#dialog-add-menu').css('display', 'block');
						$('#dialog-update-menu').css('display', 'none');
					});
					$('.update_formula').on(
							'click',
							function() {
								$('#dialog-update-formular').css('display',
										'block');
								$('#edit_formular').val(
										$(this).closest('tr').find('td:eq(5)')
												.text());
								$('#edit_id').val(
										$(this).closest('tr').find('td:eq(3)')
												.text());
								$('.thumbnail_formular').attr(
										"src",
										"Getformulaimage?your_id="
												+ $(this).closest('tr').find(
														'td:eq(3)').text());

							});
					$('#change_image').on('click', function() {
						$('#image_selected').css('display', 'none');
						$('#image_update').css('display', 'block');

					});
					$('#cancel_change').on('click', function() {
						$('#image_selected').css('display', 'block');
						$('#image_update').css('display', 'none');

					});

					$('#btn-cancel-update').on('click', function() {
						$('#dialog-update-formular').css('display', 'none');
					});
					$('.delete-row').on(
							'click',
							function() {
								var choice = confirm('Chắc chắn xóa? '
										+ $(this).closest('tr')
												.find('td:eq(3)').text());
								if (choice === true) {
									window.location = 'Deletef?index='
											+ $(this).closest('tr').find(
													'td:eq(3)').text();
								}
								return false;
							});
					$('#category_food').on('change', function() {
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

				});
	</script>

</body>
</html>