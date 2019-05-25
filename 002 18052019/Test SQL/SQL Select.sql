--select * from tblCategories

--select [p.Name], p.Price, c.Name from [tblProducts] as p, tblCategories as c where c.Id = p.CategoryId

--select CategoryId as 'Номер категорії', count(*) as 'Кількість' from tblProducts group by CategoryId 

--select CategoryId as 'Номер категорії', 
--		count(*) as 'Кількість', 
--		AVG(Price)  as 'Середня ціна'
--		from tblProducts 
--		group by CategoryId ;

--select  c.[Name] as 'Назва категорії', 
--		count(*) as 'Кількість', 
--		AVG(p.Price)  as 'Середня ціна'
--		from tblProducts as p, tblCategories as c
--		where p.CategoryId = c.Id
--		group by c.Name ;


--select  c.[Name] as 'Назва категорії', 
--		count(*) as 'Кількість', 
--		AVG(p.Price)  as 'Середня ціна'
--		from tblProducts as p, tblCategories as c
--		where p.CategoryId = c.Id
--		group by c.Name 
--		having c.Name like 'D%';

--select  c.[Name] as 'Назва категорії', 
--		COUNT(*) as 'Кількість', 
--		AVG(p.Price)  as 'Середня ціна'
--		FROM tblProducts as p, tblCategories as c
--		where p.CategoryId = c.Id -- p.Price > 20
--		group by c.Name 
--		--having  AVG(p.Price)  > 20;-- and count(*) > 2;

--drop table [tblCheapProducts];
--select Name, Price, Qty into tblCheapProducts from tblProducts Where Price < 20;
--select * from tblCheapProducts;

select * 
	from  tblCategories as c
	where EXISTS
		( select Id from tblProducts as p  where  c.Id  = p.CategoryId and p.Price > 20)
		