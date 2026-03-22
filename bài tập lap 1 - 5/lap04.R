# bài 1.1: Tính diện tích hình chữ nhật
tinh_dien_tich_hcn <- function(chieu_dai, chieu_rong) {
  # Kiểm tra dữ liệu đầu vào
  if (chieu_dai <= 0 || chieu_rong <= 0) {
    stop("Chiều dài và chiều rộng phải > 0")
  }
  
  dien_tich <- chieu_dai * chieu_rong
  dien_tich
}

tinh_dien_tich_hcn(5, 3)

# bài 1.2: Tính chu vi hình tròn
tinh_chu_vi_hinh_tron <- function(ban_kinh) {
  # Kiểm tra dữ liệu đầu vào
  if (ban_kinh <= 0) {
    stop("Bán kính phải > 0")
  }
  
  chu_vi <- 2 * pi * ban_kinh
  chu_vi
}

tinh_chu_vi_hinh_tron(5)

# bài 1.3: Chuyển đổi Celsius → Fahrenheit
chuyen_do_C_sang_F <- function(do_C) {
  do_F <- do_C * 9/5 + 32
  do_F
}

chuyen_do_C_sang_F(10)

# Bài 2.1: Kiểm tra chẵn lẽ
kiem_tra_chan_le <- function(n) {
  if (!is.numeric(n) || n != as.integer(n)) {
    stop("Input phải là số nguyên")
  }
  
  if (n %% 2 == 0) {
    return("Chẵn")
  } else {
    return("Lẻ")
  }
}

kiem_tra_chan_le(4)

# Bài 2.2: tính điểm trung bình
tinh_diem_trung_binh <- function(diem) {
  diem <- diem[!is.na(diem)]  # Loại bỏ NA
  
  if (any(diem < 0 | diem > 10)) {
    stop("Điểm phải từ 0 đến 10")
  }
  
  trung_binh <- mean(diem)
  return(trung_binh)
}

tinh_diem_trung_binh(c(8, 9, 7, 10))        

# Bài 3.1: tính toán tổng quan
tinh_tong_quan <- function(x) {
  if (!is.numeric(x)) {
    stop("Dữ liệu phải là số")
  }
  
  x <- x[!is.na(x)]
  
  if (length(x) == 0) {
    stop("Không có dữ liệu hợp lệ")
  }
  
  result <- list(
    mean   = mean(x),
    median = median(x),
    sd     = sd(x),
    min    = min(x),
    max    = max(x),
    range  = max(x) - min(x)
  )
  
  return(result)
}

diem <- c(75, 82, 68, NA, 91, 77)
tinh_tong_quan(diem)


# Bài 3.2: tính hoán vị P(n, r)
tinh_hoan_vi <- function(n, r) {
  if (!is.numeric(n) || !is.numeric(r)) {
    stop("n và r phải là số")
  }
  
  if (n %% 1 != 0 || r %% 1 != 0) {
    stop("n và r phải là số nguyên")
  }
  
  if (n < 0 || r < 0 || r > n) {
    stop("Điều kiện: 0 <= r <= n")
  }
  
  ket_qua <- factorial(n) / factorial(n - r)
  return(ket_qua)
}

tinh_hoan_vi(5, 2)    

# Bài 3.3: tính tổ hợp C(n, r)
tinh_to_hop <- function(n, r) {
  if (!is.numeric(n) || !is.numeric(r)) {
    stop("n và r phải là số")
  }
  
  if (n %% 1 != 0 || r %% 1 != 0) {
    stop("n và r phải là số nguyên")
  }
  
  if (n < 0 || r < 0 || r > n) {
    stop("Điều kiện: 0 <= r <= n")
  }
  
  ket_qua <- factorial(n) / (factorial(r) * factorial(n - r))
  return(ket_qua)
}

tinh_to_hop(5, 2) 

# Bài 4.1: tìm các số nguyên tố từ 1 đến n
tim_so_nguyen_to <- function(n) {
  if (!is.numeric(n) || n %% 1 != 0) {
    stop("n phải là số nguyên")
  }
  
  if (n < 2) {
    return(integer(0))
  }
  
  is_prime <- function(x) {
    if (x < 2) return(FALSE)
    if (x == 2) return(TRUE)
    if (x %% 2 == 0) return(FALSE)
    for (i in 3:floor(sqrt(x))) { 
      if (x %% i == 0) return(FALSE)
    }
    TRUE
  }
  
  ket_qua <- Filter(is_prime, 2:n)
  return(ket_qua)
}
tim_so_nguyen_to(50)

