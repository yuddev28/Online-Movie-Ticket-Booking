<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Rạp - Admin - MyCinema</title>
    <link rel="stylesheet" href="adminstyle.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>
     <div class="admin-main">
            <div class="theaters-header">
                <h1>Quản Lý Rạp</h1>
                <button class="btn" onclick="openModal('addModal')">Thêm Rạp Mới</button>
            </div>

            <div class="table-wrapper">
                <table class="admin-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên Rạp</th>
                            <th>Địa Chỉ</th>
                            <th>Sức Chứa</th>
                            <th>Trạng Thái</th>
                            <th>Hành Động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>#001</td>
                            <td>Cinestar Q6</td>
                            <td>Quận 6, TP.HCM</td>
                            <td>250 chỗ</td>
                            <td><span class="status-tag status-active">Hoạt Động</span></td>
                            <td class="action-buttons">
                                <button class="btn btn-secondary action-btn-small" onclick="editTheater('1')">Sửa</button>
                                <button class="btn btn-secondary action-btn-small" onclick="deleteTheater('1')">Xóa</button>
                            </td>
                        </tr>
                        <tr>
                            <td>#002</td>
                            <td>Cinestar Hai Bà Trưng</td>
                            <td>Quận Hai Bà Trưng, Hà Nội</td>
                            <td>180 chỗ</td>
                            <td><span class="status-tag status-active">Hoạt Động</span></td>
                            <td class="action-buttons">
                                <button class="btn btn-secondary action-btn-small" onclick="editTheater('2')">Sửa</button>
                                <button class="btn btn-secondary action-btn-small" onclick="deleteTheater('2')">Xóa</button>
                            </td>
                        </tr>
                        <tr>
                            <td>#003</td>
                            <td>Cinestar Quốc Thanh</td>
                            <td>Quận 3, TP.HCM</td>
                            <td>300 chỗ</td>
                            <td><span class="status-tag status-inactive">Không Hoạt Động</span></td>
                            <td class="action-buttons">
                                <button class="btn btn-secondary action-btn-small" onclick="editTheater('3')">Sửa</button>
                                <button class="btn btn-secondary action-btn-small" onclick="deleteTheater('3')">Xóa</button>
                            </td>
                        </tr>
                        <tr>
                            <td>#004</td>
                            <td>CGV Vincom</td>
                            <td>Quận 1, TP.HCM</td>
                            <td>220 chỗ</td>
                            <td><span class="status-tag status-active">Hoạt Động</span></td>
                            <td class="action-buttons">
                                <button class="btn btn-secondary action-btn-small" onclick="editTheater('4')">Sửa</button>
                                <button class="btn btn-secondary action-btn-small" onclick="deleteTheater('4')">Xóa</button>
                            </td>
                        </tr>
                        <tr>
                            <td>#005</td>
                            <td>Lotte Cinema</td>
                            <td>Quận 7, TP.HCM</td>
                            <td>150 chỗ</td>
                            <td><span class="status-tag status-active">Hoạt Động</span></td>
                            <td class="action-buttons">
                                <button class="btn btn-secondary action-btn-small" onclick="editTheater('5')">Sửa</button>
                                <button class="btn btn-secondary action-btn-small" onclick="deleteTheater('5')">Xóa</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Pagination -->
            <div class="pagination" style="text-align: center; margin-top: var(--spacing-lg);">
                <a href="#" onclick="prevPage()" class="btn btn-secondary" style="margin-right: 10px;">« Trước</a>
                <span style="margin: 0 20px; color: var(--text-muted);">1 / 2</span>
                <a href="#" onclick="nextPage()" class="btn btn-secondary">Sau »</a>
            </div>

            <!-- Modal Thêm/Sửa Rạp -->
            <div id="addModal" class="modal">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3>Thêm Rạp Mới</h3>
                        <span class="close-modal" onclick="closeModal('addModal')">&times;</span>
                    </div>
                    <form class="modal-form">
                        <div class="form-group">
                            <label for="theaterName">Tên Rạp</label>
                            <input type="text" id="theaterName" placeholder="Nhập tên rạp" required>
                        </div>
                        <div class="form-group">
                            <label for="address">Địa Chỉ</label>
                            <input type="text" id="address" placeholder="Nhập địa chỉ" required>
                        </div>
                        <div class="form-group">
                            <label for="capacity">Sức Chứa</label>
                            <input type="number" id="capacity" placeholder="Nhập sức chứa" required>
                        </div>
                        <div class="form-group">
                            <label for="status">Trạng Thái</label>
                            <select id="status" required>
                                <option value="active">Hoạt Động</option>
                                <option value="inactive">Không Hoạt Động</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="image">Hình Ảnh (Upload)</label>
                            <input type="file" id="image" accept="image/*">
                        </div>
                        <div class="modal-btns">
                            <button type="submit" class="auth-btn">Lưu</button>
                            <button type="button" class="btn btn-secondary" onclick="closeModal('addModal')">Hủy</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

   
</body>
</html>