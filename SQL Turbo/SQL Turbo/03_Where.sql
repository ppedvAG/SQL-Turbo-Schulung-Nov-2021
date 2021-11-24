/*
WHERE

select 
		'TXT', ZAHL
		Mathe, SP * Sp 
		Sp 
		SP as Alias
		F()
from  TABELLE
where 
		Spalte = Wert --muss identisch sein
		Spalte > < <=  >=
		Spalte != das soll es nicht sein
		Spalte like ..so ungefähr  nur das like hat Wildcards
			-- % für belieb Zeichen
			-- _ genau ein unbek Zeichen
			-- [ ] Wertebereich steht für ein Zeichen
			
		between
		in

*/


select * from customers
	where 
			customerid = 'ALfkI'

--auch hier
select * from customers c
	where
		c.CustomerID = 'BLAUS'

--alle Bestellungen der BLAUS.. Tab Orders

select * from orders o
where 
		o.CustomerID='BLAUS' --7 Bestellungen



select o.OrderID, o.CustomerID from orders o
where 
		o.CustomerID='BLAUS' --7 Bestellungen


select freight,* from orders --zwischen 0.02 und 1007

--alle Bestellungen deren Frachtkosten unter 10 liegen


select freight, * from orders o
	where
		o.Freight < 10


--zum verifizieren einfach sortieren
--order by sp1 asc, sp2 desc
--asc = default

select freight, * from orders o
	where
		o.Freight < 10
order by o.freight desc--der order by steht immer ganz am Ende

select * from customers order by country asc, city desc


--Brauche nun aber alle Bestellungen, 
--deren Frachkosten in Brutto unter 100 liegen


--Berechnungen mit Spalten können so gut wie an allen Stellen stattfinden
--also auch im where

select freight, freight *1.19 as Brutto, * from orders o
where
		freight *1.19 < 100
		--freight < 100/1.19 --faktisch ist das schneller
		--der Alias kann im Where nicht verwendet werden

		

--TIPP:: Versuche immer den Vergleich in dem F() verwedendet werden.im where 
--von der Spalte wegzubringen (Auf die andere Seite)
--KUrzform im where dürfte um eine Spalte keine F() verwendet werden


--Log Fluss
---FROM ---> WHERE --> SELECT --> ORDER BY --> AUSGABE


select freight, freight *1.19 as Brutto, * from orders o
where
		year(orderdate) = 1997


--was aber , wenn wir nur einen Bruchteil der Suchinfos haben

--Suche mit LIKE


/* WILDCARDS
% steht für beliebig viele unbekannte Zeichen ..auch 0 
_ steht für genau ein unbekanntes Zeichen

*/
select * from customers
--alle die mit A beginnen
select * from customers c
	where 
			c.CompanyName  like 'A%'

--und alle die mit A enden

select * from customers c
	where 
			c.CompanyName  like '%A'

--welche Kunden haben in y im Namen--

select * from customers c
	where 
			c.CompanyName  like '%y%' --8
--Wir suchen alle Kunden, deren vorletzter Buchstabe
--in Customerid ein P ist


select * from customers c
	where 
			c.CustomerID like '%P_' -- 1 

--UUppps..Suche nach dem , der ein % im Namen hat


select * from customers c
	where
			c.CompanyName like '%'%'%' --seltsame Meldung


select * from customers c
	where
			c.CompanyName like '%%%' --immer noch alle


--alle DS von Order Details

select * from [Order Details] --eckige Klammern


select * from customers c
	where
			c.CompanyName like '%[%]%' --ah!! als Wertebereich
						--nicht als Wildcards sondern als Wert verwenden


--Suche alle Kunden, die mit A B X D G beginnen
--Customerid
select * from customers c
where 
	c.CustomerID < 'E' --< > geht auch bei Buchstaben

	--die eckige Klammer steht für ein Zeichen
	--ist aber ein Wertebereich
	--[ABCD] A oder B oder C oder D
	--[0-9]  von 0 bis 9

select * from customers c
	where c.CustomerID like '[ABCD]%'

--alle die mit A oder c oder k oder l beginnen	
select * from customers c
	where c.CustomerID like '[ACKL]%'

--suche alle Kunden (customerid)
--die mit A C oder E beginnen und mit S R oder T enden

select * from customers c
	where 
		c.CustomerID like '[ACE]%[SRT]' --3 Stück



--was wenn.. beginnend mit A und B

select * from customers c
	where c.CustomerID like 'AB%'
	--where c.customerid like '[ABCD][BE]%'

	-- kann mit AB beginnen
	--aber auch mit CD


	--where c.customerid like '[AC][BD]%'

	where customerid like 'AB%' or customerid like 'CD%'


	--PIN der BANK

	--abc9

	where pin not like '[0-9][0-9][0-9][0-9]'

	--Patterns RegEx

	--Varianten: [ABC|0-9]  kann eines von beiden sein
	-- [^ABC] -- darf niht A b oder C sein 


--Suche nach meheren verschd Werten
---where Bedingungen können konbiniert werden
--mit AND bzw OR.. Reihenfolge ist grundsätzlich egal,
--ausser.. ;-) 
--alle Bestellungen aus USA und Frachtkosten < 10

select * from orders o
where 
	o.ShipCountry='USA'
	AND
	o.Freight < 10
	AND...


--alle Bestellungen aus USA oder die mit Frachtkosten < 10

select * from orders o
	where 
		o.ShipCountry='USA'
		OR
		o.freight < 10 
		OR... AND

--Alle Bestellungen  aus Berlin oder vom Ang Nr 3 und Frachtkosten < 10

--was passiert ohne Klammer
--das AND wird immer stärker gebunden
--es wird nicht der reihen nach gefiltert
select * from orders o
	where 
		shipcity = 'Berlin'
		or 
		EmployeeID=3
		and
		freight < 10
order by 3,8


select * from orders o
	where 
		shipcity = 'Berlin'
		or 
		(EmployeeID=3
		and
		freight < 10)
order by 3,8


select * from orders o
	where 
		(shipcity = 'Berlin'
		or 
		EmployeeID=3)
		and
		freight < 10
order by 3,8



















	

