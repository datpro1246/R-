# Bar Chart
subjects <- c("Toán", "Lý", "Hóa", "Văn", "Anh")
scores <- c(8, 7.5, 9, 8.5, 7)

# 1 & 2: Bar chart cơ bản với tiêu đề
barplot(scores,
        names.arg = subjects,
        main = "Điểm thi của bạn",
        xlab = "Môn học",
        ylab = "Điểm",
        ylim = c(0, 10))

# 3: Tô màu khác nhau cho mỗi môn
barplot(scores,
        names.arg = subjects,
        main = "Điểm thi của bạn",
        xlab = "Môn học",
        ylab = "Điểm",
        col = c("steelblue", "seagreen", "coral", "orchid", "royalblue"),
        ylim = c(0, 10))

# 4: Thêm giá trị điểm lên đầu mỗi cột
bp <- barplot(scores,
              names.arg = subjects,
              main = "Điểm thi của bạn",
              xlab = "Môn học",
              ylab = "Điểm",
              col = c("steelblue", "seagreen", "coral", "orchid", "royalblue"),
              ylim = c(0, 10))

text(x = bp,           
     y = scores + 0.3, 
     labels = scores)

# 5: Bar chart ngang
barplot(scores,
        names.arg = subjects,
        main = "Điểm thi của bạn",
        xlab = "Điểm",
        ylab = "Môn học",
        col = c("steelblue", "seagreen", "coral", "orchid", "royalblue"),
        xlim = c(0, 10),
        horiz = TRUE) 

# Histogram
set.seed(2024)
exam_scores <- rnorm(100, mean = 70, sd = 10)

# 1, 2, 3: Histogram 10 bins, tiêu đề, màu xanh lam
hist(exam_scores,
     breaks = 10,
     main = "Phân phối điểm thi của 100 sinh viên",
     xlab = "Điểm thi",
     ylab = "Tần số",
     col = "steelblue")

# 4: Đường thẳng đứng màu đỏ tại điểm trung bình
abline(v = mean(exam_scores), col = "red", lwd = 2, lty = 2)

# 5: Vẽ histogram khác với 20 bins
par(mfrow = c(1, 2))

# Histogram 10 bins
hist(exam_scores,
     breaks = 10,
     main = "10 bins",
     xlab = "Điểm",
     col = "blue")
abline(v = mean(exam_scores), col = "red", lwd = 2)

# Histogram 20 bins
hist(exam_scores,
     breaks = 20,
     main = "20 bins",
     xlab = "Điểm",
     col = "blue")
abline(v = mean(exam_scores), col = "red", lwd = 2)

#  Box Plot
data(iris)

# 1, 2, 3: Box plot so sánh Petal.Length theo loài
boxplot(Petal.Length ~ Species,
        data = iris,
        main = "So sánh chiều dài cánh hoa giữa 3 loài iris",
        xlab = "Loài",
        ylab = "Chiều dài cánh hoa (cm)",
        col = c("lightblue", "lightsalmon", "lightgreen"))

# 4: Nhận xét từ biểu đồ
# Loài nào có petal dài nhất?
#    Virginica
#    Hộp nằm cao nhất trên trục y
#    Median lớn nhất
# Loài nào có độ biến thiên lớn nhất?
#    Virginica
#    Hộp (IQR) cao hơn các loài khác
#    Whiskers cũng dài hơn → dữ liệu phân tán nhiều hơn
# Có outliers không? Ở loài nào?
#    Có
#    Chủ yếu xuất hiện ở Virginica
#    Có thể có một vài điểm lẻ ở Versicolor (ít hơn)

# bài tập 4: Scatter Plot
data(mtcars)

# 1, 2, 4: Scatter plot hp vs mpg, màu theo cyl, legend
plot(mtcars$hp, mtcars$mpg,
     main = "Mối quan hệ giữa Horsepower và MPG",
     xlab = "Horsepower (hp)",
     ylab = "Miles per Gallon (mpg)",
     col = mtcars$cyl,   # màu theo số xy-lanh (4=xanh, 6=đỏ, 8=xanh lá)
     pch = 19,
     cex = 1.5)

# 3: Thêm đường hồi quy tuyến tính
model <- lm(mpg ~ hp, data = mtcars)
abline(model, col = "red", lwd = 2, lty = 2)

# 4: Legend
legend("topright",
       legend = c("4 cyl", "6 cyl", "8 cyl"),
       col = c(4, 6, 8),
       pch = 19)
