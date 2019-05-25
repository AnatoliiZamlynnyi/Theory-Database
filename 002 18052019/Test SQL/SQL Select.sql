--select * from tblCategories

--select [p.Name], p.Price, c.Name from [tblProducts] as p, tblCategories as c where c.Id = p.CategoryId

--select CategoryId as '����� �������', count(*) as 'ʳ������' from tblProducts group by CategoryId 

--select CategoryId as '����� �������', 
--		count(*) as 'ʳ������', 
--		AVG(Price)  as '������� ����'
--		from tblProducts 
--		group by CategoryId ;

--select  c.[Name] as '����� �������', 
--		count(*) as 'ʳ������', 
--		AVG(p.Price)  as '������� ����'
--		from tblProducts as p, tblCategories as c
--		where p.CategoryId = c.Id
--		group by c.Name ;


--select  c.[Name] as '����� �������', 
--		count(*) as 'ʳ������', 
--		AVG(p.Price)  as '������� ����'
--		from tblProducts as p, tblCategories as c
--		where p.CategoryId = c.Id
--		group by c.Name 
--		having c.Name like 'D%';

--select  c.[Name] as '����� �������', 
--		COUNT(*) as 'ʳ������', 
--		AVG(p.Price)  as '������� ����'
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
		