<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt Vé - Quái Thú Vô Hình: Vùng Đất Chết Chóc - MyCinema</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <div class="top-nav">
            <a href="home.jsp" class="logo">MyCinema</a>
            <ul class="nav-links">
                <li><a href="home.jsp">Trang Chủ</a></li>
                <li class="has-dropdown">
                    <input type="checkbox" id="movieToggle" class="dropdown-toggle">
                    <label for="movieToggle" id="movieLink">Phim</label>
                    <ul class="dropdown">
                        <li><a href="movieShowing.jsp">Phim Đang Chiếu</a></li>
                        <li><a href="movieUpcoming.jsp">Phim Sắp Chiếu</a></li>
                        <li><a href="movies.jsp">Tất Cả Phim</a></li>
                    </ul>
                </li>
                <li><a href="theater.jsp">Rạp</a></li>
                <li><a href="profile.jsp">Tài Khoản</a></li>
            </ul>
            <div class="user-actions">
                <a href="login.jsp" class="btn btn-secondary">Đăng Nhập</a>
                <a href="register.jsp" class="btn">Đăng Ký</a>
            </div>
        </div>
        <div class="search-bar-header">
            <div class="search-container">
                <form>
                    <input type="text" placeholder="Tìm suất chiếu...">
                    <button type="submit">Tìm Kiếm</button>
                </form>
            </div>
        </div>
    </header>

    <main>
        <%-- Movie Hero: Chi tiết phim --%>
        <section class="movie-hero">
            <div class="movie-poster">
                <img src="http://www.impawards.com/2024/posters/a_quiet_place_day_one.jpg" alt="Quái Thú Vô Hình: Vùng Đất Chết Chóc">
            </div>
            <div class="movie-details">
                <h1>Quái Thú Vô Hình: Vùng Đất Chết Chóc (T16)</h1>
                <div class="movie-meta">
                    <span class="meta-tag">PG-13</span>
                    <span class="meta-tag">Kinh Dị</span>
                    <span class="meta-tag">99 phút</span>
                    <span class="meta-tag">Đang Chiếu</span>
                </div>
                <p class="movie-synopsis">Vào ngày mà người ngoài hành tinh tấn công Trái Đất, một nhóm người sống sót ở New York phải tìm cách sống sót trong im lặng tuyệt đối.</p>
                <a href="https://www.youtube.com/watch?v=example" target="_blank" class="trailer-btn">Xem Trailer</a>
            </div>
        </section>

        <%-- Date Tabs: Chọn ngày --%>
        <section class="date-tabs">
            <div class="date-tab active" data-date="09/11">09/11</div>
            <div class="date-tab" data-date="10/11">10/11</div>
            <div class="date-tab" data-date="11/11">11/11</div>
        </section>

        <%-- Theater List: Danh sách rạp accordion --%>
        <section class="theater-list">
            <h2>Chọn Rạp & Suất Chiếu</h2>
            <div class="theater-item active">
                <div class="theater-header">
                    <div>
                        <div class="theater-name">Cinestar Satra Quận 6 (TPHCM)</div>
                        <div class="theater-location">Tầng 4, TTTM Satra, 1466 Võ Văn Kiệt, P.1, Q.6</div>
                    </div>
                    <span class="theater-expand">+</span>
                </div>
                <div class="showtime-list">
                    <div class="showtime-row">
                        <div class="showtime-slot">14:30 (45K)</div>
                        <div class="showtime-slot selected">16:30 (45K)</div>
                        <div class="showtime-slot">19:40 (55K)</div>
                        <div class="showtime-slot">21:50 (55K)</div>
                    </div>
                </div>
            </div>
            <div class="theater-item">
                <div class="theater-header">
                    <div>
                        <div class="theater-name">Cinestar Quận Thanh (TPHCM)</div>
                        <div class="theater-location">271 Nguyễn Trãi, P. Nguyễn Cư Trinh, Q.1</div>
                    </div>
                    <span class="theater-expand">+</span>
                </div>
                <div class="showtime-list">
                    <div class="showtime-row">
                        <div class="showtime-slot">14:30 (45K)</div>
                        <div class="showtime-slot">18:00 (55K)</div>
                        <div class="showtime-slot">20:30 (55K)</div>
                    </div>
                </div>
            </div>
            <div class="theater-item">
                <div class="theater-header">
                    <div>
                        <div class="theater-name">Cinestar Hai Bà Trưng (TPHCM)</div>
                        <div class="theater-location">135 Hai Bà Trưng, P. Bến Nghé, Q.1</div>
                    </div>
                    <span class="theater-expand">+</span>
                </div>
                <div class="showtime-list">
                    <div class="showtime-row">
                        <div class="showtime-slot">15:00 (45K)</div>
                        <div class="showtime-slot">17:30 (45K)</div>
                        <div class="showtime-slot">20:00 (55K)</div>
                        <div class="showtime-slot">22:10 (55K)</div>
                    </div>
                </div>
            </div>
        </section>

        <%-- Ticket Type & Seat Map --%>
        <div style="display: flex; gap: var(--spacing-lg);">
            <section style="flex: 0 0 250px; background: var(--bg-secondary); padding: var(--spacing-md); border-radius: var(--border-radius);">
                <h3>Loại Vé</h3>
                <div class="ticket-type">
                    <div class="ticket-option active">
                        <div>Standard</div>
                        <div class="ticket-price">45,000 VNĐ</div>
                    </div>
                    <div class="ticket-option">
                        <div>VIP</div>
                        <div class="ticket-price">75,000 VNĐ</div>
                    </div>
                    <div class="ticket-option">
                        <div>3D</div>
                        <div class="ticket-price">55,000 VNĐ</div>
                    </div>
                </div>
                <div class="form-group-booking">
                    <label>Số Lượng:</label>
                    <input type="number" value="1" min="1" max="10">
                </div>
            </section>
