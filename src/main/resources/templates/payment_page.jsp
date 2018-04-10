<%@page import="dao.Dao"%>
<%@page import="model.Item"%>
<%@page import="model.Card_item"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Calendar"%>
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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
<script>
	$(function() {
		$("#datepicker").datepicker();
	});
</script>
</head>
<body>
	<%
		Card_item card_item = (Card_item) session.getAttribute("card");
		if (card_item == null) {
			card_item = new Card_item();
			session.setAttribute("card", card_item);
		}
		String product = "";
		String quantity_product = "";
		for (Map.Entry<String, Item> list : card_item.getCartItems().entrySet()) {
			product += list.getValue().getFood().getId_food()+ "-";
			quantity_product  += list.getValue().getQuantity() + "-";
			
		}
		
	%>

	<div
		style="width: 600px; height: 600px; border: 0.5px solid black; margin-left: 380px; float: left;">
		<h1 style="background: #183544; margin-top: -0px; color: white;">
			<a href="new_food.jsp"
				style="text-decoration: none; margin-left: 20px;">TTS Food</a>
		</h1>
		
		<div class="dialog_step_2"
			style="width: 500px; height: 550px; background: white; margin-left: 50px; margin-top: -10px; display: none">
			<h3
				style="font-weight: bold; text-align: center; color: blue; margin-top: 0px;">Thông
				tin đơn hàng</h3>
			<p style="font-weight: bold; margin-left: 5px; font-size: medium;">Chi
				tiết đơn hàng</p>
			<div
				style="width: 500px; height: 200px; overflow: auto; border-bottom: 0.5px solid black">

				<table class="table  table-hover"
					style="width: 500px; height: auto; background: silver; border: 0.5px solid black;">
					<%
						//HttpSession session = request.getSession();

						for (Map.Entry<String, Item> list : card_item.getCartItems().entrySet()) {
					%>
					<tr style="height: 50px">
						<td style="width: 300px;"><%=list.getValue().getQuantity()%>
							<%=list.getValue().getFood().getName_food()%></td>
						<td style="width: 100px;"><%=list.getValue().getQuantity() * list.getValue().getFood().getPrice_food()%> VND</td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			<div
				style="width: 500px; height: 240px; background: white; margin-top: 20px; font-size: 13px">
				<p
					style="font-size: medium; border-bottom: 0.5px solid gray; font-weight: bold;">
					Tổng cộng <span style="margin-left: 255px; font-weight: bold;"><%=Card_item.total()%> VND</span>
				</p>
				<p
					style="font-size: medium; border-bottom: 0.5px solid gray; font-weight: bold;">
					phí vận chuyển <span style="margin-left: 220px; font-weight: bold;">20000 VND</span>
				</p>
				<p
					style="font-size: medium; border-bottom: 0.5px solid gray; font-weight: bold;">
					Tạm tính <span class="sum_order"
						style="margin-left: 270px; font-weight: bold;"><%=Card_item.total() + 20000%> VND</span>
				</p>
				<p>
					Phương thức thanh toán <input type="radio" value="online"
						name="payment_type" style="margin-left: 115px;"> Thanh
					toán ngân lượng
				</p>
				<input type="radio" value="offline" name="payment_type"
					 style="margin-left: 260px;"> Thanh toán
				khi nhận hàng
				<button type="button" class="back_1"
					style="background: gray; height: 40px; width: 100px; color: white; font-size: large; margin-top: 30px; margin-left: 295px; font-weight: bold;">Trở
					về</button>
				<button
					style="background: red; height: 40px; width: 100px; color: white; font-size: large; margin-top: 30px; font-weight: bold;">
					<%
						String id_cart = "CA_" + Dao.checkID("cart_info");
						String id_oder = "OR_" + Dao.checkID("order_info");
						Integer sum = Card_item.total() + 20000;
					%>
					<a class="submit_payment" style="text-decoration: none"> Tiếp
						tục</a>
				</button>


			</div>

		</div>
		<div class="dialog_step_1"
			style="width: 500px; height: 500px; background: white; margin-left: 50px; margin-top: -10px;">
			<h3 style="font-weight: bold; text-align: center; color: blue">Thời
				gian & Địa chỉ nhận hàng</h3>
			<p style="font-weight: bold; margin-left: 10px;">Địa điểm nhận
				hàng</p>
			<div style="height: 450px; margin-left: 100px">
				<p style="font-size: medium;">
					Họ tên: <input class="full_name" type="text"
						style="margin-left: 50px; width: 240px">
				</p>
				<p style="font-size: medium;">
					Số ĐT: <input class="mobile_number" type="text"
						style="margin-left: 55px; width: 240px">
				</p>
				<p style="font-size: medium;">
					Địa chỉ:
					<textarea rows="4" cols="27" class="address"
						style="margin-left: 50px; resize: none"></textarea>
				</p>
				<p style="font-size: medium;">
					Ghi chú:
					<textarea rows="4" cols="27" class="note"
						style="margin-left: 45px; resize: none"></textarea>
				</p>
				<hr>
				<p style="font-size: medium; margin-left: -90px; font-weight: bold;">
					Thời gian nhận hàng</p>
				<input type="text" class="date_ship" id="datepicker"
					value="<%=new java.sql.Date(Calendar.getInstance().getTime().getTime())%>"
					style="margin-left: 115px; width: 90px; height: 40px; font-weight: bold; font-size: medium;">
				<select class="time_ship"
					style="width: 145px; height: 40px; font-weight: bold; font-size: small;">
					<option value="soon">Càng sớm càng tốt</option>
					<option value="9:00">9:00</option>
					<option value="9:15">9:15</option>
					<option value="9:30">9:30</option>
					<option value="9:45">9:45</option>
					<option value="10:00">10:00</option>
					<option value="10:15">10:15</option>
					<option value="10:30">10:30</option>
					<option value="10:45">10:45</option>
					<option value="11:00">11:00</option>
					<option value="11:15">11:15</option>
					<option value="11:30">11:30</option>
					<option value="11:45">11:45</option>
					<option value="12:00">12:00</option>
					<option value="12:15">12:15</option>
					<option value="12:30">12:30</option>
					<option value="12:45">12:45</option>
					<option value="13:00">13:00</option>
					<option value="13:15">13:15</option>
					<option value="13:30">13:30</option>
					<option value="13:45">13:45</option>
					<option value="14:00">14:00</option>
					<option value="14:15">14:15</option>
					<option value="14:30">14:30</option>
					<option value="14:45">14:45</option>
					<option value="15:00">15:00</option>
					<option value="15:15">15:15</option>
					<option value="15:30">15:30</option>
					<option value="15:45">15:45</option>
					<option value="16:00">16:00</option>
					<option value="16:15">16:15</option>
					<option value="16:30">16:30</option>
					<option value="16:45">16:45</option>
					<option value="17:00">17:00</option>
					<option value="17:15">17:15</option>
					<option value="17:30">17:30</option>
					<option value="17:45">17:45</option>
					<option value="18:00">18:00</option>
					<option value="18:15">18:15</option>
					<option value="18:30">18:30</option>
					<option value="18:45">18:45</option>
					<option value="19:00">19:00</option>
					<option value="19:15">19:15</option>
					<option value="19:30">19:30</option>
					<option value="19:45">19:45</option>
					<option value="20:00">20:00</option>
					<option value="20:15">20:15</option>
					<option value="20:30">20:30</option>
					<option value="20:45">20:45</option>
					<option value="21:00">21:00</option>
					<option value="21:15">21:15</option>
					<option value="21:30">21:30</option>
					<option value="21:45">21:45</option>
					<option value="22:00">22:00</option>
					<option value="22:15">22:15</option>
					<option value="22:30">22:30</option>
					<option value="22:45">22:45</option>
					<option value="23:00">23:00</option>

				</select>
			</div>
			<button class="step_2"
				style="background: red; height: 40px; margin-left: 350px; width: 100px; color: white; font-size: large; margin-top: -20px">
				Tiếp tục</button>


		</div>

	</div>

	<script>
		$(document)
				.ready(

						function() {
							$('.step_2').on('click', function() {
								$('.dialog_step_2').css("display", "block");
								$('.dialog_step_1').css("display", "none");

							});
							$('.back_1').on('click', function() {
								$('.dialog_step_2').css("display", "none");
								$('.dialog_step_1').css("display", "block");

							});

							$('input[name=payment_type]:radio')
									.on(
											'change',
											function() {
												if ($('input[name=payment_type]:checked').val() == "online") {
													$('.submit_payment')
															.attr(
																	"href",
																	"https://www.nganluong.vn/button_payment.php?receiver=taitatsang@gmail.com&product_name=<%= id_oder%>&price=<%= sum%>&return_url=Add_order_online?full_name="
																		+ $(
																		'.full_name')
																		.val()
																		+ "&products=<%= product%>"
																		+ "&quantitys=<%= quantity_product%>"
																		+ "&id_order=<%= id_oder%>"
																		+ "&sum_order=<%= sum%>"
																+ "&mobile_number="
																+ $(
																		'.mobile_number')
																		.val()
																+ "&address="
																+ $(
																		'.address')
																		.val()
																+ "&note="
																+ $(
																	'.note')
																	.val()
																+ "&date_ship="
															+ $(
																		'.date_ship')
																		.val()
																+ "&time_ship="
																+ $(
																		'.time_ship')
																		.val()
																+ "&payment_type=offline&comments=đơn hàng demo");
												}  
														
											});
							$('input[name=payment_type]:radio')
							.on(
									'change',
									function() {

							
										 if ($('input[name=payment_type]:checked').val() == "offline") {
											$('.submit_payment')
													.attr(
															"href",
															"Add_cart_Servlet?full_name="
																	+ $(
																			'.full_name')
																			.val()
																	+ "&mobile_number="
																	+ $(
																			'.mobile_number')
																			.val()
																	+ "&address="
																	+ $(
																			'.address')
																			.val()
																	+ "&note="
																	+ $(
																		'.note')
																		.val()
																	+ "&date_ship="
																+ $(
																			'.date_ship')
																			.val()
																	+ "&time_ship="
																	+ $(
																			'.time_ship')
																			.val()
																	);
										}
												
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