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

<body style="height: auto;">
	<%
		ArrayList<Order_info> listOD = Dao.getListOrder();
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
	<div id="dialog_change_status"
		style="display: none; position: fixed; width: 210px; height: 100px; margin-left: 600px; margin-top: 135px;background: silver">
		
		<h4 style="text-align: center;background: black;color: white;margin-top: 0px;">Cập nhật trạng thái</h4>
		<input type="text" class="tmp_id_fr" style="display: none">
		<span style="margin-left: 5px;">Trạng thái </span><select id="status_select" style="margin-left: 20px">
				<option value='0'>Vừa nhận</option>
	         	<option value='1'>Kiểm tra</option>
	          	<option value='2'>Thực thi</option>
	          	<option value='3'>Giao hàng</option>
	          	<option value='4'>Hoàn tất</option>
		</select><br>
		<button class="btn-success cancel_update" type="button" style="margin-left: 40px;margin-top: 20px">Trở về</button>
		<button class="btn-success btnstatus_select" style="margin-left: 20px;margin-top: 20px">Cập nhật</button>
		
	</div>
	<div id="detail"
		style="display: none; position: fixed; width: 420px; height: 185px; margin-left: 650px; margin-top: 135px;">
		<textarea id="detail_info" rows="4" cols="68" style="resize: none"></textarea>

	</div>
	<div id="food-content"
		style="background: white; height: auto; border-bottom: 2px solid black;">
		<div id="option">
			<a id="pagename"> <img class="icon" src="images/page.ico">Quản
				lí đơn hàng
			</a>
			<div id="search">
				<input type="text" name="search" id="search-value"
					placeholder="nhập giá trị tìm kiếm ..."> <br>
				<div id="select-quan">
					<form action="Getfooddistrict">
						Hiển thị: <select id="order_show">
							<option value="all" selected="selected">Tất cả đơn hàng</option>
							<option value="vừa nhận">vừa nhận</option>
							<option value="kiểm tra">kiểm tra</option>
							<option value="Thực thi">Thực thi</option>
							<option value="Giao hàng">Giao hàng</option>
							<option value="Hoàn tất">Hoàn tất</option>
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
						<th style="width: 5%; text-align: center">STT</th>
						<th style="width: 7%">ID order</th>
						<th style="width: 7%; text-align: center">Cart info</th>
						<th style="width: 7%; text-align: center">Total</th>
						<th style="width: 7%; text-align: center">Customer</th>
						<th style="width: 10%; text-align: center">Status order</th>
						<th style="width: 37%; text-align: center">Payment info</th>
						<th style="width: 10%; text-align: center">Date order</th>
						<th style="width: 10%; text-align: center">Date order</th>

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
						if ((val_end > listOD.size())) {
							tmp = val_end - listOD.size();
						}

						for (int i = val_start; i < val_end - tmp; i++) {

							out.print("<tr style='height: 10'><td>" + (i + 1) + "</td><td style='text-align: left'>"
									+ Order_info.showOrder(listOD.get(i)));

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
						for (int i = 0; i < (listOD.size() / 10) + 1; i++) {
							out.print(
									"<a style='padding-right: 7px' href='Admin-oder.jsp?page=" + (i + 1) + "'>" + (i + 1) + "</a>");
						}
					%>
				</div>
			</div>
		</div>
	</div>


	<script>
		$(document).ready(
				function() {
					
					$('.update_status')
					.on(
							'click',
							function() {
								
								var tmp = $(this).closest('tr').find(
								'td:eq(5)').text();
								var tmp_id =  $(this).closest('tr').find(
								'td:eq(1)').text();
								$('.tmp_id_fr').val(tmp_id);
								$('#status_select').val(tmp);
								$('#dialog_change_status').css("display", "block");
								
								//$(this).closest('a').css('display', 'none');

							});
					$('.btnstatus_select')
					.on(
							'click',
							function() {
								window.location = 'Update_status_order?id_order='
										+ $('.tmp_id_fr').val()
										+ '&status='
										+ $('#status_select')
												.val();
							});
					$('.cancel_update')
					.on(
							'click',
							function() {
								$('#dialog_change_status').css("display", "none")

								//$(this).closest('a').css('display', 'none');

							});
					$('.cart_detail').on(
							'mouseover',
							function() {
								$('#detail_info').val(
										$(this).closest('tr').find(
												'td:eq(8)').text());

								$('#detail').css('display', 'block');
								

								//$(this).closest('a').css('display', 'none');

							});
					$('.cart_detail').on('mouseout', function() {
						//$(this).closest('a').css('display', 'none');
						$('#detail').css('display', 'none');

					});
					
					$('#order_show').on('change', function() {
						var searchTerm = $(this).val().toLowerCase();
						$('#main-content tr').each(function() {
							var lineStr =  $(this).text().toLowerCase();
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
					$('.status_select').on('change', function() {
						window.location = 'Update_status_order?id_order='
							+ $(this).closest(
									'tr').find(
									'td:eq(1)')
									.text() + '&status='+$('.status_select').val();
					});
					
					
					$('.delete-row').on(
							'click',
							function() {
								var choice = confirm('Chắc chắn xóa? '
										+ $(this).closest('tr')
												.find('td:eq(1)').text());
								if (choice === true) {
									window.location = 'Delete_order?id_order='
											+ $(this).closest('tr').find(
													'td:eq(1)').text();
								}
								return false;
							});

				});
	</script>
</body>
</html>