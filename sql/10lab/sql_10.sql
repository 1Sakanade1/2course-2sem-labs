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
	����� int,
	��� nvarchar(50),
	������ nvarchar(50)
);

DECLARE @i int = 0;
WHILE @i < 2000
BEGIN
INSERT #EXIMPLE1 VALUES (@i, '��� ' + cast(@i as nvarchar),cast(round(rand()*10,0) as nvarchar))
SET @i += 1
END

SELECT * FROM #EXIMPLE1
DELETE #EXIMPLE1

DECLARE @StartTime DATETIME, @EndTime DATETIME;
SET @StartTime = GETDATE();

SELECT * FROM #EXIMPLE1 where ����� between 1500 and 2500 order by ����� 

SET @EndTime = GETDATE();
SELECT DATEDIFF(ms, @StartTime, @EndTime) AS 'Time in ms';
DBCC DROPCLEANBUFFERS;  --�������� �������� ���

CREATE clustered index #EXIMPLE_CL on #EXIMPLE1(����� asc)

DROP index #EXIMPLE1.#EXIMPLE_CL 
--z2

CREATE TABLE #EXIMPLE2
(
	����� int,
	��� nvarchar(50),
	������ nvarchar(50)
);

DECLARE @i int = 0;
WHILE @i < 20000
BEGIN
INSERT #EXIMPLE2 VALUES (@i, '��� ' + cast(@i as nvarchar),cast(round(rand()*10,0) as nvarchar))
SET @i += 1
END

SELECT count(*)[���������� �����] from #EXIMPLE2;
SELECT * from #EXIMPLE2
DROP TABLE #EXIMPLE2

CREATE index #EXIMPLE2_NONCLU on #EXIMPLE2(�����, ������)

SELECT * from  #EXIMPLE2 where  ����� > 1500 and  ������ < 5;  
SELECT * from  #EXIMPLE2 order by  �����, ������

SELECT * from  #EXIMPLE2 where  ����� = 551 and  ������ > 1

DROP index #EXIMPLE2_NONCLU.#EXIMPLE2
--z3

CREATE TABLE #EXIMPLE3
(
	����� int,
	��� nvarchar(50),
	������ nvarchar(50)
);

DECLARE @i int = 0;
WHILE @i < 20000
BEGIN
INSERT #EXIMPLE3 VALUES (@i, '��� ' + cast(@i as nvarchar),cast(round(rand()*10,0) as nvarchar))
SET @i += 1
END

SELECT * FROM #EXIMPLE3 where �����>15000 
DELETE #EXIMPLE3

CREATE  index #EXIMPLE3_NUM_X on #EXIMPLE3(�����) INCLUDE (���)

DROP index #EXIMPLE3_NUM_X.EXIMPLE3


SELECT ��� from #EXIMPLE3 where �����>15000 

--z4 

CREATE TABLE #EXIMPLE4
(
	����� int,
	��� nvarchar(50),
	������ nvarchar(50)
);

DECLARE @i int = 0;
WHILE @i < 20000
BEGIN
INSERT #EXIMPLE4 VALUES (@i, '��� ' + cast(@i as nvarchar),cast(round(rand()*10,0) as nvarchar))
SET @i += 1
END

DELETE #EXIMPLE4

SELECT ����� from  #EXIMPLE4 where ����� between 5000 and 19999; 
SELECT ����� from  #EXIMPLE4 where ����� > 15000 and  ����� < 20000  
SELECT ����� from  #EXIMPLE4 where ����� = 17000

CREATE  index #EXIMPLE4_WHERE on #EXIMPLE4(�����) where (�����>=15000 and 
 ����� < 20000); 

 --z5

 CREATE TABLE #EXIMPLE5
(
	����� int,
	��� nvarchar(50),
	������ int
);

DECLARE @i int = 0;
WHILE @i < 10000
BEGIN
INSERT #EXIMPLE5 VALUES (@i, '��� ' + cast(@i as nvarchar),round(rand()*10,0))
SET @i += 1
END

SELECT * FROM #EXIMPLE5

CREATE index #EXIMPLE5_MARK ON #EXIMPLE5(������) ; 

SELECT NAME [������], AVG_FRAGMENTATION_IN_PERCENT [������������ (%)] 
FROM SYS.DM_DB_INDEX_PHYSICAL_STATS(DB_ID(N'TEMPDB'),
OBJECT_ID(N'#EXIMPLE5'), NULL, NULL, NULL) SS
JOIN SYS.INDEXES II ON SS.OBJECT_ID = II.OBJECT_ID
AND SS.INDEX_ID = II.INDEX_ID WHERE NAME IS NOT NULL; 

INSERT top(10000) #EXIMPLE5(������, ���) select ������, ��� from #EXIMPLE5;

DROP INDEX #EXIMPLE5_MARK ON #EXIMPLE5

DROP TABLE #EXIMPLE5

ALTER index #EXIMPLE5_MARK on #EXIMPL��E5 reorganize;

ALTER index #EXIMPLE5_MARK on #EXIMPLE5 rebuild with (online = off);

--z6

CREATE TABLE #EXIMPLE6
(
	����� int,
	��� nvarchar(50),
	������ nvarchar(50)
);

DECLARE @i int = 0;
WHILE @i < 20000
BEGIN
INSERT #EXIMPLE6 VALUES (@i, '��� ' + cast(@i as nvarchar),cast(round(rand()*10,0) as nvarchar))
SET @i += 1
END

SELECT * FROM #EXIMPLE6

CREATE index #EXIMPLE6_NUM on #EXIMPLE6(�����) with (fillfactor = 65);

INSERT top(50)percent INTO #EXIMPLE6(�����, ���) 

use tempdb
SELECT �����, ���  FROM #EXIMPLE6;
SELECT name [������], avg_fragmentation_in_percent [������������ (%)]
FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'),    
OBJECT_ID(N'#EXIMPLE6'), NULL, NULL, NULL) ss  JOIN sys.indexes ii 
ON ss.object_id = ii.object_id and ss.index_id = ii.index_id  WHERE name is not null;


--z7**

--z1*
use MSV_MyBase_2
EXEC sp_helpindex '������'
EXEC sp_helpindex '�������'
EXEC sp_helpindex '����������'
EXEC sp_helpindex '������'

DROP INDEX PK__������__38DA8034CA6E8D29 ON ������;

CREATE clustered index #EXIMPLE_MSV on ������(����������_����������� asc)

--z2*

CREATE index #EXIMPLE_MSV2 on ������(����������_�����������, ����������_�����_�������)

--z3*
CREATE  index #EXIMPLE_MSV3 on ������(����������_�����������) INCLUDE (��������)

--z4*
CREATE  index #EXIMPLE_MSV4 on ������(����������_�����������) where (�����������_�����>=25000 and 
 �����������_����� < 60000); 

 --z5*

 CREATE index #EXIMPLE_MSV5 on ������(����������_�����������)

 --z6*
 CREATE index #EXIMPLE_MSV6 on ������(����������_�����������)
							with(fillfactor = 65)
