<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css"> <!-- Link file CSS tùy chỉnh -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'> <!-- Boxicons -->
    <!-- Bootstrap CSS cho modal (giả sử sử dụng Bootstrap 5 để hỗ trợ data-bs-toggle) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Đăng nhập / Đăng ký - MY CINEMA</title>
</head>
<body>
    <!-- Navbar (giữ nguyên từ loign.jsp) -->
    <nav>
        <div class="nav-bar">
            <i class='bx bx-menu sideBarOpen'></i>
            <span class="logo navLogo"><a href="#">MY CINEMA</a></span>
            <!-- menu bar -->
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
                <a class="a-login" href="#" data-bs-toggle="modal" data-bs-target="#loginModal">Đăng nhập</a>
            </div>
        </div>
    </nav>

    <!-- Modal Đăng nhập / Đăng ký (dựa trên thiết kế Cinestar: tab cho Login/Register, form đơn giản với email/số ĐT, mật khẩu, checkbox điều khoản cho đăng ký) -->
    <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <!-- Header Modal -->
                <div class="modal-header border-0">
                    <h5 class="modal-title" id="loginModalLabel">Đăng nhập / Đăng ký</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <!-- Body Modal với Tabs (tương tự Cinestar: tab Login và Register) -->
                <div class="modal-body p-0">
                    <ul class="nav nav-tabs justify-content-center mb-0" id="authTabs" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="login-tab" data-bs-toggle="tab" data-bs-target="#login-tab-pane" type="button" role="tab">Đăng nhập</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="register-tab" data-bs-toggle="tab" data-bs-target="#register-tab-pane" type="button" role="tab">Đăng ký</button>
                        </li>
                    </ul>
                    <div class="tab-content p-4">
                        <!-- Tab Đăng nhập (tương tự Cinestar: input email/số ĐT, password, nút login, link quên mật khẩu) -->
                        <div class="tab-pane fade show active" id="login-tab-pane" role="tabpanel">
                            <form id="loginForm" action="#" method="post">
                                <div class="mb-3">
                                    <label for="loginEmail" class="form-label">Email hoặc Số điện thoại</label>
                                    <input type="text" class="form-control" id="loginEmail" name="loginEmail" placeholder="Nhập email hoặc số điện thoại" required>
                                </div>
                                <div class="mb-3">
                                    <label for="loginPassword" class="form-label">Mật khẩu</label>
                                    <input type="password" class="form-control" id="loginPassword" name="loginPassword" placeholder="Nhập mật khẩu" required>
                                </div>
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="rememberMe">
                                        <label class="form-check-label" for="rememberMe">Ghi nhớ đăng nhập</label>
                                    </div>
                                    <a href="#" class="text-decoration-none">Quên mật khẩu?</a>
                                </div>
                                <button type="submit" class="btn btn-primary w-100 mb-2">Đăng nhập</button>
                                <p class="text-center mb-0">Hoặc đăng nhập bằng</p>
                                <div class="d-flex justify-content-center gap-2 mt-2">
                                    <button type="button" class="btn btn-outline-secondary"><i class='bx bxl-facebook'></i></button>
                                    <button type="button" class="btn btn-outline-secondary"><i class='bx bxl-google'></i></button>
                                </div>
                            </form>
                        </div>
                        <!-- Tab Đăng ký (tương tự Cinestar: họ tên, email/số ĐT, password, xác nhận password, checkbox điều khoản, nút đăng ký) -->
                        <div class="tab-pane fade" id="register-tab-pane" role="tabpanel">
                            <form id="registerForm" action="#" method="post">
                                <div class="mb-3">
                                    <label for="registerName" class="form-label">Họ và tên</label>
                                    <input type="text" class="form-control" id="registerName" name="registerName" placeholder="Nhập họ và tên" required>
                                </div>
                                <div class="mb-3">
                                    <label for="registerEmail" class="form-label">Email hoặc Số điện thoại</label>
                                    <input type="text" class="form-control" id="registerEmail" name="registerEmail" placeholder="Nhập email hoặc số điện thoại" required>
                                </div>
                                <div class="mb-3">
                                    <label for="registerPassword" class="form-label">Mật khẩu</label>
                                    <input type="password" class="form-control" id="registerPassword" name="registerPassword" placeholder="Nhập mật khẩu (ít nhất 6 ký tự)" required>
                                </div>
                                <div class="mb-3">
                                    <label for="confirmPassword" class="form-label">Xác nhận mật khẩu</label>
                                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Nhập lại mật khẩu" required>
                                </div>
                                <div class="mb-3">
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="terms" required>
                                        <label class="form-check-label" for="terms">Tôi đồng ý với <a href="#" class="text-decoration-none">Điều khoản sử dụng</a> và <a href="#" class="text-decoration-none">Chính sách bảo mật</a></label>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary w-100 mb-2">Đăng ký</button>
                                <p class="text-center mb-0">Hoặc đăng ký bằng</p>
                                <div class="d-flex justify-content-center gap-2 mt-2">
                                    <button type="button" class="btn btn-outline-secondary"><i class='bx bxl-facebook'></i></button>
                                    <button type="button" class="btn btn-outline-secondary"><i class='bx bxl-google'></i></button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS cho modal và tabs -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- JavaScript tùy chỉnh cho dark mode và search (giả sử bạn có script riêng, thêm nếu cần) -->
    <script>
        // Dark mode toggle (tích hợp với CSS)
        const darkLight = document.querySelector(".dark-Light");
        darkLight.addEventListener("click", ()=>{
            darkLight.classList.toggle("active");
            document.body.classList.toggle("dark");
        });

        // Search toggle
        const searchToggle = document.querySelector(".searchToggle");
        const searchBar = document.querySelector(".searchBox .search-field");
        searchToggle.addEventListener("click", ()=>{
            searchToggle.classList.toggle("active");
        });

        // Sidebar toggle (cho mobile)
        const sideBarOpen = document.querySelector(".sideBarOpen");
        const sideBarClose = document.querySelector(".sideBarClose");
        const navBar = document.querySelector("nav");
        const menu = document.querySelector(".menu");

        sideBarOpen.addEventListener("click", () => {
            navBar.classList.toggle("active");
            menu.style.left = "0";
        });

        sideBarClose.addEventListener("click", () => {
            navBar.classList.remove("active");
            menu.style.left = "-100%";
        });

        // Validation đơn giản cho form (tùy chọn)
        document.getElementById('registerForm').addEventListener('submit', function(e) {
            const password = document.getElementById('registerPassword').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            if (password !== confirmPassword) {
                e.preventDefault();
                alert('Mật khẩu xác nhận không khớp!');
            }
        });
    </script>
</body>
</html>