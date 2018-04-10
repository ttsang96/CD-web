<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@page import="dao.Dao"%>
<%@page import="java.util.Date"%>
<%@page import="model.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Oswald|Playfair+Display|Roboto"
	rel="stylesheet">
<title>Quy định điều khoản</title>

</head>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
	font-family: "Roboto", sans-serif;
}

.main-header {
	background-color: #ffffff;
	border-bottom: 1px solid #ededed;
	padding: 10px;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	z-index: 1000;
}

.main-container {
	width: 100%;
	position: relative;
	background-color: #EEEEEE;
}
.content{
	padding-top: 70px;
	max-width: 680px;
	margin: auto;
}
.legal h1{
	padding-bottom: 10px;
}
.legal h2{
	padding-bottom: 10px;
	padding-top: 10px;
	font-size: 20px;
}
.legal p{
	padding-top: 10px;
	padding-bottom: 10px;
}
</style>
<body>
<%
		ArrayList<Category> listLH = Dao.getListCategory();
	ArrayList<Food> listSufferFood = Dao.getListSufferFood();
		Card_item card_item = (Card_item) session.getAttribute("card");
		if (card_item == null) {
			card_item = new Card_item();
			session.setAttribute("card", card_item);
		}
		if(session.getAttribute("user_webTMDT") == null){
			response.sendRedirect("login_page.jsp");
		}
	%>
	<div class="main-header">
		<div style=" margin-right: 7%;">
				<div class="filter_bar" style="background: white; margin-top: 0px;">
			<div class="ads"
				style="width: 86%; height: 30px; margin-left: 7%; margin-right: 7%;">
				<a href="new_food.jsp"><img alt="logo" src="images/logo_TTS.png"></a>
				<div id="filter_option_menu"
					style="background: white; width: 95%; margin-top: -30px; height: 30px; margin-left: 9%;">

					<select name="phase_filter" class="phase_filter_selected"
						style="height: 34px">
						<%
							for (Category category : listLH) {
								out.print("<option  value='" + category.getId_category() + "'>" + category.getName_category()
										+ "</option>");
							}
						%>

					</select> <input type="text" class="phase_search"
						style="height: 30px; width: 400px"
						placeholder="Món ăn, nguyên liệu, loại hình..."> <input
						type="submit" class="btn_search" value="Tìm kiếm"
						style="height: 32px; width: 65px;"> <a  href="formula_request.jsp"
						style="margin-left: 10px; overflow: auto !important; text-decoration: none">Đặt
						món ăn theo cách làm</a> <a href="profile_user.jsp"
						style="margin-left: 50px; overflow: auto !important; text-decoration: none; position: relative;"><img
						alt="" src="GetUserImage?your_id=<%= session.getAttribute("user_webTMDT")%>" onerror=this.src="images/chief.png"	style="width: 35px; height: 35px; position: absolute; margin-left: -35px">
						Trang của tôi</a> <span class="tengicungdc"
						style="position: relative;"><a href="card_manage.jsp"
						style="position: absolute; margin-left: 10px; text-decoration: none; top: -30%">
							<img alt="" src="images/icon_cart.png"
							style="width: 32px; height: 32px; margin-left: 10px;">
					</a></span> <span
						style="margin-left: 45px; position: absolute; color: red; font-weight: bold;">
						<%
							if (card_item.getCartItems().size() > 0) {
						%>
						<p
							style="width: 20px; height: 20px; border-radius: 100%; background: red; color: white; line-height: 20px; text-align: center; border: none; cursor: pointer;">
							<%= card_item.getCartItems().size() %>
							</p>

						<%
							}
						%>
					</span>
				</div>
			</div>
		</div>
			</div>
			</div>
	<div class="main-container">
		<div class="content">
          
