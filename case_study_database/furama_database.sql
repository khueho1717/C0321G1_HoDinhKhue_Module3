create database quan_ly_furama;
use quan_ly_furama;

create table vi_tri(
IDViTri int auto_increment primary key,
TenViTri varchar(45) not null
);

create table trinh_do(
IDTrinhDo int auto_increment primary key,
TrinhDo varchar(45) not null
);

create table bo_phan(
IDBoPhan int auto_increment primary key,
TenBoPhan varchar(45) not null
);

create table nhan_vien(
IDNhanVien int auto_increment primary key,
HoTen varchar(45) not null,
IDViTri int,
IDTrinhDo int,
IDBoPhan int,
NgaySinh date not null,
SoCMND varchar(45) not null,
Luong varchar(45) not null,
SDT int,
Email varchar(45),
DiaChi varchar(45),
foreign key (IDViTri) references vi_tri(IDViTri),
foreign key (IDTrinhDo) references trinh_do(IDTrinhDo),
foreign key (IDBoPhan) references bo_phan(IDBoPhan)
);

create table loai_khach(
IDLoaiKhach int auto_increment primary key,
TenLoaiKhach varchar(45) not null
);

create table khach_hang(
IDKhachhang int auto_increment primary key,
IDLoaiKhach int,
HoTen varchar(45) not null,
NgaySinh date,
SoCMND varchar(45) not null,
SDT int,
Email varchar(45),
DiaChi varchar(45),
foreign key (IDLoaiKhach) references loai_khach(IDLoaiKhach)
);

create table kieu_thue(
IDKieuThue int auto_increment primary key,
TenKieuThue varchar(45) not null,
Gia int not null check(Gia>=0)
);

create table loai_dich_vu(
IDLoaiDichVu int auto_increment primary key,
TenLoaiDichVu varchar(45) not null
);

create table dich_vu(
IDDichVu int auto_increment primary key,
TenDichVu varchar(45) not null,
DienTich int not null check(DienTich>0),
SoTang int not null check(SoTang>0),
SoNguoiToiDa int ,
ChiPhiThue int  not null check(ChiPhiThue>0),
IDKieuThue int not null,
IDLoaiDichVu int not null,
TrangThai varchar(45),
foreign key(IDKieuThue) references kieu_thue(IDKieuThue),
foreign key(IDLoaiDichVu) references loai_dich_vu(IDLoaiDichVu)
);

create table hop_dong(
IDHopDong int auto_increment primary key,
IDNhanVien int not null,
IDKhachhang int not null,
IDDichVu int not null,
NgayLamHopDong date not null,
NgayKetThuc date not null,
TienDatCoc int  check(TienDatCoc>=0),
TongTien int check(TongTien>0),
foreign key(IDNhanVien) references nhan_vien(IDNhanVien),
foreign key(IDKhachhang) references khach_hang(IDKhachhang),
foreign key(IDDichVu) references dich_vu(IDDichVu)
);

create table dich_vu_di_kem(
IDDichVuDiKem int auto_increment primary key,
TenDichVuDiKem varchar(45) not null,
Gia int  check(Gia>0),
DonVi int check(DonVi>0),
TrangThaiKhaDung varchar(45)
);

create table hop_dong_chi_tiet(
IDHopDongChiTiet int auto_increment primary key,
IDHopDong int not null,
IDDichVuDiKem int not null,
SoLuong int,
foreign key(IDHopDong) references hop_dong(IDHopDong),
foreign key(IDDichVuDiKem) references dich_vu_di_kem(IDDichVuDiKem)
);
-- task1: thêm thông tin cho tất cả các bảng --

insert into vi_tri
values
(1,'lễ tân'),
(2,'phục vụ'),
(3,'chuyên viên'),
(4,'giám sát'),
(5,'quản lí'),
(6,'giám đốc');

insert into trinh_do
values
(1,'trung cấp'),
(2,'cao đẳng'),
(3,'đại học'),
(4,'sau đại học');

insert into bo_phan
values
(1,'Sale – Marketing'),
(2,'Hành Chính'),
(3,'Phục vụ'),
(4,'Quản lý');

