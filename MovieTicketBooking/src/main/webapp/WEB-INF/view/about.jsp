<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Giới thiệu - MyCinema</title>

  <!-- Không dùng EL -->
  <link rel="stylesheet" href="styles.css"/>
</head>
<body>
  <jsp:include page="/WEB-INF/view/header.jsp"/>

  <main class="static-page">
    <div class="static-card">
      <h1>Giới thiệu</h1>
      <p class="static-muted">
        MyCinema là hệ thống đặt vé xem phim trực tuyến, giúp bạn xem thông tin phim, lịch chiếu và đặt vé nhanh chóng.
      </p>

      <div class="static-section">
        <h2>Tính năng chính</h2>
        <ul>
          <li>Xem phim đang chiếu / sắp chiếu.</li>
          <li>Xem chi tiết phim và điều hướng đặt vé.</li>
          <li>Tìm kiếm phim theo từ khóa.</li>
        </ul>
      </div>

      <a class="static-back" href="home">← Về trang chủ</a>
    </div>
  </main>

  <jsp:include page="/WEB-INF/view/footer.jsp"/>
</body>
</html>
