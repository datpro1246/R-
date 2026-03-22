# 2.1 GIỚI THIỆU DATASET
# NBA Player Season Stats - 35 cột

# 2.2 LOAD & KHÁM PHÁ DỮ LIỆU
nba <- read.csv("~/Downloads/R/data/Seasons_Stats_35cols.csv", stringsAsFactors = FALSE)

View(nba)
head(nba)
tail(nba)

str(nba)
summary(nba)
dim(nba)
colnames(nba)


# 2.3 KIỂM TRA MISSING DATA & DUPLICATE

sum(is.na(nba))
colSums(is.na(nba))

nba[!complete.cases(nba), ]

# Kiểm tra duplicate
sum(duplicated(nba))

# Xóa duplicate nếu có
nba <- nba[!duplicated(nba), ]

# 2.4 CHUẨN HÓA DỮ LIỆU TEXT

nba$Player <- trimws(nba$Player)
nba$Tm <- trimws(nba$Tm)

nba$Pos <- toupper(nba$Pos)

# Chuẩn hóa toàn bộ text
nba[] <- lapply(nba, function(x){
  if(is.character(x)) trimws(tolower(x)) else x
})

unique(nba$Pos)


# 2.5 XỬ LÝ GIÁ TRỊ BẤT THƯỜNG

nba$Age[nba$Age < 15 | nba$Age > 50] <- NA
nba$G[nba$G == 0] <- NA

# Kiểm tra thêm
summary(nba$Age)
summary(nba$G)


# 2.6 XỬ LÝ MISSING DATA

numeric_cols <- sapply(nba, is.numeric)

for(col in names(nba[numeric_cols])){
  nba[[col]][is.na(nba[[col]])] <- median(nba[[col]], na.rm = TRUE)
}

percent_cols <- grep("%", colnames(nba), value = TRUE)

for(col in percent_cols){
  nba[[col]][is.na(nba[[col]])] <- 0
}

# Kiểm tra lại NA
sum(is.na(nba))
colSums(is.na(nba))


# 2.7 CHUYỂN KIỂU DỮ LIỆU

nba$Player <- as.factor(nba$Player)
nba$Pos <- as.factor(nba$Pos)
nba$Tm <- as.factor(nba$Tm)

str(nba)


# 2.8 PHÂN TÍCH CƠ BẢN

summary(nba$Pos)
table(nba$Pos)

summary(nba$Tm)


# 2.9 FEATURE ENGINEERING

nba$PTS_per_game <- nba$PTS / nba$G
nba$AST_per_game <- nba$AST / nba$G
nba$REB_per_game <- nba$TRB / nba$G

nba$EFF <- nba$PTS + nba$TRB + nba$AST - nba$TOV

summary(nba$PTS_per_game)


# 2.10 TRỰC QUAN HÓA

hist(nba$PTS)
hist(nba$AST)
hist(nba$TRB)

boxplot(nba$PTS)
boxplot(nba$PTS ~ nba$Pos)

plot(nba$AST, nba$PTS)
plot(nba$TRB, nba$PTS)


# 2.11 PHÁT HIỆN OUTLIER

detect_outlier <- function(x){
  Q1 <- quantile(x,0.25)
  Q3 <- quantile(x,0.75)
  IQR <- Q3 - Q1
  x < Q1 - 1.5*IQR | x > Q3 + 1.5*IQR
}

sum(detect_outlier(nba$PTS))
sum(detect_outlier(nba$AST))
sum(detect_outlier(nba$TRB))


# 2.12 XỬ LÝ OUTLIER

cap_outlier <- function(x){
  Q1 <- quantile(x,0.25)
  Q3 <- quantile(x,0.75)
  IQR <- Q3 - Q1
  lower <- Q1 - 1.5*IQR
  upper <- Q3 + 1.5*IQR
  x[x < lower] <- lower
  x[x > upper] <- upper
  x
}

nba$PTS <- cap_outlier(nba$PTS)
nba$AST <- cap_outlier(nba$AST)
nba$TRB <- cap_outlier(nba$TRB)


# 2.13 PHÂN LOẠI

nba$Level <- cut(nba$PTS,
                 breaks = c(-Inf,500,1000,1500,Inf),
                 labels = c("Low","Medium","High","Elite"))

table(nba$Level)


# 2.14 PHÂN TÍCH NHÓM

aggregate(PTS ~ Pos, data = nba, mean)
aggregate(AST ~ Pos, data = nba, mean)
aggregate(TRB ~ Pos, data = nba, mean)

aggregate(PTS ~ Tm, data = nba, mean)


# 2.15 TOP PLAYER

top_players <- nba[order(-nba$PTS), ]
head(top_players,10)


# 2.16 KIỂM TRA DỮ LIỆU ÂM

nba[nba < 0] <- 0


# 2.17 SCALING

numeric_cols <- sapply(nba, is.numeric)

scaled_data <- scale(nba[numeric_cols])
head(scaled_data)


# 2.18 CORRELATION

cor_matrix <- cor(nba[numeric_cols])
cor_matrix

# xem biến liên quan PTS
sort(cor_matrix[,"PTS"], decreasing = TRUE)


# 2.19 BIẾN MỚI

nba$High_Scorer <- ifelse(nba$PTS > 1000, "Yes", "No")
nba$High_Scorer <- as.factor(nba$High_Scorer)

table(nba$High_Scorer)


# 2.20 NHÓM TUỔI

nba$Age_Group <- cut(nba$Age,
                     breaks = c(0,20,25,30,40,100),
                     labels = c("Teen","Young","Prime","Veteran","Old"))

table(nba$Age_Group)

aggregate(PTS ~ Age_Group, data = nba, mean)


# 2.21 PHÂN PHỐI

plot(density(nba$PTS))
plot(density(nba$AST))
plot(density(nba$TRB))


# 2.22 THỐNG KÊ NÂNG CAO

mean(nba$PTS)
median(nba$PTS)
sd(nba$PTS)

quantile(nba$PTS)


# 2.23 MODEL ĐƠN GIẢN

model <- lm(PTS ~ AST + TRB, data = nba)
summary(model)

pred <- predict(model, nba)

plot(pred, nba$PTS)


# 2.24 FEATURE BỔ SUNG (THÊM)

nba$AST_TO_TOV <- nba$AST / (nba$TOV + 1)
nba$IMPACT <- nba$PTS + nba$AST + nba$TRB + nba$STL + nba$BLK

summary(nba$IMPACT)


# 2.25 PHÂN NHÓM HIỆU SUẤT

nba$Impact_Level <- cut(nba$IMPACT,
                        breaks = quantile(nba$IMPACT, probs = seq(0,1,0.25)),
                        include.lowest = TRUE,
                        labels = c("Low","Medium","High","Very High"))

table(nba$Impact_Level)


# 2.26 KIỂM TRA CUỐI

sum(is.na(nba))
colSums(is.na(nba))

summary(nba)
str(nba)


# 2.27 LƯU FILE

write.csv(nba, "nba_cleaned_final.csv", row.names = FALSE)

