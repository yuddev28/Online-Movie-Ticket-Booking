<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Chính sách thanh toán</title>
  <link rel="stylesheet" href="styles.css"/>
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
      <h1>Chính sách thanh toán</h1>
      <p class="muted">Quy định về phương thức thanh toán và xử lý giao dịch.</p>

      <div class="sec">
        <h2>1) Phương thức thanh toán</h2>
        <ul>
          <li>Thẻ nội địa/quốc tế (tùy tích hợp).</li>
          <li>Ví điện tử (tùy tích hợp).</li>
          <li>Thanh toán tại quầy (nếu hệ thống hỗ trợ).</li>
        </ul>
      </div>

      <div class="sec">
        <h2>2) Xác nhận giao dịch</h2>
        <ul>
          <li>Đơn hàng chỉ xác nhận khi thanh toán thành công.</li>
          <li>Nếu thanh toán thất bại, đơn có thể tự hủy sau một khoảng thời gian.</li>
        </ul>
      </div>

      <a class="back" href="home">← Về trang chủ</a>
    </div>
  </main>

  <jsp:include page="/WEB-INF/view/footer.jsp"/>
</body>
</html>