insert into nhan_vien
values
(1,'Hồ Đình Khuê',6,4,2,1978-02-12,206184291,50000000,0905345432,'khue@gmail.com','Đà Nẵng'),
(2,'Nguyễn Văn Sơn',1,1,1,1999-12-12,206764234,5000000,090534345,'nguyenson@gmail.com','Đà Nẵng'),
(3,'Nguyễn Văn An',1,1,3,1988-04-13,206184291,5000000,0905768796,'vanan@gmail.com','Quảng Nam'),
(4,'Lê Thị Thu',2,3,4,1995-02-12,206184291,10000000,0905453657,'lethu@gmail.com','Đà Nẵng'),
(5,'Trương Văn Tuấn',2,3,1,1989-02-09,206915647,10000000,0909452456,'vantuan@gmail.com','Hồ Chí Minh'),
(6,'Trần Khánh Chi',3,3,2,1991-12-17,202914563,20000000,0905567345,'tranchi@gmail.com','Hà Nội'),
(7,'Nguyễn Ngọc',3,3,1,1988-02-12,206566914,20000000,09055467846,'nguyenngoc@gmail.com','Hai Phòng'),
(8,'La Thành',4,4,4,1978-02-12,206184291,50000000,0905345432,'khue@gmail.com','Đà Nẵng'),
(9,'Hồ Văn Chiến',6,4,2,1978-02-18,20657478,30000000,0935678567,'vanchien@gmail.com','Đà Nẵng'),
(10,'Võ Anh Dũng',5,4,1,1990-02-12,20656465,40000000,0905345768,'voanh@gmail.com','Quảng Nam');

insert into loai_khach
values
(1,'Diamond'),
(2,'Platinium'),
(3,'Gold'),
(4,'Silver'),
(5,'Member');	

insert into khach_hang
values
(1,2,'Nguyễn Đoàn',1989-02-09,'234345345','090543454','nguyendoan@gmail.com','Hai Phong'),
(2,3,'Nguyễn Anh',1991-12-17,'223445398','095643457','nguyenanh@gmail.com','Quảng Bình'),
(3,1,'Lê Hùng',1990-02-12,'342345456','0906456756','hung@gmail.com','Hai Dương'),
(4,4,'Đoàn Lĩnh',1978-02-12,'234345665','0935678767','doanlinhgmail.com','Đà Nẵng'),
(5,5,'Tô Lâm',1995-02-12,'323454345','090542546','tolam@gmail.com','Hà Nội');

insert into loai_dich_vu
values
(1,'Villa'),
(2,'House'),
(3,'Room');

insert into kieu_thue
values
(1,'năm',90000000),
(2,'tháng',1200000),
(3,'ngày',2000000),
(4,'giờ',200000);

insert into dich_vu
values
(1,'thuê view biển villa',200,2,'12',5000000,3,1,'tốt nhất'),
(2,'thuê view biển house',100,2,'9',4000000,3,2,'tốt nhất'),
(3,'thuê view biển room',30,2,'3',3000000,3,3,'tốt nhất'),
(4,'thuê view trung tâm villa',200,2,'12',4000000,3,1,'tốt nhất'),
(5,'thuê view trung tâm house',100,2,'9',3000000,3,2,'tốt nhất'),
(6,'thuê view trung tâm room',30,2,'3',2000000,3,3,'tốt nhất');

insert into hop_dong
values
(1,2,1,1,12/12/2020,2/01/2021,3000000,5000000),
(2,3,4,2,12/01/2021,20/01/2021,400000,7000000),
(3,6,3,4,12/03/2020,22/03/2021,5000000,10000000);

insert into dich_vu_di_kem
values
(1,'massage',500000,1,'hoàn thành'),
(2,'karaoke',400000,1,'một giờ'),
(3,'thức ăn',100000,1,'một khẩu phần'),
(4,'nước uống',20000,1,'chai'),
(5,'thuê xe di chuyển tham quan resort',1000000,1,'tour');

insert into hop_dong_chi_tiet
values
(1,1,2,3),
(2,2,1,2),
(3,3,4,2);



