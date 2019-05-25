use ProdZam
--select p.Name, p.Price, p.Quantity, c.Name from tblProducts as p, tblCategoris as c 
--where p.CategoryID = c.Id   and c.Name like 'D%';

select p.[CategoryID] as '����� �������', 
count(*) as 'ʳ������',
avg(p.Price) as '������� ����',
min(p.Price) as '̳������� ����',
max(p.Price) as '����������� ����'
from tblProducts  as p 
group by p.CategoryID

select c.[Name] as '����� �������', 
count(*) as 'ʳ������',
avg(p.Price) as '������� ����',
min(p.Price) as '̳������� ����',
max(p.Price) as '����������� ����'
from tblProducts  as p, tblCategoris as c 
where p.CategoryID=c.Id
group by c.Name