<%-- Seat Map Section: Lưới 2D A-P với label dãy A-P ở cột 0 --%>
<section class="seat-map active">
    <div class="seat-map-header">
        <h3>Chọn Ghế - Phòng 02</h3>
        <p>Suất 16:30, Standard | 45,000 VNĐ/ghế</p>
    </div>
    <div class="seat-legend">
        <div class="legend-item">
            <div class="legend-color available"></div>
            <span>Ghế thường</span>
        </div>
        <div class="legend-item">
            <div class="legend-color double"></div>
            <span>Ghế đôi</span>
        </div>
        <div class="legend-item">
            <div class="legend-color selected"></div>
            <span>Ghế chọn</span>
        </div>
        <div class="legend-item">
            <div class="legend-color taken"></div>
            <span>Ghế đã</span>
        </div>
    </div>
    <div class="seat-grid">
        <%-- Hàng 1: Label cột 1-10 (ẩn) --%>
        <div class="col-label"></div>
        <div class="col-label"></div>
        <div class="col-label"></div>
        <div class="col-label"></div>
        <div class="col-label"></div>
        <div class="col-label"></div>
        <div class="col-label"></div>
        <div class="col-label"></div>
        <div class="col-label"></div>
        <div class="col-label"></div>
        <div class="col-label"></div>

        <%-- Hàng A: Label A + 10 ghế đơn --%>
        <div class="row-label">A</div>
        <div class="seat-cell available">A1</div>
        <div class="seat-cell available">A2</div>
        <div class="seat-cell available">A3</div>
        <div class="seat-cell available">A4</div>
        <div class="seat-cell available">A5</div>
        <div class="seat-cell available">A6</div>
        <div class="seat-cell available">A7</div>
        <div class="seat-cell available">A8</div>
        <div class="seat-cell available">A9</div>
        <div class="seat-cell available">A10</div>

        <%-- Hàng B: Label B + 10 ghế đơn --%>
        <div class="row-label">B</div>
        <div class="seat-cell taken">B1</div>
        <div class="seat-cell available">B2</div>
        <div class="seat-cell selected">B3</div>
        <div class="seat-cell available">B4</div>
        <div class="seat-cell available">B5</div>
        <div class="seat-cell available">B6</div>
        <div class="seat-cell available">B7</div>
        <div class="seat-cell taken">B8</div>
        <div class="seat-cell available">B9</div>
        <div class="seat-cell selected">B10</div>

        <%-- Hàng C: Label C + 10 ghế đơn --%>
        <div class="row-label">C</div>
        <div class="seat-cell available">C1</div>
        <div class="seat-cell taken">C2</div>
        <div class="seat-cell available">C3</div>
        <div class="seat-cell selected">C4</div>
        <div class="seat-cell available">C5</div>
        <div class="seat-cell available">C6</div>
        <div class="seat-cell available">C7</div>
        <div class="seat-cell available">C8</div>
        <div class="seat-cell taken">C9</div>
        <div class="seat-cell available">C10</div>

        <%-- Hàng D: Label D + 10 ghế đơn --%>
        <div class="row-label">D</div>
        <div class="seat-cell taken">D1</div>
        <div class="seat-cell available">D2</div>
        <div class="seat-cell available">D3</div>
        <div class="seat-cell selected">D4</div>
        <div class="seat-cell available">D5</div>
        <div class="seat-cell available">D6</div>
        <div class="seat-cell taken">D7</div>
        <div class="seat-cell available">D8</div>
        <div class="seat-cell available">D9</div>
        <div class="seat-cell available">D10</div>

        <%-- Hàng E: Label E + 10 ghế đơn --%>
        <div class="row-label">E</div>
        <div class="seat-cell available">E1</div>
        <div class="seat-cell selected">E2</div>
        <div class="seat-cell taken">E3</div>
        <div class="seat-cell available">E4</div>
        <div class="seat-cell available">E5</div>
        <div class="seat-cell available">E6</div>
        <div class="seat-cell available">E7</div>
        <div class="seat-cell selected">E8</div>
        <div class="seat-cell taken">E9</div>
        <div class="seat-cell available">E10</div>

        <%-- Hàng F: Label F + 10 ghế đơn --%>
        <div class="row-label">F</div>
        <div class="seat-cell taken">F1</div>
        <div class="seat-cell available">F2</div>
        <div class="seat-cell selected">F3</div>
        <div class="seat-cell available">F4</div>
        <div class="seat-cell available">F5</div>
        <div class="seat-cell taken">F6</div>
        <div class="seat-cell available">F7</div>
        <div class="seat-cell available">F8</div>
        <div class="seat-cell available">F9</div>
        <div class="seat-cell selected">F10</div>

        <%-- Hàng G: Label G + 10 ghế đơn --%>
        <div class="row-label">G</div>
        <div class="seat-cell available">G1</div>
        <div class="seat-cell taken">G2</div>
        <div class="seat-cell available">G3</div>
        <div class="seat-cell selected">G4</div>
        <div class="seat-cell available">G5</div>
        <div class="seat-cell available">G6</div>
        <div class="seat-cell available">G7</div>
        <div class="seat-cell taken">G8</div>
        <div class="seat-cell available">G9</div>
        <div class="seat-cell selected">G10</div>

        <%-- Hàng H: Label H + 10 ghế đơn --%>
        <div class="row-label">H</div>
        <div class="seat-cell selected">H1</div>
        <div class="seat-cell available">H2</div>
        <div class="seat-cell taken">H3</div>
        <div class="seat-cell available">H4</div>
        <div class="seat-cell available">H5</div>
        <div class="seat-cell available">H6</div>
        <div class="seat-cell available">H7</div>
        <div class="seat-cell selected">H8</div>
        <div class="seat-cell taken">H9</div>
        <div class="seat-cell available">H10</div>

        <%-- Hàng I: Label I + 10 ghế đơn --%>
        <div class="row-label">I</div>
        <div class="seat-cell taken">I1</div>
        <div class="seat-cell available">I2</div>
        <div class="seat-cell selected">I3</div>
        <div class="seat-cell available">I4</div>
        <div class="seat-cell available">I5</div>
        <div class="seat-cell available">I6</div>
        <div class="seat-cell taken">I7</div>
        <div class="seat-cell available">I8</div>
        <div class="seat-cell selected">I9</div>
        <div class="seat-cell available">I10</div>

        <%-- Hàng J: Label J + 10 ghế đơn --%>
        <div class="row-label">J</div>
        <div class="seat-cell available">J1</div>
        <div class="seat-cell selected">J2</div>
        <div class="seat-cell taken">J3</div>
        <div class="seat-cell available">J4</div>
        <div class="seat-cell available">J5</div>
        <div class="seat-cell available">J6</div>
        <div class="seat-cell selected">J7</div>
        <div class="seat-cell available">J8</div>
        <div class="seat-cell taken">J9</div>
        <div class="seat-cell available">J10</div>

        <%-- Hàng K: Label K + 10 ghế đơn --%>
        <div class="row-label">K</div>
        <div class="seat-cell taken">K1</div>
        <div class="seat-cell available">K2</div>
        <div class="seat-cell selected">K3</div>
        <div class="seat-cell available">K4</div>
        <div class="seat-cell available">K5</div>
        <div class="seat-cell available">K6</div>
        <div class="seat-cell taken">K7</div>
        <div class="seat-cell available">K8</div>
        <div class="seat-cell selected">K9</div>
        <div class="seat-cell available">K10</div>

        <%-- Hàng L: Label L + 10 ghế đơn --%>
        <div class="row-label">L</div>
        <div class="seat-cell available">L1</div>
        <div class="seat-cell taken">L2</div>
        <div class="seat-cell available">L3</div>
        <div class="seat-cell selected">L4</div>
        <div class="seat-cell available">L5</div>
        <div class="seat-cell available">L6</div>
        <div class="seat-cell available">L7</div>
        <div class="seat-cell taken">L8</div>
        <div class="seat-cell available">L9</div>
        <div class="seat-cell selected">L10</div>

        <%-- Hàng M: Label M + 10 ghế đơn --%>
        <div class="row-label">M</div>
        <div class="seat-cell taken">M1</div>
        <div class="seat-cell available">M2</div>
        <div class="seat-cell selected">M3</div>
        <div class="seat-cell available">M4</div>
        <div class="seat-cell available">M5</div>
        <div class="seat-cell available">M6</div>
        <div class="seat-cell taken">M7</div>
        <div class="seat-cell available">M8</div>
        <div class="seat-cell selected">M9</div>
        <div class="seat-cell available">M10</div>

        <%-- Hàng N: Label N + 10 ghế đơn --%>
        <div class="row-label">N</div>
        <div class="seat-cell available">N1</div>
        <div class="seat-cell taken">N2</div>
        <div class="seat-cell available">N3</div>
        <div class="seat-cell selected">N4</div>
        <div class="seat-cell available">N5</div>
        <div class="seat-cell available">N6</div>
        <div class="seat-cell available">N7</div>
        <div class="seat-cell taken">N8</div>
        <div class="seat-cell available">N9</div>
        <div class="seat-cell selected">N10</div>

        <%-- Hàng O: Label O + 10 ghế đơn --%>
        <div class="row-label">O</div>
        <div class="seat-cell taken">O1</div>
        <div class="seat-cell available">O2</div>
        <div class="seat-cell available">O3</div>
        <div class="seat-cell selected">O4</div>
        <div class="seat-cell available">O5</div>
        <div class="seat-cell available">O6</div>
        <div class="seat-cell taken">O7</div>
        <div class="seat-cell available">O8</div>
        <div class="seat-cell available">O9</div>
        <div class="seat-cell available">O10</div>

        <%-- Hàng P: Label P + 10 ghế đơn + 3 ghế đôi span 2 cột (tổng 10 cột ghế) --%>
        <div class="row-label">P</div>
        <div class="seat-cell double double-span">P1-P2</div>
        <div class="seat-cell available">P3</div>
        <div class="seat-cell selected">P4</div>
        <div class="seat-cell double double-span">P5-P6</div>
        <div class="seat-cell available">P7</div>
        <div class="seat-cell taken">P8</div>
        <div class="seat-cell double double-span">P9-P10</div>
        <div class="seat-cell available"></div> <%-- Ghế rỗng nếu cần, nhưng gap tự cân bằng --%>
    </div>
