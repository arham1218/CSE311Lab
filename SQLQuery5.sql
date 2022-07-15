use master
drop database cse311project

create database cse311project
use cse311project

create table customer
(
customer_id int primary key,
full_name varchar(20),
email varchar(30),
username varchar(20),
password varchar(30)
)

create table order_product
(
order_id int primary key,
customer_id int,
order_date date
constraint order_fk foreign key (customer_id) references [dbo].[customer]([customer_id])
ON UPDATE CASCADE
ON DELETE CASCADE
)

create table product
(
product_id int primary key,
product_name varchar(30),
manufacturer varchar(30),
warranty_year int,
price varchar(10)
)

create table payment
(
purchase_id int,
order_id int,
payment_type varchar(20),
amount int
constraint payment_fk foreign key (order_id) references [dbo].[order_product]([order_id])
ON UPDATE CASCADE
ON DELETE CASCADE,
);

create table ordered_product_details
(
order_id int,
product_id int,
quantity smallint,
primary key(order_id,product_id),
constraint ordered_product_details_fk foreign key (order_id) references [dbo].[order_product]([order_id])
ON UPDATE CASCADE
ON DELETE CASCADE,
constraint ordered_product_details_fk1 foreign key (product_id) references [dbo].[product]([product_id])
ON UPDATE CASCADE
ON DELETE CASCADE,
)

create table inventory
(
product_id int,
available_quantity int
constraint inventory_fk foreign key (product_id) references [dbo].[product]([product_id])
ON UPDATE CASCADE
ON DELETE CASCADE
)




insert into customer values
('1','Arham Chowdhury','arham@gmail.com','arham1218','msd2020'),
('2','Anis Chowdhury','anis@gmail.com','anis00','msd1999'),
('3','Ania Khan','ania@gmail.com','ania1212','msd0000'),
('4','Ronaldo Rahim','ronaldo@gmail.com','ron111','msd8888'),
('5','Lionel Messi','messi@gmail.com','messi777','msd777'),
('6','Sergio Ramos','sergio@gmail.com','sergio','msd989'),
('7','Chris Gayle','chris@gmail.com','chris000','msd444'),
('8','Ruhul Amin','ruhul@gmail.com','ruhul11','msd2222'),
('9','Abed Gazi','abed@gmail.com','abed','msd77788'),
('10','Tanzil Gazi','tazil@gmail.com','tanzil778','msd6655')select * from customerinsert into order_product values
('101','2','2017-08-19'),
('201','2','2014-02-01'),
('301','3','2013-08-02'),
('401','4','2011-06-20'),
('501','5','2022-05-12'),
('601','5','2014-07-29'),
('701','7','2016-02-22'),
('801','6','2016-05-05'),
('901','1','2016-02-11'),
('1001','2','2016-03-11')select * from order_productinsert into product values
('401','B450 Motherboard','ASRock','3','30000'),
('402','keyboard','Gigabyte Technology','1','20000'),
('403','Headphone','Gigabyte Technology','1','40000'),
('404','Power supply','Gigabyte Technology','5','546000'),
('405','Mortar Max','MSI','3','120000'),
('406','Cpu-cooler','Deepcool','1','40000'),
('407','Mouse','Dell','1','60000'),
('408','Power supply','Antec','7','30000'),
('409','1650 super','Nvidia','5','140000'),
('410','1660 super','Nvidia','5','35000')select * from productinsert into ordered_product_details values
('101','401','3'),
('301','402','4'),
('701','403','2'),
('501','403','1'),
('201','402','4'),
('301','407','2'),
('401','405','2'),
('601','406','3'),
('901','407','4'),
('801','407','1')

select * from ordered_product_details

insert into inventory
values
('401','7'),
('402','55'),
('403','12'),
('404','13'),
('405','45'),
('406','50'),
('407','225'),
('408','13'),
('409','3'),
('410','4')

select * from inventory

insert into payment values
('1','101','Cash','2500'),
('2','201','Bkash','7000'),
('3','301','Card','8000'),
('4','401','Cash','9000'),
('5','501','Cash','78000'),
('6','601','Cash','1200'),
('7','701','Bkash','1600'),
('8','801','Bkash','13000'),
('9','901','Card','3000')

select * from payment
