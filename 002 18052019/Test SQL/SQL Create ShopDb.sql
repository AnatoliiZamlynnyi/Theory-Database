create database Products;
go
use ShopDB;
create table Categories
(
Id int primary key identity(1,1),
Name nvarchar(30) unique
);

create table Producers
(
	Id int primary key identity(1,1),
	Name nvarchar(40) unique,
	Country nvarchar(30)
);

create table Products
(
Id int primary key identity(100, 5),
Name nvarchar(50),
Price money,
Qty int ,
CategoryId int not null foreign key references Categories(Id),
ProducerId int not null foreign key references Producers(Id)
);
----add data----
insert into  Categories
values
('Bakery'),
 ('Dairy'),
 ('Confections'),
 ('Drinks'); 
 select * from Categories;

insert into Producers(Name, Country) 
values
	('Galichina', 'Urraine'),
	('Rumianets', 'Ukraine'),
	('Komo', 'Ukraine'),
	('Danone', 'Ukraine'),
	('Lavazza', 'Italy'),
	('TChibo', 'Germany'),
	('Thurson', 'Shri-Lanka');


insert into Products values
	('white bread', 15, 40, 1, 2),
	('sereals bread', 22, 40, 1, 2),
	('banana yogurt', 12, 30,2,  3),
	('classic yogurt', 10.50, 30, 2, 3),
	('Zhivinka yougurt', 22.10, 25,2, 4 ),
	('Child yougurt', 17.10, 20,2, 4 ),
	('Coffee crema', 90, 10,4, 5),
	('Coffee rossa', 99, 10,4, 5),
	('Coffee family', 85, 14,4, 6),
	('Coffee exclusive', 80.80, 12,4, 6),
	('Green tea', 106, 10,4, 7),
	('Black tea', 96.1, 10,4, 7);

	select * from products

