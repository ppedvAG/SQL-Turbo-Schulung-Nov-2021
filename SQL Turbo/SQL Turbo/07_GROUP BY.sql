/*

Group by.. Summe pro

SUM()
AVG()
MIN()
MAX()
COUNT()

*/

--Die Summe der Frachtkosten

select sum(freight) from orders --64942,69


select * from orders

--was willst du sehen?

--Customerid SUMME Frachtkosten

select customerid, sum(freight) from orders  --ab jetzt Pflicht group by, weil Spalte und AGG im Select gemischt


--Alle Spalten des Selct in den Group by , aber kein ALias und keine AGG.. fertig
select customerid, sum(freight) from orders
group by customerid


--Umsatz pro Land und Stadt der Kunden
--Umsatz ? --> 
select * from orders

select * from [Order Details]

--Country, City, Unitprice*quantity = Possumme, sum(Unitprice*quantity)  pro Bestellnr= RngSumme

--COUNTRY, CITY, sum(unitprice*quantity)

select 
		c.country as Land, c.city as Stadt, sum(unitprice*quantity) as Umsatz
from customers c inner join orders o			on c.customerid = o.CustomerID
				 inner join [Order Details] od	on od.OrderID= o.OrderID
group by c.country , c.city 
order by Umsatz desc, Land, Stadt
		
		
--select distinct shipcity from orders --70



--Wir suchen die RngSummen aller Kunden aus Deutschland, die im Jahr 1997 bestellt hatten

--Ausgabe: Firma, RngSumme, Bestelldatum, Land-- ist ne fiese Nummer ;-)



