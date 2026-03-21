library(readr)
water_potability <- read_csv("~/Downloads/R/data/graphics - water quality/water_potability.csv")
View(water_potability)

# Cài đặt các gói cần thiết 
if(!require(caret)) install.packages("caret")
if(!require(pROC)) install.packages("pROC")
if(!require(readr)) install.packages("readr")

library(caret)
library(pROC)
library(readr)

# Đọc dữ liệu
data <- read_csv("water_potability.csv")

dataset_name <- "Water Potability Dataset"

View(data)