</section>
    </div>

    <%-- Booking Summary --%>
    <div class="booking-summary">
        <h2>Tổng Kết Đặt Vé</h2>
        <div class="total-price">Tổng Tiền: 90,000 VNĐ (2 ghế Standard x 45K)</div>
        <a href="payment.jsp" class="book-btn" >Xác Nhận & Thanh Toán</a>
        <p style="color: var(--text-muted); font-size: 12px; text-align: center; margin-top: var(--spacing-md);">* Vé không hoàn tiền. Áp dụng ưu đãi nếu đủ điều kiện.</p>
    </div>
</main>

<footer class="footer">
    <div style="max-width: var(--max-width); margin: 0 auto; padding: 0 var(--spacing-md);">
        <div class="footer-links">
            <a href="#">Giới Thiệu</a>
            <a href="#">Tin Tức</a>
            <a href="#">Tuyển Dụng</a>
            <a href="#">Liên Hệ</a>
            <a href="#">Chính Sách Bảo Mật</a>
        </div>
        <p>&copy; 2025 MyCinema. Hệ thống rạp chiếu phim hiện đại bậc nhất.</p>
    </div>
</footer>
<%-- JS Script: Interactions (giữ nguyên từ trước, thêm cho seat grid nếu cần) --%>
<script>
    // Date tab (giữ nguyên)
    document.querySelectorAll('.date-tab').forEach(tab => {
        tab.addEventListener('click', function() {
            document.querySelectorAll('.date-tab').forEach(t => t.classList.remove('active'));
            this.classList.add('active');
        });
    });

    // Theater accordion (giữ nguyên)
    document.querySelectorAll('.theater-header').forEach(header => {
        header.addEventListener('click', function() {
            this.parentElement.classList.toggle('active');
        });
    });

    // Showtime selection (giữ nguyên)
    document.querySelectorAll('.showtime-slot').forEach(slot => {
        slot.addEventListener('click', function() {
            document.querySelectorAll('.showtime-slot').forEach(s => s.classList.remove('selected'));
            this.classList.add('selected');
            // Hiển thị seat map
            document.querySelector('.seat-map').classList.add('active');
        });
    });

    // Ticket type (giữ nguyên)
    document.querySelectorAll('.ticket-option').forEach(option => {
        option.addEventListener('click', function() {
            document.querySelectorAll('.ticket-option').forEach(o => o.classList.remove('active'));
            this.classList.add('active');
            const price = this.querySelector('.ticket-price').textContent;
            document.querySelector('.total-price').textContent = `Tổng Tiền: ${price} (1 ghế)`;
        });
    });

    // Seat selection in 2D grid
    document.querySelectorAll('.seat-cell.available').forEach(seat => {
        seat.addEventListener('click', function() {
            this.classList.toggle('selected');
            const selectedSeats = document.querySelectorAll('.seat-cell.selected').length;
            const basePrice = 45000;
            document.querySelector('.total-price').textContent = `Tổng Tiền: ${selectedSeats * basePrice} VNĐ (${selectedSeats} ghế Standard x ${basePrice} VNĐ)`;
        });
    });
</script>
</body>
</html>