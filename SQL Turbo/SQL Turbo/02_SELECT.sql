/*
SELECT 
		'TEXT',
		ZAHLEN,
		Spalten,
		Math (Spalte * Spalte, S�alte * Wert'
		Spalte as ALIAS
FROM TABELLE;



*/

use northwind;
GO --kein TSQL Befehl

select 100
GO 10 --mach 10mal

select 
	* --steht f�r alle Spalten aus den Tabellen des FROM
	 --kein gute Idee
from customers


select 
	customerid, companyname 
from customers


select 
	customerid, companyname as Firma
from customers


select 
	fax, *
from customers


--Alias f�r die tabelle
--dann wiurd das Schreiben bzw Aufz�hlen der Spalten leichter
select c.City,c.Country, c.CustomerID from customers c

--Lieferkosten = Freight  netto
select    o.OrderID
		, o.Freight			as Netto
		, o.Freight*1.19	as Brutto 
from orders o


--gib die Bestellnummer aus , sowie das Jahr der Bestellung

--Ergebnis Orderid  Jahr des Bestelldatums

select  
		o.OrderID, year(o.OrderDate) as Jahr
from orders o

select * from employees

--Ausgabe: 
AngNAme
Davolio, Nancy

select lastname + ', ' +  firstname from employees

Select 'AngName: ' + Lastname from employees












