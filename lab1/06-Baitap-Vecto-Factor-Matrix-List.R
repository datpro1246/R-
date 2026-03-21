# Bài 1: Tạo factor
fac1 <- factor(
  c("a", "b", "c", "a", "b", "c", "a"),
  levels = c("a", "b", "c"),
  labels = c("Letter A", "Letter B", "Letter C")
)

# Tóm tắt giá trị factor
summary(fac1)

# Bài 2: Tạo 1 vecto có giá trị từ 1-4 và độ dài 10
# Giá trị được sắp xếp ngẫu nhiên

set.seed(123)
vec_num <- sample(1:4, size = 10, replace = TRUE)

vec_num

# Kiểm tra kiểu dữ liệu
class(vec_num)

# Tóm tắt vecto
summary(vec_num)

# Sử dụng cevto trên để tạo factor có thứ tự
fac_num <- factor(
  vec_num,
  levels = c(1, 2, 3, 4),
  labels = c("low", "medium", "high", "very high"),
  ordered = TRUE
)

fac_num

# Kiểm tra kiểu dữ liệu
class(fac_num)

# Tóm tắt factor
summary(fac_num)

# So sánh với vector ban đầu
vec_num
fac_num

# so sánh kiểu dữ liệu
class(vec_num)
class(fac_num)

# Bài 3
table <- matrix(0, nrow=5, ncol=2)

table[,1] <- 3

table[3,2] <- 20

print("Giá trị cột 2:")
print(table[,2])
class(table[,2])

table[4,2] <- "twelve" 
class(table[,2])
class(table[,1])

# # 4. Tạo bốn biến với các kiểu khác nhau (vectors, matrices, 
#                                           single values).
# Tạo một list từ các đối tượng này đặt tên "myList".
# a) Lấy phần tử thứ nhất của list và thêm một giá trị vào đó.
# Lưu thay đổi để nó hiển thị trong list.
# b) Thêm phần tử mới vào cuối list - tạo thành vector 6 phần tử 
# với bất kỳ kiểu nào.
# c) In phần tử thứ 4 của đối tượng cuối cùng trong list.
# d) Thay đổi giá trị của phần tử thứ 5 của đối tượng cuối cùng 
# thành NA.

# Taoh các biên khác nhau
vec1 <- c("a", "b", "c")
mat1 <-matrix(1:6, nrow=2)
single_val <-100
vec2 <- c(1,2,3)

# Tạo list
myList <- list(vec1, mat1, single_val, vec2)

# a
myList[[1]]<-c(myList[[1]], c("d"))

#b
length(myList)

myList[[length(myList)+1]] <- c(5,6,7,8,9)

#c
myList[[length(myList)]][4]

#d
myList[[length(myList)]][5] <-NA
