<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">  <!-- Link file CSS -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <!-- Bootstrap CSS for responsive grids and components -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>MY CINEMA - Trang chủ</title>
</head>
<body>
    <!--  start navar bar-->
    <nav>
        <div class="nav-bar">
            <i class='bx bx-menu sideBarOpen'></i>
            <span class="logo navLogo"><a href="#">MY CINEMA</a></span>
            <!-- menu bar  -->
            <div class="menu">
                <div class="logo-toggle">
                    <span class="logo"><a href="#">MY CINEMA</a></span>
                    <i class='bx bx-x sideBarClose'></i>
                </div>
                <ul class="nav-links">
                    <li><a href="#">Trang chủ</a></li>
                    <li><a href="#">Phim</a></li>
                    <li><a href="#">Rạp</a></li>
                    <li><a href="#">Giới thiệu</a></li>
                    <li><a href="#">Liên hệ</a></li>
                </ul>
            </div> 
            
            <!-- dark-light mode & searchBox -->
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
            <!-- login -->
            <div class="login">
                <a class="a-login" href="#" data-bs-toggle="modal"
                    data-bs-target="#loginModal">Đăng nhập</a>
            </div>
        </div>
    </nav>
    <!--  end navar bar-->

    <!-- Hero Banner Section (Tương tự Cinestar: Slider với phim nổi bật và nút đặt vé) -->
    <section class="hero-banner" style="background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('https://via.placeholder.com/1920x600?text=Hero+Banner+-+Featured+Movie') center/cover; height: 60vh; display: flex; align-items: center; justify-content: center; color: white; text-align: center; margin-top: 70px;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h1 class="display-4 fw-bold mb-3">Phim Nổi Bật Tuần Này</h1>
                    <p class="lead mb-4">Khám phá những bộ phim bom tấn đang hot nhất. Đặt vé ngay để không bỏ lỡ!</p>
                    <a href="detail.jsp?id=featured" class="btn btn-primary btn-lg px-4 py-2" style="background-color: var(--nav-color); border-color: var(--nav-color);">Đặt Vé Ngay</a>
                </div>
                <div class="col-md-4">
                    <img src="https://via.placeholder.com/300x450?text=Movie+Poster" alt="Poster phim nổi bật" class="img-fluid rounded shadow">
                </div>
            </div>
        </div>
    </section>

    <!-- Phim Đang Chiếu Section (Grid tương tự Cinestar: Hiển thị phim với poster, rating, nút chi tiết) -->
    <section class="movies-section py-5" style="background-color: var(--movie-bg);">
        <div class="container">
            <h2 class="text-center mb-4" style="color: var(--text-dark);">Phim Đang Chiếu</h2>
            <div class="row g-4">
                <!-- Movie Card 1 -->
                <div class="col-md-3">
                    <div class="card h-100 shadow-sm" style="border: none;">
                        <img src="https://via.placeholder.com/250x350?text=Phim+1" class="card-img-top" alt="Phim 1">
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title" style="color: var(--text-dark);">Tên Phim 1</h5>
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <span class="badge bg-warning text-dark" style="background-color: var(--rating-gold);">
                                    <i class='bx bxs-star'></i> 8.5
                                </span>
                                <small style="color: var(--text-gray);">2D, 3D</small>
                            </div>
                            <p class="card-text flex-grow-1" style="color: var(--text-gray);">Mô tả ngắn gọn về phim...</p>
                            <a href="detail.jsp?id=1" class="btn btn-outline-primary mt-auto" style="border-color: var(--nav-color); color: var(--nav-color);">Chi Tiết</a>
                        </div>
                    </div>
                </div>
                <!-- Movie Card 2 -->
                <div class="col-md-3">
                    <div class="card h-100 shadow-sm" style="border: none;">
                        <img src="https://via.placeholder.com/250x350?text=Phim+2" class="card-img-top" alt="Phim 2">
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title" style="color: var(--text-dark);">Tên Phim 2</h5>
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <span class="badge bg-warning text-dark" style="background-color: var(--rating-gold);">
                                    <i class='bx bxs-star'></i> 7.9
                                </span>
                                <small style="color: var(--text-gray);">2D</small>
                            </div>
                            <p class="card-text flex-grow-1" style="color: var(--text-gray);">Mô tả ngắn gọn về phim...</p>
                            <a href="detail.jsp?id=2" class="btn btn-outline-primary mt-auto" style="border-color: var(--nav-color); color: var(--nav-color);">Chi Tiết</a>
                        </div>
                    </div>
                </div>
                <!-- Movie Card 3 -->
                <div class="col-md-3">
                    <div class="card h-100 shadow-sm" style="border: none;">
                        <img src="https://via.placeholder.com/250x350?text=Phim+3" class="card-img-top" alt="Phim 3">
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title" style="color: var(--text-dark);">Tên Phim 3</h5>
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <span class="badge bg-warning text-dark" style="background-color: var(--rating-gold);">
                                    <i class='bx bxs-star'></i> 9.2
                                </span>
                                <small style="color: var(--text-gray);">IMAX</small>
                            </div>
                            <p class="card-text flex-grow-1" style="color: var(--text-gray);">Mô tả ngắn gọn về phim...</p>
                            <a href="detail.jsp?id=3" class="btn btn-outline-primary mt-auto" style="border-color: var(--nav-color); color: var(--nav-color);">Chi Tiết</a>
                        </div>
                    </div>
                </div>
                <!-- Movie Card 4 -->
                <div class="col-md-3">
                    <div class="card h-100 shadow-sm" style="border: none;">
                        <img src="https://via.placeholder.com/250x350?text=Phim+4" class="card-img-top" alt="Phim 4">
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title" style="color: var(--text-dark);">Tên Phim 4</h5>
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <span class="badge bg-warning text-dark" style="background-color: var(--rating-gold);">
                                    <i class='bx bxs-star'></i> 8.0
                                </span>
                                <small style="color: var(--text-gray);">2D, 3D</small>
                            </div>
                            <p class="card-text flex-grow-1" style="color: var(--text-gray);">Mô tả ngắn gọn về phim...</p>
                            <a href="detail.jsp?id=4" class="btn btn-outline-primary mt-auto" style="border-color: var(--nav-color); color: var(--nav-color);">Chi Tiết</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center mt-4">
                <a href="#" class="btn btn-primary px-4 py-2" style="background-color: var(--nav-color); border-color: var(--nav-color);">Xem Thêm Phim</a>
            </div>
        </div>
    </section>

    <!-- Phim Sắp Chiếu Section (Cập nhật link Đặt Vé Trước) -->
    <section class="upcoming-section py-5" style="background-color: var(--coming-bg);">
        <div class="container">
            <h2 class="text-center mb-4" style="color: var(--coming-text);">Phim Sắp Chiếu</h2>
            <div class="row g-4">
                <!-- Upcoming Movie Card 1 -->
                <div class="col-md-3">
                    <div class="card h-100 shadow-sm text-center" style="border: none; background-color: white;">
                        <img src="https://via.placeholder.com/250x350?text=S%E1%BA%AFp+Chi%E1%BB%9Fu+1" class="card-img-top" alt="Sắp Chiếu 1">
                        <div class="card-body">
                            <h5 class="card-title" style="color: var(--text-dark);">Tên Phim Sắp Chiếu 1</h5>
                            <p class="text-muted">Ngày phát hành: 15/11/2025</p>
                            <a href="detail.jsp?id=up1" class="btn btn-outline-primary" style="border-color: var(--book-blue); color: var(--book-blue);">Đặt Vé Trước</a>
                        </div>
                    </div>
                </div>
                <!-- Upcoming Movie Card 2 -->
                <div class="col-md-3">
                    <div class="card h-100 shadow-sm text-center" style="border: none; background-color: white;">
                        <img src="https://via.placeholder.com/250x350?text=S%E1%BA%AFp+Chi%E1%BB%9Fu+2" class="card-img-top" alt="Sắp Chiếu 2">
                        <div class="card-body">
                            <h5 class="card-title" style="color: var(--text-dark);">Tên Phim Sắp Chiếu 2</h5>
                            <p class="text-muted">Ngày phát hành: 22/11/2025</p>
                            <a href="detail.jsp?id=up2" class="btn btn-outline-primary" style="border-color: var(--book-blue); color: var(--book-blue);">Đặt Vé Trước</a>
                        </div>
                    </div>
                </div>
                <!-- Thêm card khác nếu cần -->
            </div>
            <div class="text-center mt-4">
                <a href="#" class="btn btn-primary px-4 py-2" style="background-color: var(--book-blue); border-color: var(--book-blue);">Xem Lịch Chiếu</a>
            </div>
        </div>
    </section>

    <!-- Khuyến Mãi Section (giữ nguyên) -->
    <section class="promo-section py-5" style="background-color: var(--body-color);">
        <div class="container">
            <h2 class="text-center mb-4" style="color: var(--text-dark);">Khuyến Mãi Hot</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card text-center shadow-sm" style="border-left: 5px solid var(--book-red);">
                        <div class="card-body">
                            <i class='bx bx-gift-alt display-4 text-danger mb-3'></i>
                            <h5>Giảm 50% Vé Xem Phim</h5>
                            <p class="text-muted">Áp dụng cho thành viên mới.</p>
                            <a href="#" class="btn btn-danger">Chi Tiết</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center shadow-sm" style="border-left: 5px solid var(--book-blue);">
                        <div class="card-body">
                            <i class='bx bx-ticket display-4 text-primary mb-3'></i>
                            <h5>Mua 1 Tặng 1</h5>
                            <p class="text-muted">Thứ 3 hàng tuần.</p>
                            <a href="#" class="btn btn-primary">Áp Dụng</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center shadow-sm" style="border-left: 5px solid var(--rating-gold);">
                        <div class="card-body">
                            <i class='bx bx-food-menu display-4 text-warning mb-3'></i>
                            <h5>Combo Bắp Nước Giảm Giá</h5>
                            <p class="text-muted">Kèm vé phim.</p>
                            <a href="#" class="btn btn-warning text-white">Đặt Ngay</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer (giữ nguyên) -->
    <footer class="bg-dark text-light py-5" style="background-color: var(--side-nav);">
        <div class="container">
            <div class="row">
                <div class="col-md-4 mb-4">
                    <h5> MY CINEMA </h5>
                    <p>Hệ thống rạp chiếu phim hiện đại, giá vé phải chăng. Mang đến trải nghiệm giải trí đỉnh cao cho mọi người.</p>
                </div>
                <div class="col-md-2 mb-4">
                    <h6>Phim</h6>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-light text-decoration-none">Đang Chiếu</a></li>
                        <li><a href="#" class="text-light text-decoration-none">Sắp Chiếu</a></li>
                        <li><a href="#" class="text-light text-decoration-none">Thể Loại</a></li>
                    </ul>
                </div>
                <div class="col-md-2 mb-4">
                    <h6>Rạp Chiếu</h6>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-light text-decoration-none">TP. HCM</a></li>
                        <li><a href="#" class="text-light text-decoration-none">Hà Nội</a></li>
                        <li><a href="#" class="text-light text-decoration-none">Đà Nẵng</a></li>
                    </ul>
                </div>
                <div class="col-md-2 mb-4">
                    <h6>Hỗ Trợ</h6>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-light text-decoration-none">Liên Hệ</a></li>
                        <li><a href="#" class="text-light text-decoration-none">FAQ</a></li>
                        <li><a href="#" class="text-light text-decoration-none">Chính Sách</a></li>
                    </ul>
                </div>
                <div class="col-md-2 mb-4">
                    <h6>Theo Dõi Chúng Tôi</h6>
                    <div class="d-flex gap-2">
                        <a href="#" class="text-light"><i class='bx bxl-facebook' style='font-size:24px'></i></a>
                        <a href="#" class="text-light"><i class='bx bxl-instagram' style='font-size:24px'></i></a>
                        <a href="#" class="text-light"><i class='bx bxl-youtube' style='font-size:24px'></i></a>
                    </div>
                </div>
            </div>
            <hr class="my-4">
            <div class="text-center">
                <p>&copy; 2025 MY CINEMA. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <!-- Login Modal (giữ nguyên) -->
    <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-0">
                    <h5 class="modal-title" id="loginModalLabel">Đăng Nhập</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email/SĐT</label>
                            <input type="text" class="form-control" id="email">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Mật Khẩu</label>
                            <input type="password" class="form-control" id="password">
                        </div>
                        <button type="submit" class="btn btn-primary w-100" style="background-color: var(--nav-color);">Đăng Nhập</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="script.js"></script>
    <!-- Scripts (giữ nguyên) -->
    <script>
        // Dark mode, search, sidebar như trước
        const darkLight = document.querySelector(".dark-Light");
        darkLight.addEventListener("click", ()=>{
            darkLight.classList.toggle("active");
            document.body.classList.toggle("dark");
        });

        const searchToggle = document.querySelector(".searchToggle");
        searchToggle.addEventListener("click", ()=>{
            searchToggle.classList.toggle("active");
        });

        const sideBarOpen = document.querySelector(".sideBarOpen");
        const sideBarClose = document.querySelector(".sideBarClose");
        const navBar = document.querySelector("nav");
        const menu = document.querySelector(".menu");

        sideBarOpen.addEventListener("click", () => {
            navBar.classList.add("active");
            menu.style.left = "0";
        });

        sideBarClose.addEventListener("click", () => {
            navBar.classList.remove("active");
            menu.style.left = "-100%";
        });
    </script>
</body>
</html>