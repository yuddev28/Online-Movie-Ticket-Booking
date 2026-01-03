USE movie_ticket_booking;

-- 1. Tắt kiểm tra khóa ngoại (để có thể xóa dữ liệu bất chấp liên kết)
SET FOREIGN_KEY_CHECKS = 0;

-- 2. Làm sạch dữ liệu và reset ID về 1 cho từng bảng
-- Lưu ý: Thứ tự xóa không quan trọng khi đã tắt khóa ngoại, nhưng nên liệt kê đủ
TRUNCATE TABLE showtimeseats;
TRUNCATE TABLE tickets;
TRUNCATE TABLE cinema_movies;
TRUNCATE TABLE showtimes;
TRUNCATE TABLE rooms;
TRUNCATE TABLE movies;
TRUNCATE TABLE cinemas;
TRUNCATE TABLE users;

-- 3. Bật lại kiểm tra khóa ngoại (quan trọng để bảo vệ dữ liệu sau này)
SET FOREIGN_KEY_CHECKS = 1;

-- 4. Kiểm tra lại (Thông báo)
SELECT 'Đã xóa sạch dữ liệu và reset ID thành công!' AS Status;