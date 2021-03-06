--Вибрати всі тури
--Вибрати всі тури тривалістю від 5 до 7 днів
--Вибрати всі тури у задану країну
--Вибрати всі тури у задану країну, де "все включено"
--Вибрати недорогі тури  у задану країну, починаючи з вказаної дати
--Вибрати літні тури 
--Знайти максимальну, мінімальну, середню  ціни турів(використати аліаси для обчислених значень - as)
--Знайти середню ціну туру у задану країну
--Знайти кількість турів ціна яких менша деякої суми
--Вивести  дані  про тури у Іспанію, Францію або Італію
--Вивести  ціни усіх турів у Європу у гривнях, евро та доларах
--Вивести тури, у описах яких є деяке слово(н-д, гори) 
--Вибрати країни, у які прпонуються тури без повторів( SELECT  DISTINCT )

select *from tblTours;
select *from tblTours where NumberOfDays>=5 and NumberOfDays<=7;
select *from tblTours where Country='Мальдіви';
select *from tblTours where Country='Франція' and Details like '%All inclusive%';
select *from tblTours where Price <600 and Country='Італія' and (YEAR( [TourStartData])>=2019 and MONTH( [TourStartData])>=04 and DAY( [TourStartData])>=01);
select *from tblTours where  MONTH( [TourStartData])>05 and MONTH( [TourStartData])<09;
select avg([Price]) as 'Average price' from tblTours 
select min([Price]) as 'Minimal price' from tblTours;
select max([Price]) as 'Maximal price' from tblTours;
select avg([Price]) as 'Average price' from tblTours where Country='Італія';
select count ([Price])  as 'Count tours <500' from tblTours where Price<500; 
select *from tblTours where Country='Іспанія' or Country='Італія' or Country='Франція';
select [Price]*26.21 as 'Price grn' from tblTours where Country='Іспанія' or Country='Італія' or Country='Франція' or Country='Україна';
select [Price]*0.89 as 'Price evro' from tblTours where Country='Іспанія' or Country='Італія' or Country='Франція' or Country='Україна';
select [Price] as'Price $' from tblTours where Country='Іспанія' or Country='Італія' or Country='Франція' or Country='Україна';
select *from tblTours where Details like '%гор%' or Details like '%гір%';
select distinct Country from tblTours;