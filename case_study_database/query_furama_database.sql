use quan_ly_furama;

-- Task 2 
select *
from nhan_vien
where (HoTen like ('H%')
or HoTen like ('T%')
or HoTen like ('K%')) and CHARACTER_LENGTH(HoTen)<15;

-- Task 3




