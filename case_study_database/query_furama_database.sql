use quan_ly_furama;

-- Task 2 
select *
from nhan_vien
where (ho_ten like ('H%')
or ho_ten like ('T%')
or ho_ten like ('K%')) and CHARACTER_LENGTH(ho_ten)<15;

-- Task 3

select *
from khach_hang
where ( TIMESTAMPDIFF (YEAR, ngay_sinh, CURDATE())
between 18 and 50) 
and (dia_chi='Đà Nẵng' or dia_chi='Quảng Trị');

-- task 4
select khach_hang.*, count(hop_dong.id_hop_dong) as lan_dat
from khach_hang
inner join hop_dong on khach_hang.id_khach_hang=hop_dong.id_khach_hang
where id_loai_khach=1
group by id_khach_hang
order by lan_dat;

-- task 5

select khach_hang.id_khach_hang, khach_hang.ho_ten,loai_khach.ten_loai_khach,hop_dong.id_hop_dong,dich_vu.ten_dich_vu,hop_dong.ngay_lam_hop_dong,hop_dong.ngay_ket_thuc, sum(dich_vu.chi_phi_thue + hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia) as tong_tien
from khach_hang
left join loai_khach on khach_hang.id_loai_khach=loai_khach.id_loai_khach
left join hop_dong on khach_hang.id_khach_hang=hop_dong.id_khach_hang
left join dich_vu on hop_dong.id_dich_vu=dich_vu.id_dich_vu
left join hop_dong_chi_tiet on hop_dong.id_hop_dong=hop_dong_chi_tiet.id_hop_dong
left join dich_vu_di_kem on hop_dong_chi_tiet.id_dich_vu_di_kem=dich_vu_di_kem.id_dich_vu_di_kem
group by khach_hang.id_khach_hang, hop_dong.id_hop_dong, tong_tien;


-- task 6


select dich_vu.id_dich_vu,dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.chi_phi_thue,loai_dich_vu.ten_loai_dich_vu
from dich_vu
join loai_dich_vu on dich_vu.id_loai_dich_vu=loai_dich_vu.id_loai_dich_vu
join hop_dong on dich_vu.id_dich_vu=hop_dong.id_dich_vu
where dich_vu.id_dich_vu not in (select hop_dong.id_dich_vu from hop_dong where (year(ngay_lam_hop_dong)=2019) and (month(ngay_lam_hop_dong) in (01,02,03)));

-- task 7

select dich_vu.id_dich_vu,dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.so_nguoi_toi_da,dich_vu.chi_phi_thue,loai_dich_vu.ten_loai_dich_vu
from dich_vu
join loai_dich_vu on dich_vu.id_loai_dich_vu=loai_dich_vu.id_loai_dich_vu
join hop_dong on dich_vu.id_dich_vu=hop_dong.id_dich_vu
where year(ngay_lam_hop_dong)=2018 and year(ngay_lam_hop_dong) not in (select year(ngay_lam_hop_dong)	from hop_dong where (year(ngay_lam_hop_dong)=2019));



-- task 8
-- Cách 1:
select khach_hang.ho_ten
from khach_hang
group by khach_hang.ho_ten;
-- Cách 2:
select distinct khach_hang.ho_ten
from khach_hang
group by khach_hang.ho_ten;
-- Cách 3:
select khach_hang.ho_ten
from khach_hang
union
select khach_hang.ho_ten
from khach_hang;

-- task 9

select month(ngay_lam_hop_dong) as "Thang", sum(dich_vu.chi_phi_thue +hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia) as "Tong tien",count(hop_dong.id_khach_hang) as "So khach thue dich vu"
from hop_dong
join dich_vu on hop_dong.id_dich_vu=dich_vu.id_dich_vu
join hop_dong_chi_tiet on hop_dong.id_hop_dong=hop_dong_chi_tiet.id_hop_dong
join dich_vu_di_kem on hop_dong_chi_tiet.id_dich_vu_di_kem=dich_vu_di_kem.id_dich_vu_di_kem
where year(ngay_lam_hop_dong)=2019
group by month(ngay_lam_hop_dong);

