<%@page import="model.Card_info"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="model.Order_info"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.Dao"%>
<%@page import="model.Item"%>
<%@page import="model.Card_item"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.StringTokenizer"%>
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
		ArrayList<Order_info> list_order = Dao.getListOrder();
		if(session.getAttribute("user_webTMDT") == null){
			response.sendRedirect("login_page.jsp");
		}
		String id_order = null;
		if(request.getParameter("id_order") != null){
		 id_order = request.getParameter("id_order").toString();
		}
	%>

	<div
		style="width: 600px; height: 620px; border: 0.5px solid black; margin-left: 380px; float: left;display: block">
		<h1 style="background: #183544; margin-top: -0px; color: white;">
			<a href="new_food.jsp"
				style="text-decoration: none; margin-left: 20px;">TTS Food</a>
		</h1>
	
		<div 
			style="width: 500px; height: 500px; background: white; margin-left: 50px; margin-top: -10px;">
			<h3 style="font-weight: bold; text-align: center; color: blue">Hoàn tất</h3>
			<p style="font-weight: bold; margin-left: 10px;"><span>Tổng đơn hàng: <%= Dao.getSumOrder(id_order)%></span></p>
			
			<div
				style="width: 500px; height: 200px; overflow: auto; border-bottom: 0.5px solid black">

				<table class="table  table-hover"
					style="width: 500px; height: auto; background: white; border: 0.5px solid black;">
					<%
						Card_info card_info = Dao.getCart_info(id_order);
						StringTokenizer splitfood = new StringTokenizer(card_info.getId_food(), "-");
						StringTokenizer splitquantity = new StringTokenizer(card_info.getQuantity(), "-");
						ArrayList<String> listtmpfood = new ArrayList();
						ArrayList<String> listtmpquantity = new ArrayList();
						while(splitfood.hasMoreElements()){
							listtmpfood.add(splitfood.nextToken());
							
						}
						while(splitquantity.hasMoreElements()){
						listtmpquantity.add(splitquantity.nextToken())	;
						}
						
						
						for(int i = 0 ; i < listtmpfood.size(); i++){
					%>
					<tr style="height: 50px">
						<td style="width: 300px;"><span style="color: red"><%=listtmpquantity.get(i)%></span>
							<%= Dao.getFoodFromID(listtmpfood.get(i))%></td>
						
					</tr>
					<%
						
						}
					%>
				</table>
				
				
			</div>
			<p style="font-weight: bold; margin-left: 10px;">Địa điểm nhận
				hàng</p>
			<div style="height: 250px; margin-left: 100px">
			<% 
			String hoten,sodt,diachi,ghichu,ngay,gio,thanhtoan = "";
			for(Order_info order_info : list_order){
				if(id_order.equals(order_info.getId_oder_info())){
					StringTokenizer info = new StringTokenizer(order_info.getPaymentInfo(),"_");
					
					while(info.hasMoreElements()){
						thanhtoan = info.nextToken();
						hoten = info.nextToken();
						sodt = info.nextToken();
						diachi = info.nextToken();
						ghichu = info.nextToken();
						ngay = info.nextToken();
						gio = info.nextToken();
					
					
					
					%>
				
				<p style="font-size: medium;">
					Họ tên: <span><%= hoten%></span>
				</p>
				<p style="font-size: medium;">
					Số ĐT: <span><%= sodt%></span>
				</p>
				<p style="font-size: medium;">
					Địa chỉ: <span><%= diachi%></span>
					
				</p>
				<p style="font-size: medium;">
					Ghi chú: <span><%= ghichu%></span>
					
				</p>
				<hr>
				<p style="font-size: medium; margin-left: -90px; font-weight: bold;">
					Thời gian nhận hàng  <span style="font-size: small;margin-left: 100px"> <%= ngay%></span> <span style="font-size: small"><%= gio %></span></p>
					<% 
					if(thanhtoan.equals("online")){
						%>
						<p style="font-size: medium; margin-left: -90px; font-weight: bold;">
					Thanh toán <span style="font-size: small;margin-left: 170px">đã thanh toán</span></p>
					<% 
						
					}
					if(thanhtoan.equals("offline")){
						%>
						<p style="font-size: medium; margin-left: -90px; font-weight: bold;">
					Thanh toán <span style="font-size: small;margin-left: 170px">thanh toán khi nhận hàng</span></p>	
					<% 
					}
					
					
				
					
					
					
				}
				}
				}
			%>		
					
				
					
					
				
			</div>
			<button class="step_2"
				style="background: red; height: 40px; margin-left: 400px; width: 100px; color: white; font-size: large; margin-top: -20px">
				<a href="new_food.jsp">Trang chủ</a></button>


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
																	+ "&payment_type=offline");
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