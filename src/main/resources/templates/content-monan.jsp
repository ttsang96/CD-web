<%@page import="dao.Dao"%>
<%@page import="java.util.Date"%>
<%@page import="model.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

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

<body>
	<%
		ArrayList<Food> listSP = Dao.getListFood();
		//ArrayList<Diadiem> listDD = DAO_ifood.getListDiaDiem();
		ArrayList<Category> listLH = Dao.getListCategory();
		if(session.getAttribute("user_webTMDT") == null){
			response.sendRedirect("login_page.jsp");
		}
		String id_tmp = null;
		if(session.getAttribute("user_webTMDT") != null){
		 id_tmp = session.getAttribute("user_webTMDT").toString();
		}
	%>
	<div id="detail"
		style="display: none; position: fixed; width: 420px; height: 1000px; margin-left: 650px; margin-top: 135px;">
		<textarea id="detail_info" rows="15" cols="65"></textarea>

	</div>


	<div id="dialog-add-food">


		<form method="post" action="Addfood" enctype="multipart/form-data">
			<h1>Thông tin món ăn</h1>
			<table class="addfood">
				<tr>
					<td class="title-col">Tên món ăn</td>
					<td class="content-col"><input type="text" id="name"
						name="name" placeholder="tên món ăn.."></td>
				</tr>
				<tr>
					<td class="title-col">Hình ảnh</td>
					<td class="content-col"><input type="file" id="image"
						accept="image/*" name="image_food"></td>
				</tr>


				<tr>
					<td class="title-col">Loại hình</td>
					<td class="content-col"><select name="category">
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
					<td class="content-col"><textarea rows="4" id="mota" cols="22"
							name="description" placeholder="mô tả chi tiết về món ăn..."></textarea></td>
				</tr>
				<tr>
					<td class="title-col">nguyên liệu</td>
					<td class="content-col"><textarea rows="4" cols="22"
							name="material" placeholder="Nguyên liệu nấu ăn..."></textarea></td>
				</tr>
				<tr>
					<td class="title-col">Cách làm</td>
					<td class="content-col"><textarea rows="8" cols="22"
							name="fomular" placeholder=" cách làm món ăn..."></textarea></td>
				</tr>
				<tr>
					<td class="title-col">Hình ảnh</td>
					<td class="content-col"><input type="file" id="image"
						accept="image/*" name="image_fomular"></td>
				</tr>

			</table>
			<div id="dialog-option-food" style="margin-top: 10px;">
				<button class="btn-success" type="button" id="btn-cancel">Trở
					về</button>
				<button class="btn-success">Thêm</button>
			</div>
		</form>

	</div>
	<div id="dialog-update-food" style="width: 520px; height: 400px;">


		<form method="post" action="Updatefood" enctype="multipart/form-data">
			<h1>Thông tin món ăn</h1>
			<table class="updatefood" style="width: 500px; height: 300px;">

				<tr>
					<td style="display: none"><input type="text" id="id_update"
						name="id" placeholder="tên món ăn.."></td>
					<td class="title-col">Tên món ăn</td>
					<td class="content-col"><input type="text" id="name_update"
						name="name" placeholder="tên món ăn.."></td>
				</tr>
				<tr>
					<td class="title-col">Giá</td>
					<td class="content-col"><input type="text" id="price_update"
						name="price" placeholder="giá món ăn"></td>
				</tr>
				<tr>
					<td class="title-col">Hình ảnh</td>
					<td id="image_selected" style="text-align: left"><img
						class="thumbnail_food1"> <a id="change_image" href="#">Thay
							đổi?</a></td>
					<td class="content-col" id="image_update" style="display: none"><input
						type="file" accept="image/*" name="image_update"> <a
						id="cancel_change" href="#">Hoàn tác!</a></td>

				</tr>


				<tr>
					<td class="title-col">Loại hình</td>
					<td class="content-col"><select name="category_update"
						class="category_update">
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
					<td class="content-col"><textarea rows="4" cols="22"
							name="description_update" id="description_update"
							placeholder="mô tả chi tiết về món ăn..."></textarea></td>
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
		style="background: white; height: 1145px; border-bottom: 2px solid black;">
		<div id="option">
			<a id="pagename"> <img class="icon" src="images/page.ico">Quản
				lí món ăn
			</a>
			<div id="search">
				<button id="btn-add">
					<img class="icon" src="images/add.png"> Thêm
				</button>

				<input type="text" name="search" id="search-value"
					placeholder="nhập giá trị tìm kiếm ..."> <br>
				<div id="select-quan">
					<form action="Getfooddistrict">
						Hiển thị: <select id="category_food" name="diadiem">
							<option value="all" selected="selected">Tất cả Loại hình</option>
							<%
								for (Category category : listLH) {
									out.print("<option  value='" + category.getId_category() + "'>" + category.getName_category()
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
 		out.print(Dao.getUser_Name(id_tmp));
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
						<th style="width: 2%; text-align: center">STT</th>
						<th style="width: 15%">Name</th>
						<th style="width: 10%; text-align: center">Image</th>
						<th style="width: 5%; text-align: center">Category</th>
						<th style="width: 7%; text-align: center">Description</th>
						<th style="width: 5%; text-align: center">Material</th>
						<th style="width: 5%; text-align: center">Formula</th>
						<th style="width: 8%; text-align: center">Poster</th>
						<th style="width: 3%; text-align: center">views</th>
						<th style="width: 3%; text-align: center">price</th>
						<th style="width: 3%; text-align: center">Likes</th>
						<th style="width: 3%; text-align: center">Comments</th>
						<th style="width: 3%; text-align: center">Point</th>
						<th style="width: 12%; text-align: center">Date</th>
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
						if ((val_end > listSP.size())) {
							tmp = val_end - listSP.size();
						}

						for (int i = val_start; i < val_end - tmp; i++) {
							out.print("<tr style='height: 10'><td>" + (i + 1) + "</td><td style='text-align: left'>"
									+ Food.showFood(listSP.get(i)));

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
						for (int i = 0; i < (listSP.size() / 10) + 1; i++) {
							out.print("<a style='padding-right: 7px' href='Admin-monan.jsp?page=" + (i + 1) + "'>" + (i + 1)
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
							
							$('#btn-add').on('click', function() {
								$('#dialog-add-food').css('display', 'block');

							});
							$('.infor_detail')
									.on(
											'mouseover',
											function() {
												//$(this).closest('a').css('display', 'none');
												$('#detail_info')
														.val(
																$(this)
																		.closest(
																				'tr')
																		.find(
																				'td:eq(7)')
																		.text());
												$('#detail').css('display',
														'block');
												if ($('#detail_info').val().length == 0) {
													$('#detail_info').val(
															"trống!");
													$('#detail_info').attr(
															"rows", "1");
												}
												if ($('#detail_info').val().length < 100) {
													$('#detail_info').attr(
															"rows", "1");
												}
												if ($('#detail_info').val().length < 170
														&& $('#detail_info')
																.val().length >= 100) {
													$('#detail_info').attr(
															"rows", "2");
												}
												if ($('#detail_info').val().length < 200
														&& $('#detail_info')
																.val().length >= 150) {
													$('#detail_info').attr(
															"rows", "3");
												}
												if ($('#detail_info').val().length >= 200) {
													$('#detail_info').attr(
															"rows", "5");
												}
												if ($('#detail_info').val().length >= 400) {
													$('#detail_info').attr(
															"rows", "8");
												}
												if ($('#detail_info').val().length >= 600) {
													$('#detail_info').attr(
															"rows", "12");
												}
												if ($('#detail_info').val().length >= 800) {
													$('#detail_info').attr(
															"rows", "16");
												}
												if ($('#detail_info').val().length >= 1000) {
													$('#detail_info').attr(
															"rows", "22");
												}

											});
							$('.infor_detail').on('mouseout', function() {
								//$(this).closest('a').css('display', 'none');
								$('#detail').css('display', 'none');

							});
							$('.material_detail').on('mouseout', function() {
								//$(this).closest('a').css('display', 'none');
								$('#detail').css('display', 'none');

							});
							$('.fomular_detail').on('mouseout', function() {
								//$(this).closest('a').css('display', 'none');
								$('#detail').css('display', 'none');

							});
							$('.material_detail').on(
									'mouseover',
									function() {
										$('#detail_info').val(
												$(this).closest('tr').find(
														'td:eq(8)').text());

										$('#detail').css('display', 'block');
										$('#detail_info').attr("rows", "10");

										//$(this).closest('a').css('display', 'none');

									});
							$('.fomular_detail').on(
									'mouseover',
									function() {
										$('#detail_info').val(
												$(this).closest('tr').find(
														'td:eq(9)').text());
										$('#detail').css('display', 'block');
										$('#detail_info').attr("rows", "22");
										//$(this).closest('a').css('display', 'none');

									});
							$('.category_hide').on('click', function() {
								$('#detail').css('display', 'none');

							});
							$('.fomular_hide').on('click', function() {
								$('#fomular_detail').css('display', 'none');

							});
							$('.material_hide').on('click', function() {
								$('#detail').css('display', 'none');

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
												$('.thumbnail_food1')
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
												$('.category_update')
														.val(
																$(this)
																		.closest(
																				'tr')
																		.find(
																				'td:eq(18)')
																		.text());

											});
							$('#btn-add').on('click', function() {
								$('#dialog-add-food').css('display', 'block');
							});
							$('#btn-cancel').on('click', function() {
								$('#dialog-add-food').css('display', 'none');
							});
							$('#btn-cancel-update').on(
									'click',
									function() {
										$('#dialog-update-food').css('display',
												'none');
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
																.text());
												if (choice === true) {
													window.location = 'Deletefood?index='
															+ $(this)
																	.closest(
																			'tr')
																	.find(
																			'td:eq(17)')
																	.text();
												}
												return false;
											});

						});
	</script>
</body>
</html>