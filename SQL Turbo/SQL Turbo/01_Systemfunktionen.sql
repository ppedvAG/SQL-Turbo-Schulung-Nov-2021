drop database testdb


/*


Datumsfunktionen
Textfunktionen


*/

--Korrekte DB? !!


use northwind;
GO



--Nie ein Abfragefenster eifach mal ausführen
--immer Code markieren und ausführen



--ab hier ein Kommentar
select 100 --wieder Kommentar



--Code formatieren 
select * from orders


select --Daten ausgeben
* --wirklich alle Spalten
from

orders  --Daten von Nwind Orders Tabellen


/*
alles hier ein Kommentar

Select top 2 * from orders

*/



--Datumsfunktionen

select getdate() --Datum + Uhrzeit auf ms genau

select getdate()-30 --zieht Tage ab


--alles aus dem Jahr 2020

--yy Jahr
--qq Quartal
--mm Monat
--hh Stunde
--ss Sekunde
--dd Tag  (1 bis 31.)
--dw Wochentag (Mo bis So)
--ww Kal Woche ( aufpassen ISO Week)


select datepart(yy,getdate())--2021

--leichter gehts anders

select year(getdate()) --cool 

--aber wie siehts aus mit dem Quartal

select month(getdate())
select datepart(qq, getdate()) --es gibt kein Quartar oder ähnliches


select sp1, sop2, sp3 

select datepart(qq,getdate()), datepart(ww,getdate())


--Datum aufschlüsseln (TAG MONAT JAHR) in einer Zeile

select day(getdate()), month(getdate()), datepart(yy, getdate())

--ALIAS vergibt Spaltennamen auch Abweichend vom tats Spaltennamen
--
--Günstiger Komma zu Beginn wg Auskommentierungen und Komafehlern
select 
			  day(getdate()) as TAG
			, month(getdate()) as Monat
			, datepart(yy, getdate()) as Jahr



select 
			 day(getdate()) as TAG,
			 month(getdate()) as Monat,
		     datepart(yy, getdate()) as Jahr




--Differenz zw zwei Datumswerten


select datediff(dd,getdate(), '10.10.2021 23:59:59.123')
------------------------------------------------------------>
--Wieviele Stunden sind seit eurer Geburt vergangen?
--und was passiert wenn man Startdatum und Enddatum vertauscht in der F()?

select datediff(hh, getdate(), '29.7.1969 16:50:00.000') --450000

select datediff(hh,  '29.7.1969 16:50:00.000',getdate()) -- + 450000


--zu einen Datum etwas dazuzählen

select dateadd(mm, 2, getdate())

--Welches Datum war vor 10 Wochen?

select dateadd(ww, -10, getdate())


--TEXTFUNKTIONEN

select 'HANS', 'OTTO'

--Varchar oder auch char

-- 'OTTO
--variable Länge varchar(50)... 'OTTO'  4 Zeichen

--fix Länge char(50)  ... 'Otto                                    ' 50 Zeichen

select rtrim('Otto          ') -- Leerzeichen von rechts wegnehmen

-- der LEN gibt die DAtenlänge aus, allerdings macht er scheinbar gleich eine RTRIM)
select len('HANS'),len('HANS     '),LEN('   HANS     ')
----           4            4                 7
--evtl LTRIM

--like 'HANS'
--= 'HANS'
--like 'HANS%' --0 sek  mit ca 10ms 
--like '%HANS%' -- 2 Sek und 2 Sek 


select datalength('  HANS     ') --11 Zeichen ..tats belehte Menge
--reverse
--dreht ZK einach um
select reverse('Otto'), reverse('Hans')
select 'A' + 'B' --AB
select 'A' +100 --Error
select 'A' +'100' --A100


select left('abcdef',3) --abc
select left('abcdef',3) --abc

--ab einer best Pos eine best Länge ausgeben
select substring('abcdef', 2,3) --bcd

--best Zeichen ersetzen
select stuff('abcdef',2,3,'XXXXX') --aXXXXXef

--beliebige TelNUmmer: 086565677-988970
--die letzten 3 Ziffern sollen ausgixt werden
--  --> 08677-988xxx

'086577-988970' --> 086577-988xxx'


select stuff('086565677-988970', datalength('086565677-988970')-2,3,'XXX')

select reverse(stuff(reverse('086565677-988970'),1,3,'XXX'))

select right('086565677-988970',3) --970
select stuff('086565677-988970', right('086565677-988970',3, 'XXX')

---ab Pos 970 für 3 ZEichen ein XXX ersetzen

select left('086565677-988970', datalength('086565677-988970')-3)+'xxx'

---SELECT MIT TABELLEN




































