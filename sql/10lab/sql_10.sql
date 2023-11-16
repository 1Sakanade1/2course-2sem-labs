--z1

use UNIVER;

EXEC sp_helpindex 'AUDITORIUM'
EXEC sp_helpindex 'AUDITORIUM_TYPE'
EXEC sp_helpindex 'FACULTY'
EXEC sp_helpindex 'GROUPS'
EXEC sp_helpindex 'PROFESSION'
EXEC sp_helpindex 'PROGRESS'
EXEC sp_helpindex 'PULPIT'
EXEC sp_helpindex 'STUDENT'
EXEC sp_helpindex 'SUBJECT'
EXEC sp_helpindex 'TEACHER'


CREATE TABLE #EXIMPLE1
(
	Номер int,
	ФИО nvarchar(50),
	Оценка nvarchar(50)
);

DECLARE @i int = 0;
WHILE @i < 2000
BEGIN
INSERT #EXIMPLE1 VALUES (@i, 'ФИО ' + cast(@i as nvarchar),cast(round(rand()*10,0) as nvarchar))
SET @i += 1
END

SELECT * FROM #EXIMPLE1
DELETE #EXIMPLE1

DECLARE @StartTime DATETIME, @EndTime DATETIME;
SET @StartTime = GETDATE();

SELECT * FROM #EXIMPLE1 where Номер between 1500 and 2500 order by Номер 

SET @EndTime = GETDATE();
SELECT DATEDIFF(ms, @StartTime, @EndTime) AS 'Time in ms';
DBCC DROPCLEANBUFFERS;  --очистить буферный кэш

CREATE clustered index #EXIMPLE_CL on #EXIMPLE1(Номер asc)

DROP index #EXIMPLE1.#EXIMPLE_CL 
--z2

CREATE TABLE #EXIMPLE2
(
	Номер int,
	ФИО nvarchar(50),
	Оценка nvarchar(50)
);

DECLARE @i int = 0;
WHILE @i < 20000
BEGIN
INSERT #EXIMPLE2 VALUES (@i, 'ФИО ' + cast(@i as nvarchar),cast(round(rand()*10,0) as nvarchar))
SET @i += 1
END

SELECT count(*)[количество строк] from #EXIMPLE2;
SELECT * from #EXIMPLE2
DROP TABLE #EXIMPLE2

CREATE index #EXIMPLE2_NONCLU on #EXIMPLE2(Номер, Оценка)

SELECT * from  #EXIMPLE2 where  Номер > 1500 and  Оценка < 5;  
SELECT * from  #EXIMPLE2 order by  Номер, Оценка

SELECT * from  #EXIMPLE2 where  Номер = 551 and  Оценка > 1

DROP index #EXIMPLE2_NONCLU.#EXIMPLE2
--z3

CREATE TABLE #EXIMPLE3
(
	Номер int,
	ФИО nvarchar(50),
	Оценка nvarchar(50)
);

DECLARE @i int = 0;
WHILE @i < 20000
BEGIN
INSERT #EXIMPLE3 VALUES (@i, 'ФИО ' + cast(@i as nvarchar),cast(round(rand()*10,0) as nvarchar))
SET @i += 1
END

SELECT * FROM #EXIMPLE3 where Номер>15000 
DELETE #EXIMPLE3

CREATE  index #EXIMPLE3_NUM_X on #EXIMPLE3(Номер) INCLUDE (ФИО)

DROP index #EXIMPLE3_NUM_X.EXIMPLE3


SELECT ФИО from #EXIMPLE3 where Номер>15000 

--z4 

CREATE TABLE #EXIMPLE4
(
	Номер int,
	ФИО nvarchar(50),
	Оценка nvarchar(50)
);

DECLARE @i int = 0;
WHILE @i < 20000
BEGIN
INSERT #EXIMPLE4 VALUES (@i, 'ФИО ' + cast(@i as nvarchar),cast(round(rand()*10,0) as nvarchar))
SET @i += 1
END

DELETE #EXIMPLE4

