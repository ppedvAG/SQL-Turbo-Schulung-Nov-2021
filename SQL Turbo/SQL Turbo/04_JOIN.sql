/*

JOIN Arten

INNER JOIN
..ca 90% aller Fälle

LEFT JOIN
--im Prinzip das gleiche wie der right join

RIGHT JOIN

CROSS JOIN
alles mit allem



*/

select * from 
	TAB1 A INNER JOIN TAB2 B ON A.SP = B.SP

--nur noch die DS der beiden Tabellen, wo der ID Wert auf 
--beiden Seiten vorkommt
--kein Mensch garantiert euch, dass die Spalten gleich heissen

select * from 
	customers c inner join orders o ON c.CustomerID=o.CustomerID
where o.Freight < 10


select o.*, c.CompanyName from 
	customers c inner join orders o ON c.CustomerID=o.CustomerID
where o.Freight < 10

--den JOIN braucht man immer, wenn man Spalten nebeneinander anzeigen will


--order details --> ProductID --> Products

--Liste aller Bestelldetails und den Produktnamen

select od.*, p.ProductName 
		from			[Order Details] od
			 inner join Products p			on p.ProductID = od.ProductID
			 		 inner join Products p			on p.ProductID = od.ProductID
					 		 left join Products p			on p.ProductID = od.ProductID
							 		 inner join Products p			on p.ProductID = od.ProductID


--Liste: Customerid, Companyname, country, city
  --     orderid, freight, orderdate


select 
		c.Customerid, c.Companyname, c.country, c.city,
		o.orderid, o.freight, o.orderdate
from 
		customers c inner join orders o
					ON c.CustomerID=o.CustomerID
				order by 1



select * from TAB1 A LEFT JOIN TAB2 B on A.sp1 = B.sp2
--           LINKS              RECHTS

--Wir suchen alle Kunden, die nichts bestellt haben?
--Ausgabe aus Customers Customerid, companyname, orderid o.customerid

--830 Bestellungen
select c.CustomerID, c.CompanyName,
		o.OrderID, o.CustomerID
from customers c left join orders o on c.CustomerID=o.CustomerID
where o.orderid is NULL --nicht = NULL 


--das ganze mit right join

select c.CustomerID, c.CompanyName,
		o.OrderID, o.CustomerID
from orders o  right join customers c on c.CustomerID=o.CustomerID
where o.orderid is NULL --nicht = NULL 

 











