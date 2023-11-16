USE UNIVER

SELECT * FROM AUDITORIUM;

SELECT * FROM AUDITORIUM_TYPE;

-- 1 + 2 z
SELECT AUDITORIUM_TYPE.AUDITORIUM_TYPENAME,AUDITORIUM.AUDITORIUM
			FROM AUDITORIUM Inner join AUDITORIUM_TYPE ON
			AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE And
			AUDITORIUM_TYPE.AUDITORIUM_TYPENAME Like '%компьютер%'

-- 3 z
SELECT FACULTY.FACULTY_NAME, PULPIT.PULPIT_NAME, PROFESSION.PROFESSION_NAME, SUBJECT.SUBJECT_NAME, STUDENT.NAME,--TODO FIX
Case 
			When(PROGRESS.NOTE = 6 ) then 'шесть'
			When(PROGRESS.NOTE = 7 ) then 'семь'
			When(PROGRESS.NOTE = 8 ) then 'восемь'
			end[оценка]
			FROM PROGRESS 
			inner join SUBJECT 
			ON PROGRESS.SUBJECT = SUBJECT.SUBJECT			
			inner join PULPIT
			ON  SUBJECT.PULPIT = PULPIT.PULPIT
			inner join FACULTY 
			ON PULPIT.FACULTY = FACULTY.FACULTY
			inner join STUDENT
			ON PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
			inner join GROUPS
			ON GROUPS.IDGROUP = STUDENT.IDGROUP
			inner join PROFESSION
			ON PROFESSION.PROFESSION = GROUPS.PROFESSION

			Where(PROGRESS.NOTE Between 6 and 8)
			Order by PROGRESS.NOTE desc
			
SELECT PULPIT.PULPIT_NAME FROM PULPIT

-- 4 z
select PULPIT.PULPIT_NAME [Кафедра], isnull(TEACHER.TEACHER_NAME, '***') [Преподаватель]
			from PULPIT
			left  join TEACHER
            ON PULPIT.PULPIT = TEACHER.PULPIT;

-- 5 z

select PULPIT.FACULTY, PULPIT.PULPIT, PULPIT.PULPIT_NAME
from PULPIT full outer join TEACHER
on PULPIT.PULPIT = TEACHER.PULPIT
where TEACHER.TEACHER is null

select TEACHER.TEACHER_NAME, TEACHER.TEACHER, TEACHER.PULPIT,TEACHER.GENDER
from PULPIT full outer join TEACHER
on PULPIT.PULPIT=TEACHER.PULPIT
where TEACHER.TEACHER is not null

select * from PULPIT full outer join TEACHER
on PULPIT.PULPIT = TEACHER.PULPIT


-- 6 z

SELECT AUDITORIUM_TYPE.AUDITORIUM_TYPENAME,AUDITORIUM.AUDITORIUM
			FROM AUDITORIUM Inner join AUDITORIUM_TYPE ON
			AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE


SELECT AUDITORIUM_TYPE.AUDITORIUM_TYPENAME, AUDITORIUM.AUDITORIUM
		FROM AUDITORIUM
		Cross Join AUDITORIUM_TYPE
		WHERE AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE

-- *** 7 z ***
USE MSV_MyBase_2

-- 1 + 2 z*
SELECT Товары.Дата_поступления,Товары.Название,Покупки.id
			FROM Товары Inner join Покупки ON
			Товары.Название = Покупки.Товар And
			Покупки.Товар Like '%товар%'

-- 3 z*

SELECT Товары.Дата_поступления,Товары.Название,Покупки.id,
Case 
			When(Покупки.id = 1 ) then 'один'
			When(Покупки.id = 2 ) then 'два'
			When(Покупки.id = 3 ) then 'три'
end[номер_товара]
			FROM Товары Inner join Покупки ON
			Товары.Название = Покупки.Товар
			Order by Покупки.id desc

-- 4 z*

select Товары.Название[Название_товара], isnull(Товары.Описание, '***') [Описание_товара]
			FROM Товары
			left  join Покупки ON 
			Товары.Название = Покупки.Товар;

-- 5 z*
SELECT Товары.Дата_поступления,Товары.Название, Товары.Описание
			FROM Покупки full outer join Товары  ON
			Товары.Название = Покупки.Товар
			WHERE Товары.Описание is null

SELECT Товары.Дата_поступления,Товары.Название
			FROM Товары full outer join Покупки ON
			Товары.Название = Покупки.Товар
			WHERE Товары.Описание is not null

SELECT *
		FROM Товары full outer join Покупки ON
			 Товары.Название = Покупки.Товар

-- 6 z*
SELECT Товары.Дата_поступления,Товары.Название,Покупки.id
			FROM Товары Inner join Покупки ON
			Товары.Название = Покупки.Товар

SELECT Товары.Дата_поступления,Товары.Название,Покупки.id
			FROM Товары Cross join Покупки Where
			Товары.Название = Покупки.Товар




		