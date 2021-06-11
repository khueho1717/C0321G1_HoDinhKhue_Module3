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
SDT varchar(45),
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
SoCMND varchar(45) not null,
SDT varchar(45),
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
SoNguoiToiDa varchar(45) not null,
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
TienDatCoc int not null check(TienDatCoc>=0),
TongTien int not null check(TongTien>0),
foreign key(IDNhanVien) references nhan_vien(IDNhanVien),
foreign key(IDKhachhang) references khach_hang(IDKhachhang),
foreign key(IDDichVu) references dich_vu(IDDichVu)
);

create table dich_vu_di_kem(
IDDichVuDiKem int auto_increment primary key,
TenDichVuDiKem varchar(45) not null,
Gia int not null check(Gia>0),
DonVi int not null check(DonVi>0),
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



