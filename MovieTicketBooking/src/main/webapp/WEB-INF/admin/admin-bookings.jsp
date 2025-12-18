<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Bookings - Admin - MyCinema</title>
    <link rel="stylesheet" href="adminstyle.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>
     <div class="admin-main">
            <div class="bookings-header">
                <h1>Quản Lý Bookings</h1>
                <div class="filter-bar">
                    <form method="GET" action="admin-bookings.jsp" class="search-form">
                        <div class="form-group">
                            <input type="text" name="search" placeholder="Tìm user/phim..." class="form-control" style="width: 200px;">
                        </div>
                        <div class="form-group">
                            <select name="status" class="form-control" style="width: 150px;">
                                <option value="">Trạng Thái</option>
                                <option value="confirmed">Xác Nhận</option>
                                <option value="pending">Chờ</option>
                                <option value="cancelled">Hủy</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="date" name="fromDate" class="form-control" style="width: 150px;">
                        </div>
                        <div class="form-group">
                            <input type="date" name="toDate" class="form-control" style="width: 150px;">
                        </div>
                        <button type="submit" class="btn btn-primary" style="margin-left: 10px;">Tìm</button>
                    </form>
                </div>
            </div>

            <div class="table-wrapper">
                <table class="admin-table">
                    <thead>
                        <tr>
                            <th><span>ID</span></th>
                            <th><span>User</span></th>
                            <th><span>Phim</span></th>
                            <th><span>Show Time</span></th>
                            <th><span>Ghế</span></th>
                            <th><span>Status</span></th>
                            <th><span>Amount</span></th>
                            <th><span>Ngày Book</span></th>
                            <th><span>Action</span></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>user1@email.com</td>
                            <td>Avengers Endgame</td>
                            <td>20/11/2025 18:00</td>
                            <td>A1-A2</td>
                            <td><span class="status-badge status-confirmed">Xác Nhận</span></td>
                            <td>200.000 VND</td>
                            <td>20/11/2025</td>
                            <td class="action-buttons">
                                <button class="btn btn-secondary action-btn-small" onclick="detail(1)">Chi Tiết</button>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>user2@email.com</td>
                            <td>Spider-Man</td>
                            <td>21/11/2025 20:00</td>
                            <td>B5</td>
                            <td><span class="status-badge status-pending">Chờ</span></td>
                            <td>100.000 VND</td>
                            <td>20/11/2025</td>
                            <td class="action-buttons">
                                <button class="btn btn-secondary action-btn-small" onclick="detail(2)">Chi Tiết</button>
                                <button class="btn btn-secondary action-btn-small" onclick="cancel(2)">Hủy</button>
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>user3@email.com</td>
                            <td>Black Panther</td>
                            <td>22/11/2025 19:00</td>
                            <td>C3-C4</td>
                            <td><span class="status-badge status-cancelled">Hủy</span></td>
                            <td>300.000 VND</td>
                            <td>19/11/2025</td>
                            <td class="action-buttons">
                                <button class="btn btn-secondary action-btn-small" onclick="detail(3)">Chi Tiết</button>
                            </td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>user4@email.com</td>
                            <td>Dune</td>
                            <td>23/11/2025 17:00</td>
                            <td>D1</td>
                            <td><span class="status-badge status-confirmed">Xác Nhận</span></td>
                            <td>150.000 VND</td>
                            <td>20/11/2025</td>
                            <td class="action-buttons">
                                <button class="btn btn-secondary action-btn-small" onclick="detail(4)">Chi Tiết</button>
                            </td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>user5@email.com</td>
                            <td>The Matrix</td>
                            <td>24/11/2025 21:00</td>
                            <td>E2-E3</td>
                            <td><span class="status-badge status-pending">Chờ</span></td>
                            <td>250.000 VND</td>
                            <td>20/11/2025</td>
                            <td class="action-buttons">
                                <button class="btn btn-secondary action-btn-small" onclick="detail(5)">Chi Tiết</button>
                                <button class="btn btn-secondary action-btn-small" onclick="cancel(5)">Hủy</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Pagination -->
            <div class="pagination" style="text-align: center; margin-top: var(--spacing-lg);">
                <a href="#" onclick="prevPage()" class="btn btn-secondary" style="margin-right: 10px;">« Trước</a>
                <span style="margin: 0 20px; color: var(--text-muted);">1 / 3</span>
                <a href="#" onclick="nextPage()" class="btn btn-secondary">Sau »</a>
            </div>
        </div>
    
</body>
</html>