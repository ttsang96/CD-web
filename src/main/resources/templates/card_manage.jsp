<%@page import="model.Item"%>
<%@page import="model.Card_item"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title></title>
<style>
/* unvisited link */
a:link {
	color: white;
}

/* visited link */
a:visited {
	color: white;
}
</style>
</head>
<body>
	<%
		Card_item card_item = (Card_item) session.getAttribute("card");
		if (card_item == null) {
			card_item = new Card_item();
			session.setAttribute("card", card_item);
		}
		if(card_item.getCartItems().size()==0){
			response.sendRedirect("new_food.jsp");
		}
		if(session.getAttribute("user_webTMDT") == null){
			response.sendRedirect("login_page.jsp");
		}
	%>
	
	<div
		style="width: 1000px; height: 630px; border: 0.5px solid black; margin-left: 160px; float: left">
		<h1 style="background: #183544; margin-top: -0px; color: white;">
			<a href="new_food.jsp"
				style="text-decoration: none; margin-left: 20px;">TTS Food</a>
		</h1>
		<a href="new_food.jsp"
			style="color: blue; font-size: large; text-decoration: none; margin-left: 10px">
			Tiếp tục mua hàng</a>

		<hr>
		<%
			if (card_item.getCartItems().size() == 0) {
		%>

		<p style="font-weight: bold; font-size: large; margin-left: 50px">
			Giỏ hàng của tôi: Chưa có đơn hàng nào!!!</p>
		<%
			}
			if (card_item.getCartItems().size() > 0) {
		%>
		<p style="font-weight: bold; font-size: large; margin-left: 50px">
			Giỏ hàng của tôi:
			<%=card_item.getCartItems().size()%></p>
		<%
			}
		%>
		<div
			style="height: 330px; border-bottom: 1px solid black; overflow: auto; width: 980px">
			<table class="table  table-hover"
				style="width: 900px; height: auto; margin-left: 50px;">
				<thead>
					<tr class="bg-info">
						<th style="width: 15%"></th>
						<th style="width: 30%"></th>
						<th style="width: 25%; text-align: center;">Số lượng</th>
						<th style="width: 20%; text-align: center;">Giá</th>
						<th style="width: 10%; text-align: center"></th>


					</tr>
				</thead>
				<tbody id="main-content">

					<%
						//HttpSession session = request.getSession();

						for (Map.Entry<String, Item> list : card_item.getCartItems().entrySet()) {
					%>

					<tr>
						<td><img alt=""
							src="Getfoodimage?your_id=<%=list.getValue().getFood().getId_food()%>"
							style="width: 95px; height: 55px;"></td>
						<td style="font-size: large; font-weight: bold"><%=list.getValue().getFood().getName_food()%></td>
						<td style="display: none"><%=list.getValue().getFood().getPrice_food()%></td>
						<td style="text-align: center;"><button
								class="inscrease_quantity">
								<img style="width: 20px; height: 20px;" class='icon-quantity'
									src='images/increase.png'>
							</button> <input type="text" class="food_quantity_show"
							disabled="disabled" value="<%=list.getValue().getQuantity()%>"
							style="height: 24px; width: 50px; text-align: center;"> <input
							type="text" class="food_price_show" disabled="disabled"
							value="<%=list.getValue().getFood().getPrice_food()%> VND"
							style="height: 24px; width: 50px; display: none">

							<button class="descrease_quantity">
								<img style="width: 20px; height: 20px;" class='icon-quantity'
									src='images/descrease.png'>
							</button></td>
						<td>
							<p class="gia_SP"><%= list.getValue().getQuantity() * list.getValue().getFood().getPrice_food()%> VND</p>
							<p style="display: none" class="id_SP"><%=list.getKey()%></p>
							<p style="display: none" class="name_SP"><%=list.getValue().getFood().getName_food()%></p>
						</td>
						<td style="text-align: center"><button
								class='btn btn-info delete-items'>
								<img style="width: 25px; height: 25px;" class='icon-option'
									src='images/-trash.png'>
							</button></td>
					</tr>

					<%
						}
					%>
				</tbody>
			</table>
		</div>
		<div
			style="width: 500px; height: 140px; background: white; margin-left: 250px;">
			<p style="font-weight: bold; font-size: medium;">Thông tin đơn
				hàng</p>
			<p style="font-size: medium; border-bottom: 0.5px solid gray">
				Tạm tính: <span style="margin-left: 250px"><%=Card_item.total()%> VND</span>
			</p>
			<p style="font-size: medium; border-bottom: 0.5px solid gray">
				Tổng tiền (Đã bao gồm VAT): <span style="margin-left: 110px"><%=Card_item.total()%> VND</span>
			</p>
			<button
				style="background: #F37021; height: 40px; margin-left: 220px; width: 280px; color: white; font-size: large">
				<a href="payment_page.jsp">Tiến hành thanh toán</a></button>


		</div>

	</div>
	<script>
		$(document)
				.ready(

						function() {
							
							if (parseInt($('.food_quantity_show').val(), 10) > 4) {
								$('.inscrease_quantity').prop('disabled', true);
							}

							$('.delete-items')
									.on(
											'click',
											function() {
												var choice = confirm('Chắc chắn xóa? '
														+ $(this)
																.closest('tr')
																.find(
																		'.name_SP')
																.text());
												if (choice === true) {
													window.location = 'Card_servlet?command=remove&&food_id='
															+ $(this).closest(
																	'tr').find(
																	'.id_SP')
																	.text();
												}
												return false;
											});

							$('.descrease_quantity')
									.on(
											'click',
											function() {
												if (parseInt($(this).closest(
														'tr').find(
														'.food_quantity_show')
														.val(), 10) == 1) {
													var choice = confirm('Chắc chắn xóa? '
															+ $(this).closest(
																	'tr').find(
																	'.name_SP')
																	.text());
													if (choice === true) {
														window.location = 'Card_servlet?command=remove&&food_id='
																+ $(this)
																		.closest(
																				'tr')
																		.find(
																				'.id_SP')
																		.text();
													}
													return false;
												}
												window.location = 'Card_servlet?command=descrease&&food_id='
														+ $(this).closest('tr')
																.find('.id_SP')
																.text();

											});
							$('.inscrease_quantity')
									.on(
											'click',
											function() {

												window.location = 'Card_servlet?command=increase&&food_id='
														+ $(this).closest('tr')
																.find('.id_SP')
																.text();

											});

						});
	</script>
</body>
</html>