SELECT Номер from  #EXIMPLE4 where Номер between 5000 and 19999; 
SELECT Номер from  #EXIMPLE4 where Номер > 15000 and  Номер < 20000  
SELECT Номер from  #EXIMPLE4 where Номер = 17000

CREATE  index #EXIMPLE4_WHERE on #EXIMPLE4(Номер) where (Номер>=15000 and 
 Номер < 20000); 

 --z5

 CREATE TABLE #EXIMPLE5
(
	Номер int,
	ФИО nvarchar(50),
	Оценка int
);

DECLARE @i int = 0;
WHILE @i < 10000
BEGIN
INSERT #EXIMPLE5 VALUES (@i, 'ФИО ' + cast(@i as nvarchar),round(rand()*10,0))
SET @i += 1
END

SELECT * FROM #EXIMPLE5

CREATE index #EXIMPLE5_MARK ON #EXIMPLE5(Оценка) ; 

SELECT NAME [ИНДЕКС], AVG_FRAGMENTATION_IN_PERCENT [ФРАГМЕНТАЦИЯ (%)] 
FROM SYS.DM_DB_INDEX_PHYSICAL_STATS(DB_ID(N'TEMPDB'),
OBJECT_ID(N'#EXIMPLE5'), NULL, NULL, NULL) SS
JOIN SYS.INDEXES II ON SS.OBJECT_ID = II.OBJECT_ID
AND SS.INDEX_ID = II.INDEX_ID WHERE NAME IS NOT NULL; 

INSERT top(10000) #EXIMPLE5(Оценка, ФИО) select Оценка, ФИО from #EXIMPLE5;

DROP INDEX #EXIMPLE5_MARK ON #EXIMPLE5

DROP TABLE #EXIMPLE5

ALTER index #EXIMPLE5_MARK on #EXIMPLчёE5 reorganize;

ALTER index #EXIMPLE5_MARK on #EXIMPLE5 rebuild with (online = off);

--z6

CREATE TABLE #EXIMPLE6
(
	Номер int,
	ФИО nvarchar(50),
	Оценка nvarchar(50)
);

DECLARE @i int = 0;
WHILE @i < 20000
BEGIN
INSERT #EXIMPLE6 VALUES (@i, 'ФИО ' + cast(@i as nvarchar),cast(round(rand()*10,0) as nvarchar))
SET @i += 1
END

SELECT * FROM #EXIMPLE6

CREATE index #EXIMPLE6_NUM on #EXIMPLE6(Номер) with (fillfactor = 65);

INSERT top(50)percent INTO #EXIMPLE6(Номер, ФИО) 

use tempdb
SELECT Номер, ФИО  FROM #EXIMPLE6;
SELECT name [Индекс], avg_fragmentation_in_percent [Фрагментация (%)]
FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'),    
OBJECT_ID(N'#EXIMPLE6'), NULL, NULL, NULL) ss  JOIN sys.indexes ii 
ON ss.object_id = ii.object_id and ss.index_id = ii.index_id  WHERE name is not null;


--z7**

--z1*
use MSV_MyBase_2
EXEC sp_helpindex 'Отделы'
EXEC sp_helpindex 'Покупки'
EXEC sp_helpindex 'Поставщики'
EXEC sp_helpindex 'Товары'

DROP INDEX PK__Отделы__38DA8034CA6E8D29 ON Отделы;

CREATE clustered index #EXIMPLE_MSV on Отделы(Количество_сотрудников asc)

--z2*

CREATE index #EXIMPLE_MSV2 on Отделы(Количество_сотрудников, Предельная_норма_расхода)

--z3*
CREATE  index #EXIMPLE_MSV3 on Отделы(Количество_сотрудников) INCLUDE (Название)

--z4*
CREATE  index #EXIMPLE_MSV4 on Отделы(Количество_сотрудников) where (Потраченная_сумма>=25000 and 
 Потраченная_сумма < 60000); 

 --z5*

 CREATE index #EXIMPLE_MSV5 on Отделы(Количество_сотрудников)

 --z6*
 CREATE index #EXIMPLE_MSV6 on Отделы(Количество_сотрудников)
							with(fillfactor = 65)
