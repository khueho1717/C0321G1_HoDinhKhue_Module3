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

-- 26

delimiter //
create procedure insert_product(in product_code varchar(45), in product_name varchar(45), in product_price float, in product_amount int,in product_description varchar(45),in product_status bit) 
begin
insert into products(product_code,product_name,product_price , product_amount,product_description, product_status)
value(product_code,product_name,product_price , product_amount,product_description, product_status);
end//
delimiter ;


