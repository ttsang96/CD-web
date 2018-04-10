
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
		ArrayList<Comment_box> listComment = Dao.getListComment();
		ArrayList<Food> listFood = Dao.getListFood();
		if(session.getAttribute("user_webTMDT") == null){
			response.sendRedirect("login_page.jsp");
		}
		String id_tmp = null;
		if(session.getAttribute("user_webTMDT") != null){
		 id_tmp = session.getAttribute("user_webTMDT").toString();
		}
	%>
	<div id="dialog-add-answer"
		style="display: none; width: 520px; height: 300px; position: fixed; background-color: white; margin-left: 400px; margin-top: 100px; border: solid gray 2px;">
		<h1
			style="background-color: #86b0f4; text-align: center; margin-top: -1px; Color: #ffffff; font-weight: bold; color: blue;">
			Thêm bình luận</h1>
		<form method="post" action="Add_comment">
			<table class="addtype">

				<tr>

					<td class="title-col">Món ăn</td>
					<td class="content-col"><select name=food_select>

							<%
								for (Food food : listFood) {
									out.print("<option  value='" + food.getId_food() + "'>" + food.getName_food() + "</option>");
								}
							%>
					</select></td>
				</tr>
				<tr>
					<td class="title-col">Nội dung</td>
					<td class="content-col"><textarea rows="10" cols="15"
							id="content_message" name="content_message"
							placeholder="nội dung..."></textarea></td>
				</tr>

			</table>
			<div id="dialog-option-type" style="margin-top: 3px;">
				<button class="btn-success" type="button" id="btn-cancel-insert">Trở
					về</button>
				<button class="btn-success" style="margin-right: 10px">Thêm</button>
			</div>
		</form>
	</div>
	<div id="dialog-send-answer"
		style="display: none; width: 520px; height: 300px; position: fixed; background-color: white; margin-left: 400px; margin-top: 100px; border: solid gray 2px;">
		<h1
			style="background-color: #86b0f4; text-align: center; margin-top: -1px; Color: #ffffff; font-weight: bold; color: blue;">
			Phản hồi bình luận</h1>
		<form method="post" action="Answer_comment">
			<table class="addtype">

				<tr>
					<input type="text" style="display: none;" id="edit_id"
						name="id_user">
					<td class="title-col">Tiêu đề</td>
					<td class="content-col"><input type="text"
						style="height: 30px" name="title_message"></td>
				</tr>
				<tr>
					<td class="title-col">Nội dung</td>
					<td class="content-col"><textarea rows="10" cols="15"
							id="content_message" name="content_message"
							placeholder="nội dung..."></textarea></td>
				</tr>

			</table>
			<div id="dialog-option-type">
				<button class="btn-success" type="button" id="btn-cancel-answer">Trở
					về</button>
				<button class="btn-success">Trả lời</button>
			</div>
		</form>
	</div>



	<div id="type-content"
		style="background: white; height: auto; border-bottom: 2px solid black;">
		<div id="option">
			<a id="pagename"> <img class="icon" src="images/page.ico">Quản
				lí bình luận
			</a>
			<div id="search">
				<button id="btn-add">
					<img class="icon" src="images/add.png"> Thêm
				</button>
				<input type="text" name="search" id="search-value"
					placeholder="nhập giá trị tìm kiếm ..."> <br>

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


			<table class="table table-striped table-hover table-bordered ">
				<thead>
					<tr class="bg-info">
						<th style="width: 5%">STT</th>
						<th style="width: 45%">Comment</th>
						<th style="width: 20%; text-align: center">Food</th>
						<th style="width: 10%; text-align: center">Poster</th>
						<th style="width: 10%">Date</th>
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
						if ((val_end > listComment.size())) {
							tmp = val_end - listComment.size();
						}

						for (int i = val_start; i < val_end - tmp; i++) {

							out.print("<tr><td>" + (i + 1) + "</td><td style='text-align: left'>"
									+ Comment_box.showComment(listComment.get(i)));

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
						for (int i = 0; i < (listComment.size() / 10) + 1; i++) {
							out.print("<a style='padding-right: 7px' href='Admin-comment.jsp?page=" + (i + 1) + "'>" + (i + 1)
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

							$('.answer_comment').on(
									'click',
									function() {
										$('#dialog-send-answer').css('display',
												'block');
										$('#id_update').val(
												$(this).closest('tr').find(
														'td:eq(5)').text());

									});

							$('#btn-cancel-answer').on(
									'click',
									function() {
										$('#dialog-send-answer').css('display',
												'none');
									});
							$('#btn-cancel-insert').on('click', function() {
								$('#dialog-add-answer').css('display', 'none');
							});
							$('#btn-add').on(
									'click',
									function() {
										$('#dialog-add-answer').css('display',
												'block');
									});
							$('.delete-row')
									.on(
											'click',
											function() {
												var choice = confirm('Chắc chắn xóa? bình luận trên '
														+ $(this)
																.closest('tr')
																.find(
																		'td:eq(2)')
																.text());
												if (choice === true) {
													window.location = 'Delete_comment?index='
															+ $(this).closest(
																	'tr').find(
																	'td:eq(5)')
																	.text();
												}
												return false;
											});

						});
	</script>

</body>
</html>