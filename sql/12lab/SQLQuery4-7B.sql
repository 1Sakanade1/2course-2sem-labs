﻿-----4B–----

BEGIN TRANSACTION

INSERT FACULTY VALUES('ТПР','Теоритическое приветствие радиус');

SELECT FACULTY FROM FACULTY WHERE FACULTY = 'ТПР'

-----T1----------
-----T2----------
ROLLBACK;

DELETE FACULTY WHERE FACULTY = 'ТПР';

-----5B----
BEGIN TRANSACTION
------T1-----
UPDATE SUBJECT SET SUBJECT_NAME = 'СУБД11' WHERE SUBJECT = 'СУБД';
------T2------
ROLLBACK

----6B----	
BEGIN TRANSACTION 	  
--------T1---------
DELETE FROM SUBJECT WHERE SUBJECT = 'БД'
INSERT INTO SUBJECT(SUBJECT,SUBJECT_NAME,PULPIT)VALUES('БД','Базы данных','ИСиТ')

commit; 
ROLLBACK
--------T2---------


--7B---
BEGIN TRANSACTION 
DELETE AUDITORIUM WHERE AUDITORIUM = '206-1'
INSERT AUDITORIUM VALUES ('206-1', 'ЛК', 123, '206-1')
UPDATE AUDITORIUM SET AUDITORIUM_NAME = '206-1' WHERE AUDITORIUM = '206-1'
--------T1---------
ROLLBACK 	
SELECT AUDITORIUM FROM AUDITORIUM WHERE AUDITORIUM = '206-1'
--------T2---------