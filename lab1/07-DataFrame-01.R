# 1. Tạo dataframe
# Dataframe được tạo ra từ các vector có chung độ dài

column1 <- c(1:3)
column2 <- c("Tung", "Tom", "Anna")
column3 <- c(T, T, F)

dataset1 <- data.frame(column1, column2, column3)
dataset1 # Hiển thị ra cửa console
print(dataset1)

#View dữ liệu
View(dataset1)

# Tên của các cột
colnames(dataset1)
# Đổi tên cột 2
colnames(dataset1)[2]<-"Name"
dataset1
# Đổi tên cột hàng loạt
colnames(dataset1)<-c('#', "Name", "Check")
dataset1

# 2. Theem dongf moiws cho dataframe
newRow <- c(4, "Nhat Tung", T)
dataset2 <- rbind(dataset1, newRow)
dataset2

newRowDF <- data.frame(5, "Lisa", F)
names(newRowDF) <- c("#", "Name", "Check")
dataset3<-rbind(dataset2, newRowDF)
dataset3

# 3. Thêm cột mới
newColumn <- c("a", "b", "c", "d", "f")
dataset4<-cbind(dataset3, newColumn)
dataset4

dataset4$newColumn2<-c(1,2,3,4,5)

# 4. Truy xuất dữ liệu
# Truy xuất bằng chỉ số
dataset4[3,2] # Dòng 3, cột 2

# Truy xuất dữ liệu bằng chỉ số và tên cột
dataset4[3, "Check"]

# Truy xuất bằng tên cột
dataset4["Name"]
dataset4[,"Name"]
dataset4$Name

# 5. Các hàn thường dùng
head(dataset4) # hiển thị vài dòng đầu
tail(dataset4) # hiển thị vài dòng cuối
str(dataset4) # hiển thị cấu trúc của dữ liệu
summary(dataset4)

# 6. Thay đổi dữ liệu cột
dataset4$Check<-as.logical(dataset4$Check)
summary(dataset4)

######## Bài tập
######## Bộ dữ liệu iris
data() # Lấy ra toàn bộ dataset được build trong R
iris
View(iris)
str(iris)
summary(iris)
head(iris)
tail(iris)
