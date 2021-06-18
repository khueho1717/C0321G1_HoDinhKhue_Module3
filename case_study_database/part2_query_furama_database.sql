use quan_ly_furama;

-- task 21

create view v_nhan_vien as
select *
from nhan_vien
where nhan_vien.dia_chi='Hải Châu' 
and (nhan_vien.id_nhan_vien 
in (select id_nhan_vien 
from hop_dong
 where ngay_lam_hop_dong='2019-12-12' 
 group by id_nhan_vien ));


-- task 22

SET SQL_SAFE_UPDATES = 0;
update v_nhan_vien
set  dia_chi='Liên Chiểu';

-- task 23
-- CREATE UNIQUE CLUSTERED INDEX ix_khach_hang
-- ON khach_hang(id_khach_hang);


-- task 24 

CREATE UNIQUE INDEX IX_SoDT_DiaChi 
ON khach_hang(sdt, dia_chi);

explain select * from khach_hang where sdt = '123456789' and dia_chi ='da nang';

-- task 25

delimiter //
create procedure Sp_1 (in id_khach_hang int) 
begin
delete from khach_hang
where khach_hang.id_khach_hang=id_khach_hang;
end //
delimiter ;

call Sp_1(2);

-- task 26

delimiter //
create procedure Sp_2(in id_hop_dong int, in id_nhan_vien int, in id_dich_vu int, in ngay_lam_hop_dong date,in ngay_ket_thuc date,in tien_dat_coc int, in tong_tien int) 
begin
if(id_hop_dong not in (select id_hop_dong from hop_dong))
then insert into hop_dong 
values (id_hop_dong ,  id_nhan_vien ,  id_dich_vu ,  ngay_lam_hop_dong , ngay_ket_thuc , tien_dat_coc ,  tong_tien);
end if;
end//
delimiter ;



-- task 27



delimiter //
drop trigger if exists tr_1 //
create trigger tr_1
after delete
on hop_dong for each row
begin
 set @o =(select count(id_hop_dong) as "Số hợp đồng còn lại" from hop_dong);
end //
delimiter ;
set @o =0;
delete from hop_dong where id_hop_dong =2;
select @o as "so_hop_dong"



-- task 28


delimiter //
create trigger tr_2
after update on hop_dong
for each row
begin
if datediff(new.ngay_ket_thuc,old.ngay_lam_hop_dong)<2 then
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "ngày kết thúc phải sau ngày làm hợp đồng ít nhất 2 ngày";
end if;
end //
delimiter ;
set @a =0;
SET SQL_SAFE_UPDATES = 0;
update hop_dong set ngay_ket_thuc = '2019-11-02' where id_hop_dong = 1;
drop trigger tr_2;

-- task 29

-- a

delimiter //
create function func_1 ()
returns int
deterministic
begin
declare cnt int;
create temporary table test(
SELECT count(id_dich_vu) as so_dich_vu 
from hop_dong group by id_dich_vu having sum(tong_tien)>2000000);
set cnt = (select count(so_dich_vu) from test group by so_dich_vu);
return cnt ;
end ;
// delimiter ;
select func_1() as so_dich_vu;
drop table test;

-- b

delimiter //
create function func_2 (id int)
returns int
deterministic
begin
declare thoi_gian int;
 set thoi_gian =( select datediff(ngay_ket_thuc,ngay_lam_hop_dong) from hop_dong where id_hop_dong = id);
 return thoi_gian;
end;
// delimiter ;
select func_2(1) as "số ngày";
drop function `furoma`.`func_2`;



-- task 30