<div class="legal">
  <h1>Hướng Dẫn Dành Cho Cộng Đồng Sử Dụng TTSFood </h1>

  <h2>Chào mừng bạn đến với TTSFood!</h2>

  <p>Chúng tôi rất vui mừng khi có bạn tham gia cộng đồng TTSFood quốc tế, bao gồm những tín đồ ẩm thực và những đầu bếp tại gia đầy đam mê. Hy vọng bạn cũng có chung niềm yêu thích bếp núc với chúng tôi!</p>

  <p>Khi đăng ký thành công vào cộng đồng TTSFood, bạn sẽ tham gia cùng hàng triệu thành viên yêu thích ẩm thực đăng tải công thức nấu ăn và hình ảnh những tác phẩm ẩm thực của họ. Trước khi bạn bắt đầu, xin lưu ý rằng việc sử dụng trang web của chúng tôi yêu cầu bạn tuân thủ theo các nguyên tắc cộng đồng quy định dưới đây.</p>

  <h2>Trên trang TTSFood</h2>
  <p>Ngay từ đầu, phương châm TTSFood luôn luôn là: "Vui nấu mỗi ngày!" </p>

  <p>Mỗi công thức được đăng trên TTSFood có một câu chuyện độc đáo đằng sau nó. Đó có thể là một bí kíp gia truyền được nâng niu và truyền lại cho bao thế hệ sau, một niềm tự hào thầm kín của một đầu bếp chuyên nghiệp, một sản phẩm của vô số lần sửa đổi, hoặc chỉ đơn giản là kết quả của một phát hiện tình cờ.</p>

  <h2>Chịu trách nhiệm về nội dung bạn đăng tải</h2>
  <p>Bạn có thể chia sẻ công thức nấu ăn của bạn trên TTSFood với cộng đồng, do đó điều hiển nhiên là phép lịch sự và thái độ nhã nhặn là rất quan trọng! Hãy nhớ rằng đây là một trang web công cộng, có thể được truy cập bởi tất cả người dùng. Bạn không được đăng những nội dung có ý đe dọa, quấy rối, phỉ báng, hoặc bôi nhọ người khác. Việc sử dụng những từ ngữ cố ý làm sai lệch hoặc gây hiểu nhầm cũng bị cấm.</p>

  <p>Mục đích của chúng tôi là đảm bảo rằng cộng đồng của chúng ta mang tính đại chúng, thân thiện và an toàn cho tất cả mọi người. TTSFood không chịu trách nhiệm cho lời nói của bạn và có quyền gỡ bỏ những lời bình luận ác ý hoặc chấm dứt tài khoản của những thành viên cố tình liên tiếp đăng tải nội dung không lành mạnh, theo quyết định của chúng tôi.</p>

  <h2>Viết công thức nấu ăn</h2>
  <p>Chúng tôi tin rằng sức mạnh của TTSFood nằm trong sự đa dạng của kỹ thuật nấu nướng và các món ăn được trình bày. Các công thức là kết quả của những kỷ niệm gia đình, những thử nghiệm và sai sót, và có khi là của sự may mắn tuyệt vời. Vì vậy, đừng ngần ngại trong việc đăng tải trải nghiệm ẩm thực của riêng bạn trong một món ăn, thậm chí ngay cả khi bạn nhìn thấy một cái tương tự đã được đăng tải!</p>

  <p>Chúng tôi hiểu rằng nhiều công thức nấu ăn dựa trên những gợi ý từ các chương trình TV, sách dạy nấu ăn, các blog, các trang web, hoặc công thức nấu ăn của người dùng khác. Chúng tôi muốn cho những nguồn cảm hứng đằng sau công thức nấu ăn này của bạn là một phần của nội dung bạn đăng tải, nên cứ tự nhiên và nhớ gửi lời cảm ơn tác giả cũng như ghi chú nguồn tham khảo nhé. Tất nhiên, trong trường hợp chúng tôi nghi ngờ có cơ sở rằng có cố tình đạo văn, công thức của bạn có thể bị xóa và bạn có thể nhận được một cảnh báo từ các nhà quản lý cộng đồng của chúng tôi. Tuy chúng tôi không tán thành việc bêu riếu trước công chúng, nhưng chúng tôi có những biện pháp rất cứng rắn đối với việc cố ý đạo văn.</p>

  <p>Một điều cũng quan trọng nên nhớ là không nên đăng tải những công thức nấu ăn hoặc hình ảnh được bảo hộ quyền tác giả. Mặc dù việc đăng tải công thức lên TTSFood không đòi hỏi phải có hình ảnh, nhưng vui lòng lưu ý rằng bạn nên có ít nhất một hình thành phẩm món ăn làm ảnh đại diện. và hình ảnh này phải là ảnh do chính bạn chụp và thực hiện món mà bạn hướng dẫn. Những hình ảnh không thuộc sở hữu của bạn, được lấy từ nguồn khác đã đăng trên internet hay chụp lại từ sách báo sẽ không được chấp nhận.</p>

  <p>Hơn nữa, đừng quên là khi bạn lên sóng công thức thì sẽ có rất nhiều thành viên của TTSFood trên khắp thế giới muốn áp dụng công thức nấu ăn của bạn trong bếp nhà họ. Vì thế hãy chắc chắn rằng những hướng dẫn của bạn rõ ràng và dễ hiểu, và việc có những hình ảnh đăng kèm trong từng bước làm sẽ rất hữu ích cho người xem làm theo. Với ý nghĩa đó, vui lòng không đăng những hình ảnh không phải là hình thức ăn hay không liên quan đến việc nấu ăn và công thức của bạn. Bởi vì dù sao đi nữa, tất cả chúng ta tham gia vào TTSFood đều với mục đích chung là giúp đỡ lẫn nhau, cùng nhau làm cho công việc nấu nướng ngày càng vui hơn phải không?</p>


  <h2>Chú ý Quyền sở hữu nội dung</h2>
  <p>Nội dung bạn đăng tải khi sử dụng tài khoản TTSFood phải của riêng bạn. Điều này bao gồm hình ảnh được sử dụng trong hồ sơ của bạn, hình ảnh minh họa các bước nấu ăn, hoặc bất cứ điều gì khác được sử dụng trong bài viết công thức của bạn. Nếu sử dụng nội dung không phải là của riêng bạn, trước tiên bạn phải xin phép từ người chủ hoặc nguồn trích dẫn thích hợp trước khi đăng công thức của bạn.</p>

  <h2>Luôn tập trung vào chủ đề</h2>
  <p>Chúng tôi tin rằng một trang web chia sẻ công thức nấu ăn thì chỉ nên xoay quanh chủ đề nấu ăn! Với phương châm này, chúng tôi đã quyết định đưa một số chủ đề vào danh sách “Cấm” trên TTSFood. Những nội dung bị cấm bao gồm, nhưng không giới hạn trong những mục sau: quảng cáo hoặc tiếp thị cho những  hoạt động kinh doanh hay các trang web bên ngoài vì mục đích lợi nhuận, các cuộc tấn công cá nhân, và ngôn ngữ xúc phạm.</p>

  <h2>Chú ý những thuật ngữ bị cấm</h2>
  <p>Có những từ ngữ cụ thể chúng tôi cho là không phù hợp và không thích hợp để sử dụng trên TTSFood. Nếu những từ như vậy được sử dụng trong công thức, hay trong phần bình luận, thì công thức hay bình luận của bạn sẽ không được lưu.</p>

  <h2>Nắm rõ quy tắc</h2>
  <p>Bằng việc đăng ký là thành viên cộng đồng TTSFood, bạn cũng đồng ý với điều khoản sử dụng của chúng tôi. Những hướng dẫn này có thể thay đổi theo thời gian, do đó, xin vui lòng kiểm tra lại thường xuyên.</p>

  <h2>Liên Hệ với Chúng Tôi!</h2>
  <p>Chúng tôi mong muốn được nghe phản hồi từ bạn! Hãy gửi cho chúng tôi thông tin phản hồi hoặc câu hỏi của bạn về trang web. Nếu bạn vô tình phát hiện nội dung có vấn đề, vui lòng đánh dấu bằng cách ghi vào phiếu thông tin phản hồi để gửi đến người quản lý cộng đồng. Chúng tôi sẽ cố gắng giải quyết kín đáo bất kỳ mối quan tâm nào một cách chi tiết và cụ thể nhất. Bạn có thể gửi email cho chúng tôi tại info-vn@TTSFood.com.</p>
</div>

		</div>
	</div>
<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>