-- task 10

select hop_dong.id_hop_dong,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,
count(ID_hop_dong_chi_tiet) as so_luong_dich_vu_di_kem
from hop_dong
left join hop_dong_chi_tiet on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
group by id_hop_dong;

-- task 11

select khach_hang.id_khach_hang,ten_loai_khach, dich_vu_di_kem.ten_dich_vu_di_kem,
dich_vu_di_kem.gia,dich_vu_di_kem.don_vi, hop_dong_chi_tiet.so_luong
from khach_hang
join loai_khach on khach_hang.id_loai_khach = loai_khach.id_loai_khach
join hop_dong on hop_dong.id_khach_hang = khach_hang.id_khach_hang
join hop_dong_chi_tiet on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
join dich_vu_di_kem on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
where ten_loai_khach = 'Diamond' and ( dia_chi = 'vinh' or dia_chi = 'quang ngai');

-- task 12
-- 12.	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang,
--  SoDienThoaiKhachHang, TenDichVu,
--  SoLuongDichVuDikem (được tính dựa trên tổng Hợp đồng chi tiết),
--  TienDatCoc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2019
--  nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.
select hop_dong.id_hop_dong, nhan_vien.ho_ten as nhan_vien, khach_hang.ho_ten as khach_hang, khach_hang.sdt, loai_dich_vu.ten_loai_dich_vu, count(id_hop_dong_chi_tiet) as so_luong_dich_vu_di_kem, sum(tien_dat_coc) as tien_dat_coc
from hop_dong
left join khach_hang on hop_dong.id_khach_hang = khach_hang.id_khach_hang
left join dich_vu on dich_vu.id_dich_vu = hop_dong.id_dich_vu
left join loai_dich_vu on loai_dich_vu.id_loai_dich_vu= dich_vu.id_loai_dich_vu
left join hop_dong_chi_tiet on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
left join dich_vu_di_kem on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
left join nhan_vien on nhan_vien.id_nhan_vien = hop_dong.ID_nhan_vien 
where (year(ngay_lam_hop_dong)=2019  and month(ngay_lam_hop_dong) between 10 and 12) not in(year(ngay_lam_hop_dong)=2019  and month(ngay_lam_hop_dong) between 1 and 9)
group by id_hop_dong;


-- task 13

select dich_vu_di_kem.*, sum(so_luong) as tong_so_luong, count(dich_vu_di_kem.id_dich_vu_di_kem) as tong_lan_dat
from  hop_dong_chi_tiet
join dich_vu_di_kem on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
group by id_dich_vu_di_kem;

-- task 14

select dich_vu_di_kem.*, sum(so_luong) as so_luong, count(dich_vu_di_kem.id_dich_vu_di_kem) as tong_lan_dat
from  hop_dong_chi_tiet
join dich_vu_di_kem on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
group by id_dich_vu_di_kem
having tong_lan_dat=1;

-- task 15	Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai,
--  DiaChi mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019.

select nhan_vien.id_nhan_vien, nhan_vien.ho_ten, trinh_do.trinh_do, bo_phan.ten_bo_phan, nhan_vien.sdt, nhan_vien.dia_chi,count(id_hop_dong) so_luong_hop_dong,ngay_lam_hop_dong
from nhan_vien
left join trinh_do on nhan_vien.ID_trinh_do = trinh_do.ID_trinh_do
left join bo_phan on bo_phan.ID_bo_phan = nhan_vien.ID_bo_phan
left join hop_dong on nhan_vien.ID_nhan_vien = hop_dong.ID_nhan_vien
group by nhan_vien.ID_nhan_vien
having count(id_hop_dong) <=3 and (hop_dong.ngay_lam_hop_dong between '2018-01-01' and '2019-12-31' or hop_dong.ngay_lam_hop_dong is null);


-- task 16

delete from nhan_vien
where id_nhan_vien not in (select id_nhan_vien from hop_dong where year(ngay_lam_hop_dong) between 2017 and 2019);

-- task 17

update khach_hang
set id_loai_khach=1
where id_loai_khach=2 and id_loai_khach in (fgsdgs)







