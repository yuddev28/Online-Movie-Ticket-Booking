<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Chính sách đổi/hoàn vé</title>
<link rel="stylesheet" href="styles.css" />
<style>
.static-wrap {
	max-width: 1000px;
	margin: 24px auto;
	padding: 0 16px;
}

.static-card {
	background: #fff;
	border: 1px solid #eee;
	border-radius: 12px;
	padding: 18px;
	box-shadow: 0 6px 18px rgba(0, 0, 0, .06)
}

.static-card h1 {
	margin: 0 0 10px;
	font-size: 24px
}

.muted {
	color: #666;
	margin: 0 0 16px;
	line-height: 1.6
}

.sec {
	margin-top: 16px
}

.sec h2 {
	margin: 0 0 10px;
	font-size: 16px
}

.sec ul {
	margin: 0;
	padding-left: 18px;
	line-height: 1.7
}
 
.back {
	display: inline-block;
	margin-top: 16px;
	text-decoration: none
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/header.jsp" />

	<main class="static-wrap">
		<div class="static-card">
			<h1>Chính sách đổi/hoàn vé</h1>
			<p class="muted">Bạn có thể chỉnh nội dung theo nghiệp vụ của hệ
				thống.</p>

			<div class="sec">
				<h2>1) Trường hợp được hỗ trợ</h2>
				<ul>
					<li>Thanh toán lỗi nhưng bị trừ tiền (cần đối soát).</li>
					<li>Suất chiếu bị hủy do rạp/hệ thống (nếu áp dụng).</li>
				</ul>
			</div>

			<div class="sec">
				<h2>2) Trường hợp không hỗ trợ</h2>
				<ul>
					<li>Thay đổi ý định sau khi đặt vé thành công (tùy chính
						sách).</li>
					<li>Vắng mặt/đến trễ so với giờ chiếu.</li>
				</ul>
			</div>

			<div class="sec">
				<h2>3) Quy trình</h2>
				<ul>
					<li>Gửi mã đơn hàng + thông tin giao dịch cho bộ phận hỗ trợ.</li>
					<li>Thời gian xử lý phụ thuộc đơn vị thanh toán/ngân hàng.</li>
				</ul>
			</div>

			<a class="back" href="home">← Về trang chủ</a>
		</div>
	</main>

	<jsp:include page="/WEB-INF/view/footer.jsp" />
</body>
</html>
