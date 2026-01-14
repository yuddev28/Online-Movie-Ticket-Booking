<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Liên hệ - MyCinema</title>
  <link rel="stylesheet" href="styles.css"/>
</head>
<body>
  <jsp:include page="/WEB-INF/view/header.jsp"/>

  <main class="static-page">
    <div class="static-card">
      <h1>Liên hệ</h1>
      <p class="static-muted">Nếu bạn cần hỗ trợ, vui lòng liên hệ theo thông tin bên dưới.</p>

      <div class="static-section">
        <h2>Thông tin hỗ trợ</h2>
        <ul>
          <li>Hotline: 1900 0000</li>
          <li>Email: golike000004@gmail.com</li>
          <li>Giờ làm việc: 08:00 – 22:00</li>
        </ul>
      </div>

      <a class="static-back" href="home">← Về trang chủ</a>
    </div>
  </main>

  <jsp:include page="/WEB-INF/view/footer.jsp"/>
</body>
</html>
