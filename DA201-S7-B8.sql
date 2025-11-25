SELECT 
    ten_giang_vien,
    SUM(gia_tien) AS tong_doanh_thu_q1
FROM ghi_danh
WHERE ngay_ghi_danh BETWEEN '2023-01-01' AND '2023-03-31'
GROUP BY ten_giang_vien
HAVING SUM(gia_tien) > 1000000;
SELECT 
    ten_khoa_hoc,
    COUNT(*) AS so_luong_ghi_danh,
    (SUM(CASE WHEN trang_thai_hoan_thanh = 'Da hoan thanh' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS ty_le_hoan_thanh
FROM ghi_danh
GROUP BY ten_khoa_hoc
HAVING COUNT(*) >= 2
   AND (SUM(CASE WHEN trang_thai_hoan_thanh = 'Da hoan thanh' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) < 50;
SELECT 
    id_hoc_vien,
    COUNT(DISTINCT id_khoa_hoc) AS so_khoa_hoc_da_dang_ky,
    SUM(gia_tien) AS tong_chi_tieu
FROM ghi_danh
GROUP BY id_hoc_vien
HAVING COUNT(DISTINCT id_khoa_hoc) >= 2
   AND SUM(gia_tien) > 1000000;
SELECT 
    MONTH(ngay_ghi_danh) AS thang_ghi_danh,
    SUM(gia_tien) AS tong_doanh_thu
FROM ghi_danh
WHERE YEAR(ngay_ghi_danh) = 2023
GROUP BY MONTH(ngay_ghi_danh)
HAVING SUM(gia_tien) > 1000000
ORDER BY thang_ghi_danh ASC;
