# BT 1. Bài tập về chuyển đổi kiểu dữ liệu số:
a <- 7.86
class(a)

# Chuyển sang số nguyên
a <- as.integer(a)
class(a)
print(a)

# Chuyển sang kí tự
a <- as.character(a)
class(a)
print(a)

# Khi chuyển từ numeric sang integer:
# R sẽ cắt bỏ phần thập phân, KHÔNG làm tròn

# Khi chuyển sang character:
# Dữ liệu không còn dùng để tính toán,
# chỉ còn mang ý nghĩa hiển thị văn bản


# BT 2. Bài tập về ghép chuỗi: 
# Tạo hai biến chứa văn bản
txt1 <- "Hoc"
txt2 <- "ngon ngu R"

class(txt1)
class(txt2)

# Ghép chuỗi bằng hàm paste()
ket_qua_paste <- paste(txt1, txt2)
ket_qua_paste
class(ket_qua_paste)

# Ghép chuỗi bằng hàm c()
ket_qua_c <- c(txt1, txt2)
ket_qua_c
class(ket_qua_c)

# paste() ghép các chuỗi thành một chuỗi duy nhất
# Mặc định có khoảng trắng giữa các chuỗi

# # c() kết hợp các giá trị thành một vector
# Mỗi chuỗi là một phần tử riêng biệt


# BT 3. Bài tập về xử lý ngày tháng:
# Tạo vector ngày tháng dạng character
vecDate <- c("09:12:12", "28:02:16", "31:05:22")
class(vecDate)

# Chuyển sang kiểu Date (định dạng ngày: tháng: năm)
vecDate <- as.Date(vecDate, format = "%d:%m:%y")
vecDate
class(vecDate)

# Tính số ngày chênh lệch với ngày hiện tại
so_ngay <- Sys.Date() - vecDate
so_ngay


# BT 4.Bài tập tạo vector số
# Tạo vector vec1
vec1 <- c(2:8, 17:30)
vec1
class(vec1)


# BT 5. Bài tập sử dụng hàm seq():
# Tạo vector vec2
vec2 <- seq(from = 2, to = 32, by = 6)
vec2
class(vec2)


# BT 6. Bài tập lặp chuỗi:
# Tạo vector ban đầu
vec_temp <- c("2", "7", "a")
# Lặp vector bằng hàm rep()
vec6 <- rep(vec_temp, times = 3)
vec6
class(vec6)


# BT 7. Bài tập về số chia hết:
# Tạo vector các số chia hết cho 3
vec7 <- seq(from = 3, by = 3, length.out = 100)
vec7


# BT 8. Bài tập tạo mẫu phức tạp:
vec3 <- rep(rep(seq(1, 9, by = 2), each = 2), times = 3)
vec3


# BT 9. Bài tập về số ngẫu nhiên
# Tạo vector vec4 gồm 50 số ngẫu nhiên
vec4 <- runif(50)
vec4
# Tạo vector số nguyên ngẫu nhiên trong khoảng 0-20
vec4_int <- as.integer(runif(50, min = 0, max = 21))
vec4_int


