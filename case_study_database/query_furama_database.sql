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





-- task 8
select distinct khach_hang.ho_ten
from khach_hang;







