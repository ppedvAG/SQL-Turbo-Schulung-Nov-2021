set statistics io, time on

select * from customers
where customerid like 'MA%'

-- CPU-Zeit = 62 ms, verstrichene Zeit = 279 ms. --109

select * from customers
where left(customerid,2) = 'MA'


--, CPU-Zeit = 1812 ms, verstrichene Zeit = 997 ms. --70163

--Kommentieren
--Formatieren
--Tabulatoren Line breaks
--Klammern setzen in where mit AND und OR
-- zuerst gedanklich visualieren, dann schreiben


--filtere nie etwas mit Having was ein where machen kann
--das having hat immer nur AGG zu filtern



w3schools.com

--SQLEXPRESS bis 10GB DB Größe