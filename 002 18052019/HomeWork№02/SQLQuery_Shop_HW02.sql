--Завдання 1.
--Створити базу даних Магазин.
--Створити таблиці у базі даних за зразком таблиць, що створені на ресурсі https://www.w3schools.com/sql/trysql.asp?filename=trysql_select_columns
--*Можна з вказаного ресурсу  скопіювати дані(частину даних) у свої таблиці
-----------------------------------------------------------------------------------------------------
--1	Categories(Категорії)
--	Id - ціле, автоінкремент, первинний ключ	, не null
--	CategoryName - рядок, унікальне
--	Description - опис категорії продуктів
-----------------------------------------------------------------------------------------------------
--2	Suppliers (Постачальники)
--	Id - ціле, автоінкремент, первинний ключ	, не null
--	SupplierName- рядок, унікальне
--	Address - рядок
--	City - рядок
--	Country  - рядок
-----------------------------------------------------------------------------------------------------
--3	Customers(Клієнти)
--	Id - ціле, автоінкремент, первинний ключ	, не null
--	CustomerName- рядок
--	Address - рядок
--	City - рядок
--	Country  - рядок
-----------------------------------------------------------------------------------------------------
--4	Products(Товари)
--	Id - ціле, автоінкремент, первинний ключ	, не null
--	ProductName - рядок
--	SupplierID	 - ціле, зовнішній ключ (для звязку з таблицею Supplier по полю Supplier.Id)
--	CategoryID - ціле, зовнішній ключ (для звязку з таблицею Categories по полю Categories.Id)
--	Unit (упаковка) - рядок
--	Price - грошового   типу
-----------------------------------------------------------------------------------------------------
--5	Employees(Працівники)
--	Id - ціле, автоінкремент, первинний ключ	, не null
--	LastName  - рядок
--	FirstName	 - рядок
--	BirthDate - дата(date)
-----------------------------------------------------------------------------------------------------
--6	Shippers(Перевізники)
--	Id - ціле, автоінкремент, первинний ключ	, не null
--	ShipperName - рядок
--	Phone -  рядок
-----------------------------------------------------------------------------------------------------
--7	Orders( Замовлення)
--	Id - ціле, автоінкремент, первинний ключ	, не null
--	CustomerID - ціле, зовнішній ключ
--	EmployeeID- ціле, зовнішній ключ
--	OrderDate - дата
--	ShipperID - ціле, зовнішній ключ	
-----------------------------------------------------------------------------------------------------
--8	OrderDetails(Деталі замовлень)
--	Id - ціле, автоінкремент, первинний ключ	, не null
--	OrderID- ціле, зовнішній ключ
--	ProductID- ціле, зовнішній ключ
--	Quantity - ціле
--1.2. Побудувати схему бази даних(Database Diagram). Надіслати скрін схеми.
----------------------------------------------------------------------------------------------------------------------------------
--Завдання 2.
--Побудувати однотабличні(на основі одної  з таблиць) sql - запити для виконання наступних дій
--	вибрати замовлення, які зроблені у певному місяці 
--	вивести працівників, молодших від 30 років
--	вивести імена клієнтів, які починаються на деякі букви (наприклад, A B або  С, скористатися Like '[ABC]%', див. уроки )
--__________________________________________________________________________
--Завдання 3.
--Створити багатотабличні запити та запити з використанням агрегатних функцій для створеної  бази даних Магазин.
--	Вивести кількість категорій товарів
--	Знайти число товарів у категорії "Кондитерські вироби"(Confections)
--	Знати назви товарів з категорії "Напої"(Beverages)
--	Знайти середню ціну, максимальну та мінімальну ціни товарів у певній категорії
--	Знайти середній вік працівників
--	Знайти товари(назва, ціна, упаковка), які постачаються з певної країни (Італії чи ін.)
--	Вивести назви товарів, імена(назви) клієнтів та назви постачальників товарів
--	Вивести назви постачальників морських продуктів(Seafood)
--	Знайти скільки замовлень виконав певний перевізник(в умові вказувати назву перевізника, наприклад 'Speedy Express' )
--	Вивести дані про замовлення (номер замовлення, назва клієнта, імя працівника, назва перевізника) за певний місяць певного року
--	Вивести дані про виконані замовлення певного клієнта  (номер замовлення, назва клієнта, імя працівника, назва перевізника)
--	Вивести кількість   замовлень певного клієнта( в умові вказувати назву клієнта)
--	Знайти загальне число товарів замовлених певним клієнтом(в умові вказувати назву клієнта, наприклад 'Romero y tomillo'), тобто сумувати по полю quantity
--	Знайти загальну грошову  суму, на яку  замовив товарів  певний клієнт(в умові вказувати назву клієнта, наприклад 'Romero y tomillo'), 
--______________________________________________________________________
--Завдання 4. 
--Використати group by, при потребі having, where  та агрегатні функції.
--	Вивести кількість замовлень по кожному клієнту
--	Вивести кількість замовлень по кожному клієнту, здійснені після вказаної дати
--	Вивести кількість замовлень по кожному клієнту, що здійснив  більше 5 замовлень
--	Вивести кількіcть товарів по кожному замовленню(sum)
--	Знайти кількість товарів, які постачаються з кожної країни
--	Вивести вартість (ціна продукту *кількіcть продукту ) по кожному замовленню(sum)

