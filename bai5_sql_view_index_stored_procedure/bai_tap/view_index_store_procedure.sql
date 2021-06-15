create database demo;

use demo;
-- buoc 2
create table products(
Id int auto_increment primary key,
product_code varchar(45),
product_name varchar(45),
product_price float,
product_amount int,
product_description varchar(45),
product_status bit
);

insert into products(product_code,product_name,product_price,product_amount,product_description,product_status)
value
('p12','iphone 12',1000,1000,'tran vien tai tho',1),
('p11','iphone 11',800,1000,'tran vien lcd',1),
('p10','iphone 10',600,2000,'tai tho',0);

-- buoc3

CREATE UNIQUE INDEX index_product_code
ON products (product_code);

CREATE UNIQUE INDEX composite_index
ON products (product_name,product_price);

explain select *
from products;

select *
from products;

-- buoc 4

CREATE VIEW products_views AS

SELECT product_code, product_name, product_price, product_status

FROM  products;

select * from products_views;

CREATE OR REPLACE VIEW products_views AS
SELECT Id, product_code, product_name, product_price, product_status
FROM  products
WHERE product_status=1;

drop view products_views;

-- buoc 5





