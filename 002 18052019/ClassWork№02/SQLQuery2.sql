use ProdZam
--select p.Name, p.Price, p.Quantity, c.Name from tblProducts as p, tblCategoris as c 
--where p.CategoryID = c.Id   and c.Name like 'D%';

select p.[CategoryID] as 'Номер категорії', 
count(*) as 'Кількість',
avg(p.Price) as 'Середня ціна',
min(p.Price) as 'Мінімальна ціна',
max(p.Price) as 'Максимальна ціна'
from tblProducts  as p 
group by p.CategoryID

select c.[Name] as 'Номер категорії', 
count(*) as 'Кількість',
avg(p.Price) as 'Середня ціна',
min(p.Price) as 'Мінімальна ціна',
max(p.Price) as 'Максимальна ціна'
from tblProducts  as p, tblCategoris as c 
where p.CategoryID=c.Id
group by c.Name