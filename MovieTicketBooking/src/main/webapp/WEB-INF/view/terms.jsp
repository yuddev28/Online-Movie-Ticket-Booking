<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Điều khoản sử dụng</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css"/>
  <style>
    .static-wrap{max-width:1000px;margin:24px auto;padding:0 16px;}
    .static-card{background:#fff;border:1px solid #eee;border-radius:12px;padding:18px;box-shadow:0 6px 18px rgba(0,0,0,.06)}
    .static-card h1{margin:0 0 10px;font-size:24px}
    .muted{color:#666;margin:0 0 16px;line-height:1.6}
    .sec{margin-top:16px}
    .sec h2{margin:0 0 10px;font-size:16px}
    .sec ul{margin:0;padding-left:18px;line-height:1.7}
    .back{display:inline-block;margin-top:16px;text-decoration:none}
  </style>
</head>
<body>
  <jsp:include page="/WEB-INF/view/header.jsp"/>

  <main class="static-wrap">
    <div class="static-card">
      <h1>Điều khoản sử dụng</h1>
      <p class="muted">Bằng việc sử dụng MyCinema, bạn đồng ý với các điều khoản dưới đây.</p>

      <div class="sec">
        <h2>1) Tài khoản</h2>
        <ul>
          <li>Bạn chịu trách nhiệm bảo mật thông tin đăng nhập.</li>
          <li>Không sử dụng dịch vụ cho mục đích vi phạm pháp luật.</li>
        </ul>
      </div>

      <div class="sec">
        <h2>2) Đặt vé & thanh toán</h2>
        <ul>
          <li>Đơn hàng chỉ hoàn tất khi thanh toán thành công.</li>
          <li>Thông tin giá vé/ghế/ưu đãi hiển thị tại thời điểm đặt.</li>
        </ul>
      </div>

      <div class="sec">
        <h2>3) Hành vi bị cấm</h2>
        <ul>
          <li>Can thiệp hệ thống, khai thác lỗ hổng, spam, phá hoại dịch vụ.</li>
        </ul>
      </div>

      <a class="back" href="${pageContext.request.contextPath}/home">← Về trang chủ</a>
    </div>
  </main>

  <jsp:include page="/WEB-INF/view/footer.jsp"/>
</body>
</html>
