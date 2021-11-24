

--
----UNION fügt Ergebnisse aus mehrern Abfragen zusammen
--Regel: gleich viele Spalten und kompatibler Datentyp
--erste Zeile gibt vor .. Spaltenname, Anzahl der Spalten
--UNION ALL filtert keine doppelten Zeilen
--UNION ohne all dagegen filter doppelte Zeilen


select 100
UNION
select 200
UNION 
select 100


select 100
UNION ALL
select 200
UNION ALL
select 100



--ABC ANALYSE..geht EASY mit UNION .. statt temp Tabelle
select companyname, sum(freight) as Frachtsumme, 'A' as TYP, Wert
	from customers c inner join orders o on c.CustomerID=o.CustomerID
group by CompanyName having sum(freight) < 100
UNION ALL
select companyname, sum(freight) as Frachtsumme, 'C' as Wasweissich
	from customers c inner join orders o on c.CustomerID=o.CustomerID
group by CompanyName having sum(freight) >500
UNION ALL
select companyname, sum(freight) as Frachtsumme, 'B', NULL
	from customers c inner join orders o on c.CustomerID=o.CustomerID
group by CompanyName having sum(freight) between 100 and 500


--ALLERDINGS 
--union hat nen Hacken

--der höchste Umsatz

select top 1
		c.country as Land, c.city as Stadt, sum(unitprice*quantity) as Umsatz
from customers c inner join orders o			on c.customerid = o.CustomerID
				 inner join [Order Details] od	on od.OrderID= o.OrderID
group by c.country , c.city with rollup
order by Umsatz desc

--mit geringsten Umsatz

select top 1
		c.country as Land, c.city as Stadt, sum(unitprice*quantity) as Umsatz
from customers c inner join orders o			on c.customerid = o.CustomerID
				 inner join [Order Details] od	on od.OrderID= o.OrderID
group by c.country , c.city 
order by Umsatz asc



--ein Ergebnis mit den beiden...ERROR
--EIN SELECT hat nur einen order by .. dieser hier hat 2 ;-(
select top 1
		c.country as Land, c.city as Stadt, sum(unitprice*quantity) as Umsatz
from customers c inner join orders o			on c.customerid = o.CustomerID
				 inner join [Order Details] od	on od.OrderID= o.OrderID
group by c.country , c.city 
order by Umsatz desc
UNION ALL
select top 1
		c.country as Land, c.city as Stadt, sum(unitprice*quantity) as Umsatz
from customers c inner join orders o			on c.customerid = o.CustomerID
				 inner join [Order Details] od	on od.OrderID= o.OrderID
group by c.country , c.city 
order by Umsatz asc --dieser gilt für das Eregbnis des UNION

--Idee.. Abfrage 1 in #t1 ..wäre cool und einfach
-- Abfrage 2 in #t2 und dann union
--dagegen so: auch machbar .. aber bei komplexeren Code extrem unübersichtlicht

select * from 
	(	select top 1
			c.country as Land, c.city as Stadt, sum(unitprice*quantity) as Umsatz
		from customers c inner join orders o			on c.customerid = o.CustomerID
					 inner join [Order Details] od	on od.OrderID= o.OrderID
		group by c.country , c.city 
		order by Umsatz desc
	) t1
UNION ALL
select * from 
(
		select top 1
				c.country as Land, c.city as Stadt, sum(unitprice*quantity) as Umsatz
		from customers c inner join orders o			on c.customerid = o.CustomerID
						 inner join [Order Details] od	on od.OrderID= o.OrderID
		group by c.country , c.city 
		order by Umsatz asc 
) t2















