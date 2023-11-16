use UNIVER


--z1
CREATE VIEW [Преподаватель]
		as select TEACHER.TEACHER [Код],
		TEACHER.TEACHER_NAME [Имя преподавателя],
		TEACHER.GENDER [Пол],
		TEACHER.PULPIT [Код кафедры]
		FROM TEACHER;

SELECT * FROM [Преподаватель]

SELECT * FROM TEACHER

--z2

CREATE VIEW [Количество кафедр]
		as select FACULTY.FACULTY_NAME [Факультет],
		count(PULPIT.PULPIT)[Количество кафедр]
		from FACULTY inner join PULPIT
		on FACULTY.FACULTY=PULPIT.FACULTY 
		group by FACULTY_NAME

SELECT * FROM [Количество кафедр]

--z3
CREATE VIEW [Аудитории]
	as select AUDITORIUM.AUDITORIUM[Код],
	AUDITORIUM.AUDITORIUM_TYPE[Наименование аудитории]
	FROM AUDITORIUM
	WHERE AUDITORIUM.AUDITORIUM_TYPE like 'ЛК%'

insert into [Аудитории] values ('101-3','ЛК-К')

update [Аудитории] set [Код]='100-1' where [Код]='101-3'

delete from [Аудитории] where [Код]='101-3'

SELECT * FROM [Аудитории]


--z4
CREATE VIEW [Лекционные_аудитории]
	as select  AUDITORIUM.AUDITORIUM[Код],
	AUDITORIUM.AUDITORIUM_NAME[Наименование аудитории]
	FROM AUDITORIUM
	WHERE AUDITORIUM.AUDITORIUM_TYPE like 'ЛК%' WITH CHECK OPTION

SELECT * FROM [Лекционные_аудитории]


--z5

ALTER VIEW [Дисциплины]
	as select top 150 SUBJECT.SUBJECT[Код],
	SUBJECT.SUBJECT_NAME[Наименование дисциплины],
	SUBJECT.PULPIT[Код кафедры]
	FROM SUBJECT
	ORDER BY SUBJECT

SELECT * FROM [Дисциплины]

--z6

alter view [Количество кафедр] WITH SCHEMABINDING
as select FACULTY.FACULTY_NAME [Факультет],
count(PULPIT.PULPIT)[Количество кафедр]
from dbo.FACULTY inner join dbo.PULPIT
on FACULTY.FACULTY=PULPIT.FACULTY
group by FACULTY_NAME

SELECT * FROM [Количество кафедр]

ALTER TABLE dbo.PULPIT ADD COLUMN TEST_COLUMN VARCHAR(50)
--z7**

--z1*
use MSV_MyBase_2

CREATE VIEW [view_purchases]
		as select Покупки.id [id],
		Покупки.Описание_товара [Описание товара],
		Покупки.Отдел [Отдел],
		Покупки.Товар [Товар]
		FROM Покупки;

SELECT * FROM [view_purchases]

--z2*

CREATE VIEW [отделы_count]
		as select 
		Отделы.Название_товара [название],
		count(Потраченная_сумма)[количество покупок]
		FROM Отделы
		group by Отделы.Название_товара

SELECT * FROM [отделы_count]

--z3*

CREATE VIEW [отделы_countz3]
		as select 
		Отделы.Название_товара [название],
		count(Потраченная_сумма)[количество покупок]
		FROM Отделы
		where Название_товара like 'Товар1'
		group by Отделы.Название_товара

SELECT * FROM [отделы_countz3]

--z4*
CREATE VIEW [отделы_countz4]
		as select
		Отделы.Название_товара [название],
		Потраченная_сумма [потраченная сумма]
		FROM Отделы
		where Название_товара like 'Товар1'

insert into [отделы_countz4] values('добавленный товар',25000)  /* todo не работает инсерт */

update [отделы_countz4] set [потраченная сумма]='25000' where [потраченная сумма]='20000'

delete from [отделы_countz4] where [название]='добавленный товар'

SELECT * FROM [отделы_countz4]
--z5*

CREATE VIEW [отделы_countz5]
		as select top 150
		Отделы.Название_товара [название],
		count(Потраченная_сумма)[количество покупок]
		FROM Отделы
		where Название_товара like 'Товар1'
		group by Отделы.Название_товара

SELECT * FROM [отделы_countz5]

--z6*

CREATE VIEW [view_purchasesz6] WITH SCHEMABINDING  /*todo поч не работает */
		as select Покупки.id [id],
		Покупки.Описание_товара [Описание товара],
		Покупки.Отдел [Отдел],
		Покупки.Товар [Товар],
		Отделы.Количество_сотрудников [кол-во сотрудников]
		FROM Покупки inner join Отделы
		on Отделы.Название = Покупки.Отдел

SELECT * FROM [view_purchasesz6]

