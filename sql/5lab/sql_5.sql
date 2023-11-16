USE UNIVER
-- 1 z

select PULPIT.PULPIT_NAME
			FROM PULPIT, FACULTY
			WHERE PULPIT.FACULTY = FACULTY.FACULTY
			and 
			FACULTY.FACULTY in (select PROFESSION.FACULTY
								FROM PROFESSION					
								WHERE PROFESSION_NAME LIKE ('%технология%')
								   or PROFESSION_NAME LIKE ('%технологии%'))X

-- 2 z

select PULPIT.PULPIT_NAME
			FROM PULPIT Inner Join FACULTY
			ON FACULTY.FACULTY = PULPIT.FACULTY
			WHERE FACULTY.FACULTY in (select PROFESSION.FACULTY
								FROM PROFESSION					
								WHERE PROFESSION_NAME LIKE ('%технология%')
								   or PROFESSION_NAME LIKE ('%технологии%')) 

-- 3 z

select distinct PULPIT.PULPIT_NAME
			FROM PULPIT Inner Join FACULTY
			ON FACULTY.FACULTY = PULPIT.FACULTY
			Inner Join PROFESSION
			ON FACULTY.FACULTY = PROFESSION.FACULTY
						WHERE PROFESSION_NAME Like ('%технология%')
						   or PROFESSION_NAME Like ('%технологии%')

-- 4 z

select  AUDITORIUM_NAME, AUDITORIUM_CAPACITY FROM AUDITORIUM as AUD_a      
			WHERE AUDITORIUM_CAPACITY =	 (select top(1) AUDITORIUM_CAPACITY FROM AUDITORIUM as AUD_b
													   WHERE  AUD_b.AUDITORIUM_TYPE= AUD_a.AUDITORIUM_TYPE order by AUDITORIUM_CAPACITY desc )
			order by AUDITORIUM_CAPACITY desc 


-- 5 z

select FACULTY.FACULTY_NAME 
			FROM FACULTY
			WHERE exists(select * FROM PULPIT 
										 WHERE PULPIT.FACULTY = FACULTY.FACULTY)

-- 6 z

select top(1)
			(select  AVG(NOTE) FROM PROGRESS WHERE [SUBJECT] = 'ОАиП') as 'оаип',
			(select AVG(NOTE) FROM PROGRESS WHERE [SUBJECT] = 'КГ') as 'кг',
			(select  AVG(NOTE) FROM PROGRESS WHERE [SUBJECT] = 'СУБД') as 'субд'
FROM PROGRESS;

-- 7 z

select SUBJECT, IDSTUDENT , NOTE								
			FROM PROGRESS AS a
			WHERE NOTE >=all (select NOTE FROM PROGRESS
							  WHERE SUBJECT = a.SUBJECT )

select * from PROGRESS

-- 8 z

select SUBJECT, IDSTUDENT , NOTE 
			FROM PROGRESS as a 
			WHERE NOTE >=any (select NOTE FROM PROGRESS
							  WHERE SUBJECT = a.SUBJECT )


--*** 9 z ***

use MSV_MyBase_2

-- 1 z*
select Покупки.id
			FROM Покупки, Товары
			WHERE Покупки.Товар = Товары.Название
			and 
			Товары.Название in (select Поставщики.Название_товара
								FROM Поставщики
								WHERE Название_компании LIKE ('компания1'))

-- 2 z*

select Покупки.id
			FROM Покупки Inner Join Товары
			ON Покупки.Товар = Товары.Название 
			WHERE Товары.Название in (select Поставщики.Название_товара
								FROM Поставщики
								WHERE Название_компании LIKE ('компания1'))

-- 3 z*

select Покупки.id
			FROM Покупки Inner Join Товары
			ON Покупки.Товар = Товары.Название
			Inner Join Поставщики
			ON Поставщики.Название_товара = Товары.Название
			WHERE Название_компании LIKE ('компания1')

-- 4 z*

-- имя товара, на который потратили больше всего средств  


select Товар 
			FROM Покупки as a
			WHERE Товар = (select top(1) Название_товара FROM Отделы  as b
												WHERE a.Товар = b.Название_товара order by Потраченная_сумма desc)


-- 5 z*

select Покупки.id, Покупки.Товар
			FROM Покупки
			WHERE not exists(select * FROM Товары
										 WHERE Покупки.Описание_товара = Товары.Описание)

-- 6 z*

select top(1)
			(select avg(Отделы.Потраченная_сумма) FROM Отделы
						Where Название_товара like 'Товар1')[авг_товара_1],
			(select avg(Отделы.Потраченная_сумма) FROM Отделы
						Where Название_товара like 'Товар2')[авг_товара_2]
						FROM Отделы

-- 7 z*

select Отделы.Название_товара, Отделы.Потраченная_сумма  FROM Отделы
				WHERE Отделы.Потраченная_сумма >=all(select Потраченная_сумма from Отделы)


-- 8 z*			
select Отделы.Название_товара, Отделы.Потраченная_сумма  FROM Отделы
				WHERE Отделы.Потраченная_сумма >=any(select Потраченная_сумма from Отделы)



-- 9 z*


USE UNIVER


SELECT STUDENT.BDAY,STUDENT.NAME
FROM STUDENT
WHERE BDAY in(SELECT STUDENT.BDAY
			FROM STUDENT
			GROUP BY STUDENT.BDAY 
			HAVING COUNT(BDAY) > 1)
	