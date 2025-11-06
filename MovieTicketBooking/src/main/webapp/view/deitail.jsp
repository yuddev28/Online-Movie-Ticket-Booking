<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Chi Tiết Phim - MY CINEMA</title>
</head>
<body>
    <!-- Navbar -->
    <nav>
        <div class="nav-bar">
            <i class='bx bx-menu sideBarOpen'></i>
            <span class="logo navLogo"><a href="home.jsp">MY CINEMA</a></span>
            <div class="menu">
                <div class="logo-toggle">
                    <span class="logo"><a href="home.jsp">MY CINEMA</a></span>
                    <i class='bx bx-x sideBarClose'></i>
                </div>
                <ul class="nav-links">
                    <li><a href="home.jsp">Trang chủ</a></li>
                    <li><a href="#">Phim</a></li>
                    <li><a href="#">Rạp</a></li>
                    <li><a href="#">Giới thiệu</a></li>
                    <li><a href="#">Liên hệ</a></li>
                </ul>
            </div> 
            <div class="darkLight-searchBox">
                <div class="dark-Light">
                    <i class='bx bx-moon moon'></i>
                    <i class='bx bx-sun sun'></i>
                </div>
                <div class="searchBox">
                    <div class="searchToggle">
                        <i class='bx bx-x cancel'></i>
                        <i class='bx bx-search search'></i>
                    </div>  
                    <div class="search-field">
                        <input type="text" placeholder="tìm kiếm...." >
                        <i class='bx bx-search'></i>
                    </div>    
                </div>
            </div>
            <div class="login">
                <a class="a-login" href="login.jsp">Đăng nhập</a> <!-- Liên kết đến login.jsp -->
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="movie-hero py-5" style="background-color: var(--movie-bg); margin-top: 70px;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-4 text-center mb-4 mb-md-0">
                    <img src="https://via.placeholder.com/300x450?text=C%E1%BB%A6c+V%C3%A0ng+C%E1%BB%A7a+Ngo%E1%BA%A1i" alt="Poster phim" class="img-fluid rounded shadow">
                </div>
                <div class="col-md-8">
                    <h1 class="display-4 fw-bold mb-3" style="color: var(--text-dark);">CỤC VÀNG CỦA NGOẠI (T13)</h1>
                    <div class="row mb-3">
                        <div class="col-md-3">
                            <span class="badge bg-secondary" style="background-color: var(--coming-text);">T13</span>
                        </div>
                        <div class="col-md-3">
                            <small style="color: var(--text-gray);">Thời lượng: 119'</small>
                        </div>
                        <div class="col-md-3">
                            <small style="color: var(--text-gray);">Thể loại: Gia đình, Tâm Lý</small>
                        </div>
                        <div class="col-md-3">
                            <small style="color: var(--text-gray);">Xuất xứ: Việt Nam</small>
                        </div>
                    </div>
                    <p class="lead mb-3" style="color: var(--text-dark);">Khởi chiếu: Thứ Sáu, 17/10/2025 | Định dạng: 2D</p>
                    <div class="d-flex gap-2 mb-4">
                        <a href="#" class="btn btn-primary px-4" style="background-color: var(--nav-color); border-color: var(--nav-color);">Chọn Rạp</a>
                        <a href="#" class="btn btn-outline-primary px-4" style="border-color: var(--nav-color); color: var(--nav-color);"><i class='bx bx-play-circle'></i> Trailer</a>
                    </div>
                    <div class="d-flex align-items-center">
                        <span class="badge bg-warning text-dark me-2" style="background-color: var(--rating-gold);">
                            <i class='bx bxs-star'></i> 8.5
                        </span>
                        <small style="color: var(--text-gray);">Dựa trên đánh giá người dùng</small>
                    </div>
                    <div class="mt-3">
                        <a href="home.jsp" class="btn btn-secondary">Quay về Trang chủ</a> <!-- Thêm liên kết về home -->
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Các section khác giữ nguyên: Synopsis, Cast, Trailer, Showtimes -->
    <!-- ... (Giữ nguyên nội dung từ file gốc, chỉ thêm liên kết "Đặt Vé Ngay" nếu cần) ... -->
    <section class="showtimes py-5" style="background-color: var(--coming-bg);">
        <div class="container">
            <h2 class="mb-4 text-center" style="color: var(--coming-text);">Lịch Chiếu</h2>
            <!-- ... Nội dung lịch chiếu ... -->
            <div class="text-center mt-4">
                <a href="home.jsp" class="btn btn-primary px-4 py-2" style="background-color: var(--book-blue); border-color: var(--book-blue);">Đặt Vé Ngay (Về Trang chủ)</a>
            </div>
        </div>
    </section>

    <!-- Footer giữ nguyên -->
    <!-- ... -->

    <!-- Scripts giữ nguyên -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="script.js"></script>
    <script>
        // Dark mode, search, sidebar scripts giữ nguyên
        // ...
    </script>
</body>
</html>