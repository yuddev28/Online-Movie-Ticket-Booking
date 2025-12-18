<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Phim - Admin - MyCinema</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminstyle.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
	
</head>
<body>
   <div class="movies-header">
                <h1>Quản Lý Phim</h1>
                <button class="btn" onclick="openModal('addModal')">Thêm Phim Mới</button>
            </div>

            <table class="movies-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tiêu Đề</th>
                        <th>Thể Loại</th>
                        <th>Thời Lượng</th>
                        <th>Trạng Thái</th>
                        <th>Hành Động</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>#001</td>
                        <td>Quái Thú Vô Hình</td>
                        <td>Kinh Dị</td>
                        <td>99 phút</td>
                        <td><span class="status-tag status-active">Hoạt Động</span></td>
                        <td class="action-buttons">
                            <button class="btn btn-secondary action-btn-small" onclick="editMovie('1')">Sửa</button>
                            <button class="btn btn-secondary action-btn-small" onclick="deleteMovie('1')">Xóa</button>
                        </td>
                    </tr>
                    <tr>
                        <td>#002</td>
                        <td>Avengers: Endgame</td>
                        <td>Hành Động, Siêu Anh Hùng</td>
                        <td>181 phút</td>
                        <td><span class="status-tag status-active">Hoạt Động</span></td>
                        <td class="action-buttons">
                            <button class="btn btn-secondary action-btn-small" onclick="editMovie('2')">Sửa</button>
                            <button class="btn btn-secondary action-btn-small" onclick="deleteMovie('2')">Xóa</button>
                        </td>
                    </tr>
                    <tr>
                        <td>#003</td>
                        <td>Parasite</td>
                        <td>Tâm Lý, Hài</td>
                        <td>132 phút</td>
                        <td><span class="status-tag status-inactive">Không Hoạt Động</span></td>
                        <td class="action-buttons">
                            <button class="btn btn-secondary action-btn-small" onclick="editMovie('3')">Sửa</button>
                            <button class="btn btn-secondary action-btn-small" onclick="deleteMovie('3')">Xóa</button>
                        </td>
                    </tr>
                    <tr>
                        <td>#004</td>
                        <td>Joker</td>
                        <td>Tội Phạm, Tâm Lý</td>
                        <td>122 phút</td>
                        <td><span class="status-tag status-active">Hoạt Động</span></td>
                        <td class="action-buttons">
                            <button class="btn btn-secondary action-btn-small" onclick="editMovie('4')">Sửa</button>
                            <button class="btn btn-secondary action-btn-small" onclick="deleteMovie('4')">Xóa</button>
                        </td>
                    </tr>
                    <tr>
                        <td>#005</td>
                        <td>Frozen 2</td>
                        <td>Hoạt Hình, Gia Đình</td>
                        <td>103 phút</td>
                        <td><span class="status-tag status-active">Hoạt Động</span></td>
                        <td class="action-buttons">
                            <button class="btn btn-secondary action-btn-small" onclick="editMovie('5')">Sửa</button>
                            <button class="btn btn-secondary action-btn-small" onclick="deleteMovie('5')">Xóa</button>
                        </td>
                    </tr>
                </tbody>
            </table>

            <!-- Modal Thêm/Sửa Phim -->
            <div id="addModal" class="modal">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3>Thêm Phim Mới</h3>
                        <span class="close-modal" onclick="closeModal('addModal')">&times;</span>
                    </div>
                    <form class="modal-form">
                        <div class="form-group">
                            <label for="title">Tiêu Đề</label>
                            <input type="text" id="title" placeholder="Nhập tiêu đề phim" required>
                        </div>
                        <div class="form-group">
                            <label for="description">Mô Tả</label>
                            <textarea id="description" rows="3" placeholder="Nhập mô tả phim" required></textarea>
                        </div>
                        <div class="form-group">
                            <label for="genre">Thể Loại</label>
                            <select id="genre" required>
                                <option value="">Chọn thể loại</option>
                                <option value="hành động">Hành Động</option>
                                <option value="kinh dị">Kinh Dị</option>
                                <option value="hài">Hài</option>
                                <option value="tâm lý">Tâm Lý</option>
                                <option value="hoạt hình">Hoạt Hình</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="duration">Thời Lượng (phút)</label>
                            <input type="number" id="duration" placeholder="Nhập thời lượng" required>
                        </div>
                        <div class="form-group">
                            <label for="status">Trạng Thái</label>
                            <select id="status" required>
                                <option value="active">Hoạt Động</option>
                                <option value="inactive">Không Hoạt Động</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="poster">Poster (Upload)</label>
                            <input type="file" id="poster" accept="image/*">
                        </div>
                        <div class="modal-btns">
                            <button type="submit" class="auth-btn">Lưu</button>
                            <button type="button" class="btn btn-secondary" onclick="closeModal('addModal')">Hủy</button>
                        </div>
                    </form>
                </div>
            </div>
</body>
</html>