--Завдання 2.
select *from tblOrders where MONTH([OrderDate])=05;
select *from tblEmployees where Floor(DateDiff(DAY, BirthDate, GetDate()) / 365.25) BETWEEN 0 and 30;
select *from tblCustomers where CustomerName like '[клм]%';
--Завдання 3.
select count (*) as 'Categories' from tblCategories;
select count (*) as 'Categories' from tblCategories;
select count (*) as 'Products' from tblProducts as p, tblCategories as c where p.CategoryID=c.Id and CategoryName='Кондитерські вироби';
select p.ProductName as 'Products' from tblProducts as p, tblCategories as c where p.CategoryID=c.Id and CategoryName='Напої';
select avg(p.Price) as 'Середня ціна', min(p.Price) as 'Мінімальна ціна', max(p.Price) as 'Максимальна ціна' from tblProducts  as p, tblCategories as c where p.CategoryID=c.Id and CategoryName='Кондитерські вироби';
select p.ProductName, p.Price, p.Unit, s.Country from tblProducts as p, tblSuppliers as s where p.SupplierID=s.Id and Country ='США';
select s.SupplierName from tblProducts as p, tblCategories as c, tblSuppliers as s where p.CategoryID=c.Id and p.SupplierID=s.Id and CategoryName='Морепродукти';
select count(*) as "Count Shippers"  from tblShippers as s, tblOrders as o where o.ShipperID=s.Id and ShipperName='Автолюкс';   
select o.Id as 'Number order', c.CustomerName as 'Customer name', e.LastName+' '+e.FirstName as 'Employees', s.ShipperName as 'ShipperName' 
	from tblOrders as o, tblCustomers as c, tblEmployees as e, tblShippers as s
	where o.CustomerID=c.Id and  o.EmployeeID=e.Id and o.ShipperID=s.Id and Year([OrderDate])=2019 and Month([OrderDate])=03
select o.Id as 'Number order', c.CustomerName as 'Customer name', e.LastName+' '+e.FirstName as 'Employees', s.ShipperName as 'ShipperName' 
	from tblOrders as o, tblCustomers as c, tblEmployees as e, tblShippers as s
	where o.CustomerID=c.Id and  o.EmployeeID=e.Id and o.ShipperID=s.Id and C.CustomerName='НФС';
select count(*) as "Count Customers"  from tblCustomers as c, tblOrders as o where o.CustomerID=c.Id and c.CustomerName='НФС';   
select SUM(od.Quantity) as 'Quantity' from  tblOrderDetails as od, tblCustomers as c, tblOrders as o where od.OrderID=o.Id and o.CustomerID=c.Id and c.CustomerName='НФС';
select SUM(p.Price*od.Quantity) as 'Quantity' from tblProducts as p, tblOrderDetails as od, tblCustomers as c, tblOrders as o where od.ProductID=p.Id and od.OrderID=o.Id and o.CustomerID=c.Id and c.CustomerName='НФС';
--Завдання 4.
select c.[CustomerName] as 'Customer Name', count(*) as 'Cound Order' from tblOrders as o, tblCustomers as c where o.CustomerID=c.Id
	group by c.CustomerName; 
select c.[CustomerName] as 'Customer Name', count(*) as 'Cound Order' from tblOrders as o, tblCustomers as c where o.CustomerID=c.Id and Year([OrderDate])>=2019 and Month([OrderDate])>=04
	group by c.CustomerName; 
select c.[CustomerName] as 'Customer Name', count(*) as 'Cound Order' from tblOrders as o, tblCustomers as c where o.CustomerID=c.Id
	group by c.CustomerName having count(*)>5; 
select p.[ProductName] as 'Product Name', sum(od.Quantity) as 'Cound Order' from tblOrderDetails as od, tblProducts as p where od.ProductID=p.Id
	group by p.ProductName; 
select p.[ProductName] as 'Product Name', sum(p.Price*od.Quantity) as 'Cound Order' from tblOrderDetails as od, tblProducts as p where od.ProductID=p.Id
	group by p.ProductName; 