# Bài 4.2: tạo tam giác Pascal với n hàng
tao_tam_giac_pascal <- function(n) {
  if (!is.numeric(n) || n %% 1 != 0 || n <= 0) {
    stop("n phải là số nguyên dương")
  }
  
  ket_qua <- lapply(0:(n-1), function(i) {
    sapply(0:i, function(k) choose(i, k))
  })
  
  return(ket_qua)
}

tao_tam_giac_pascal(5)

# Bài 4.3: phân loại sinh viên dựa vào điểm
phan_loai_sinh_vien <- function(diem) {
  if (!is.numeric(diem)) {
    stop("Điểm phải là số")
  }
  if (diem < 0 || diem > 10) {
    stop("Điểm phải từ 0 đến 10")
  }
  
  xep_loai <- cut(diem,
                  breaks = c(0, 5, 6.5, 7.5, 8.5, 10),
                  labels = c("Yếu", "Trung bình", "Khá", "Giỏi", "Xuất sắc"),
                  include.lowest = TRUE 
  )
  
  gpa <- switch(as.character(xep_loai),
                "Xuất sắc"   = 4.0,
                "Giỏi"       = 3.5,
                "Khá"        = 3.0,
                "Trung bình" = 2.0,
                "Yếu"        = 0.0
  )
  
  return(list(xep_loai = as.character(xep_loai), gpa = gpa))
}

phan_loai_sinh_vien(9.5)

# Bài 5.1: tính lương ròng
tinh_luong_rong <- function(luong_co_ban, phu_cap, so_ngay_lam, gio_tang_ca) {
  # Kiểm tra input
  if (!is.numeric(luong_co_ban) || !is.numeric(phu_cap) ||
      !is.numeric(so_ngay_lam) || !is.numeric(gio_tang_ca)) {
    stop("Tat ca input phai la so")
  }
  
  if (luong_co_ban < 0 || phu_cap < 0 || so_ngay_lam < 0 || gio_tang_ca < 0) {
    stop("Gia tri khong duoc am")
  }
  
  # Tính lương
  luong_ngay <- luong_co_ban / 26
  luong_chinh <- luong_ngay * so_ngay_lam
  luong_tang_ca <- gio_tang_ca * (luong_ngay / 8) * 1.5
  
  tong_thu_nhap <- luong_chinh + phu_cap + luong_tang_ca
  thue <- tong_thu_nhap * 0.1
  
  luong_rong <- tong_thu_nhap - thue
  
  luong_rong
}
tinh_luong_rong(10000000, 2000000, 26, 10)

# Bài 5.2: chuẩn hóa điểm thi
chuan_hoa_diem <- function(diem) {
  # Kiểm tra input
  if (!is.numeric(diem)) {
    stop("Diem phai la so")
  }
  
  # Loại bỏ NA
  diem_sach <- diem[!is.na(diem)]
  
  if (length(diem_sach) == 0) {
    stop("Khong co du lieu hop le")
  }
  
  min_val <- min(diem_sach)
  max_val <- max(diem_sach)
  
  if (min_val == max_val) {
    stop("Khong the chuan hoa vi tat ca gia tri giong nhau")
  }
  
  diem_chuan <- (diem_sach - min_val) / (max_val - min_val) * 100
  
  diem_chuan
}
chuan_hoa_diem(c(5, 6, 7, 8, 9))

# Bài 5.3: phân tích dữ liệu sinh viên
phan_tich_sinh_vien <- function(df) {
  # Kiểm tra input
  if (!is.data.frame(df)) {
    stop("Input phai la data frame")
  }
  
  if (!all(c("ten", "tuoi", "diem") %in% names(df))) {
    stop("Data frame phai co cot: ten, tuoi, diem")
  }
  
  # Làm sạch dữ liệu
  df_sach <- df[!is.na(df$diem), ]
  
  # Thống kê điểm
  thong_ke_diem <- list(
    mean = mean(df_sach$diem),
    median = median(df_sach$diem),
    sd = sd(df_sach$diem),
    min = min(df_sach$diem),
    max = max(df_sach$diem)
  )
  
  # Thống kê tuổi
  thong_ke_tuoi <- list(
    mean = mean(df_sach$tuoi, na.rm = TRUE),
    min = min(df_sach$tuoi, na.rm = TRUE),
    max = max(df_sach$tuoi, na.rm = TRUE)
  )
  
  ket_qua <- list(
    so_sinh_vien = nrow(df_sach),
    thong_ke_diem = thong_ke_diem,
    thong_ke_tuoi = thong_ke_tuoi
  )
  
  ket_qua
}
# Test
df <- data.frame(
  ten = c("A", "B", "C"),
  tuoi = c(20, 21, 19),
  diem = c(8, 9, NA)
)

phan_tich_sinh_vien(df)