# 5: Nhận xét
# Mối quan hệ giữa hp và mpg:
#     Quan hệ nghịch (negative correlation)
#     Khi hp tăng → mpg giảm
#     Xe mạnh hơn → tốn nhiên liệu hơn
# Nhìn từ biểu đồ:
#     Các điểm có xu hướng dốc xuống
#     Đường hồi quy (màu đỏ) đi xuống → xác nhận quan hệ nghịch
# Theo nhóm xy-lanh:
#     4 cyl → hp thấp, mpg cao (tiết kiệm xăng)
#     6 cyl → mức trung bình
#     cyl → hp cao, mpg thấp (tốn xăng)


# bài tập 5: Nhiều biểu đồ
# Load dữ liệu
data(mtcars)

# Chia màn hình 2x2
par(mfrow = c(2, 2))

# 1. Histogram của hp
hist(mtcars$hp,
     main = "Phân phối HP",
     xlab = "Horsepower",
     col = "lightblue",
     breaks = 10)

# 2. Box plot của hp
boxplot(mtcars$hp,
        main = "Boxplot HP",
        ylab = "Horsepower",
        col = "lightgreen")

# 3. Box plot hp theo cyl
boxplot(hp ~ cyl,
        data = mtcars,
        main = "HP theo số xy-lanh",
        xlab = "Cylinders",
        ylab = "Horsepower",
        col = c("red", "green", "blue"))

# 4. Scatter plot hp vs mpg
plot(mtcars$hp, mtcars$mpg,
     main = "HP vs MPG",
     xlab = "Horsepower",
     ylab = "MPG",
     pch = 19,
     col = "darkblue")

# Reset về 1 biểu đồ
par(mfrow = c(1, 1))

# bài tập 6: Tổng hợp
# 6.1: bar chart so sánh doanh thu 4 quý
# Tạo dữ liệu
Q1 <- c(100, 120, 110, 130)
Q2 <- c(150, 140, 160, 155)
Q3 <- c(180, 170, 190, 185)
Q4 <- c(200, 210, 195, 220)

products <- c("Sản phẩm A", "Sản phẩm B", "Sản phẩm C", "Sản phẩm D")

sales_matrix <- rbind(Q1, Q2, Q3, Q4)
colnames(sales_matrix) <- products

barplot(sales_matrix,
        beside = TRUE,
        col = c("red", "blue", "green", "orange"),
        main = "Doanh thu theo quý",
        xlab = "Sản phẩm",
        ylab = "Doanh thu",
        legend = c("Q1", "Q2", "Q3", "Q4"))

# 6.2: line plot cho từng sản phẩm qua 4 quý
quarters <- 1:4

plot(quarters, Q1,
     type = "l",
     col = "red",
     lwd = 2,
     ylim = c(100, 220),
     xlab = "Quý",
     ylab = "Doanh thu",
     main = "Doanh thu theo quý (từng sản phẩm)")

lines(quarters, Q2, col = "blue", lwd = 2)
lines(quarters, Q3, col = "green", lwd = 2)
lines(quarters, Q4, col = "orange", lwd = 2)

legend("topleft",
       legend = c("Q1", "Q2", "Q3", "Q4"),
       col = c("red", "blue", "green", "orange"),
       lwd = 2)

# 6.3:  tổng doanh thu mỗi quý, vẽ bar chart
total_quarter <- colSums(sales_matrix)

barplot(total_quarter,
        names.arg = products,
        col = "skyblue",
        main = "Tổng doanh thu theo sản phẩm",
        ylab = "Doanh thu")

# 6.4: Tạo figure 2x2
# Chuẩn bị dữ liệu
sales_matrix <- rbind(Q1, Q2, Q3, Q4)
colnames(sales_matrix) <- products
quarters <- 1:4

# Tổng
total_quarter <- rowSums(sales_matrix)
total_product <- colSums(sales_matrix)

# Vẽ 2x2
par(mfrow = c(2, 2))

# 1. Grouped bar chart
barplot(sales_matrix, beside = TRUE, col = rainbow(4),
        main = "Doanh thu theo quý")

# 2. Line plot
matplot(t(sales_matrix), type = "l", lwd = 2, lty = 1,
        col = rainbow(4),
        xlab = "Quý", ylab = "Doanh thu",
        main = "Xu hướng doanh thu")
legend("topleft", legend = products, col = rainbow(4), lwd = 2)

# 3. Pie chart
pie(total_quarter, labels = paste("Q", 1:4), col = rainbow(4),
    main = "Tỷ lệ theo quý")

# 4. Bar chart tổng sản phẩm
barplot(total_product, names.arg = products, col = "lightgreen",
        main = "Tổng theo sản phẩm")

par(mfrow = c(1, 1))