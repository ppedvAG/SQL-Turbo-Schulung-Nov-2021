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

select c.companyname, c.country, year(o.orderdate), sum(unitprice*quantity)
from 
	customers c inner join orders o on c.CustomerID=o.CustomerID
				inner join [Order Details] od on od.OrderID=o.OrderID
where
		year(orderdate) = 1997 and c.country = 'Germany'
group by c.companyname, c.country, year(o.orderdate)

--Idee Ergbnis wegschreiben
select c.companyname, o.orderid,sum(unitprice*quantity)
from 
	customers c inner join orders o on c.CustomerID=o.CustomerID
				inner join [Order Details] od on od.OrderID=o.OrderID
where
		year(orderdate) = 1997 and c.country = 'Germany'
group by c.companyname,o.orderid


--temporäre Tabelle
select c.companyname, o.orderid,sum(unitprice*quantity) as RngSumme
into #t
from 
	customers c inner join orders o on c.CustomerID=o.CustomerID
				inner join [Order Details] od on od.OrderID=o.OrderID
where
		year(orderdate) = 1997 and c.country = 'Germany'
group by c.companyname,o.orderid


select CompanyName, RngSumme from #t

select * from #t

drop table #t


select sum(rngsumme) from #t


---ABC Analyse


--Kunde haben Frachtkosten

--bei Summe der Frachtkosten unter 100 = A Kunden
--bei Summe der Frachtkosten über 500 = C Kunden
--die dazwischen sind B Kunden


--Kunde, SummeFrachtgkosten A B oder c


--Jetzt mal auf A Kunde reduzieren
select companyname, sum(freight) as Frachtsumme, 'A'
	from customers c inner join orders o on c.CustomerID=o.CustomerID
group by CompanyName having sum(freight) < 100

select companyname, sum(freight) as Frachtsumme, 'C'
	from customers c inner join orders o on c.CustomerID=o.CustomerID
group by CompanyName having sum(freight) >500

select companyname, sum(freight) as Frachtsumme, 'B'
	from customers c inner join orders o on c.CustomerID=o.CustomerID
group by CompanyName having sum(freight) between 100 and 500

--Jetrzt Ergebnisse zusammenbringen
select companyname, sum(freight) as Frachtsumme, 'A' as Typ --muss einen Namen habe
	into #t1
	from customers c inner join orders o on c.CustomerID=o.CustomerID
group by CompanyName having sum(freight) < 100

insert into #t1
select companyname, sum(freight) as Frachtsumme, 'C'
	from customers c inner join orders o on c.CustomerID=o.CustomerID
group by CompanyName having sum(freight) >500


insert into #t1
select companyname, sum(freight) as Frachtsumme, 'B'
	from customers c inner join orders o on c.CustomerID=o.CustomerID
group by CompanyName having sum(freight) between 100 and 500



select * from #t1





