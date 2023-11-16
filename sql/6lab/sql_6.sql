USE UNIVER
-- z 1
SELECT  AUDITORIUM_TYPE.AUDITORIUM_TYPE,
max(AUDITORIUM.AUDITORIUM_CAPACITY)[Максимальная вместимость],
min(AUDITORIUM.AUDITORIUM_CAPACITY)[Минимальная вместимость],
avg(AUDITORIUM.AUDITORIUM_CAPACITY)[Средняя вместимость],
sum(AUDITORIUM.AUDITORIUM_CAPACITY)[Суммарная вместимость],
count(*)[Количество аудиторий]
FROM AUDITORIUM Inner Join AUDITORIUM_TYPE
ON AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
GROUP BY AUDITORIUM_TYPE.AUDITORIUM_TYPE


-- z 3
SELECT * 
 FROM(SELECT case when NOTE  between 4 and 6  then 'от 4 до 6'
		else 'от 6 до 9'
		end[пределы оценок],
		count(*)[количество]
		FROM PROGRESS Group by Case
		when NOTE  between 4 and 6  then 'от 4 до 6'
		else 'от 6 до 9'
		end) as T           
		Order by Case[пределы оценок]
		when 'от 4 до 6' then 2
		when 'от 6 до 9' then 1
		else 0
		end


-- z 4 

select F.FACULTY,
       G.PROFESSION,
       (2014 - G.YEAR_FIRST ) [курс],
       round(avg(cast(NOTE as float(4))), 1) as [средняя оценка]
from FACULTY F
         join GROUPS G on F.FACULTY = G.FACULTY
         join STUDENT S on G.IDGROUP = S.IDGROUP
         join PROGRESS P on S.IDSTUDENT = P.IDSTUDENT
group by F.FACULTY, G.PROFESSION, G.YEAR_FIRST

--z 5
select F.FACULTY,
       G.PROFESSION,
       (2014 - G.YEAR_FIRST ) [курс],
       round(avg(cast(NOTE as float(4))), 1) as [средняя оценка]
from FACULTY F
         join GROUPS G on F.FACULTY = G.FACULTY
         join STUDENT S on G.IDGROUP = S.IDGROUP
         join PROGRESS P on S.IDSTUDENT = P.IDSTUDENT
		 	WHERE P.SUBJECT = 'ОАиП' or P.SUBJECT = 'СУБД'
group by F.FACULTY, G.PROFESSION, G.YEAR_FIRST


--z 6 

select F.FACULTY,
       G.PROFESSION,
       (2014 - G.YEAR_FIRST ) [курс],
       round(avg(cast(NOTE as float(4))), 1) as [средняя оценка]
from FACULTY F
         join GROUPS G on F.FACULTY = G.FACULTY
         join STUDENT S on G.IDGROUP = S.IDGROUP
         join PROGRESS P on S.IDSTUDENT = P.IDSTUDENT
		 WHERE G.FACULTY = 'ИДиП'	
group by F.FACULTY, G.PROFESSION, G.YEAR_FIRST

--z 7 
 select SUBJECT,
       count(NOTE) as [Кол-во]
from PROGRESS
group by SUBJECT, NOTE
HAVING NOTE in (8, 9)


--z 8 **
USE MSV_MyBase_2

--z1*

SELECT  Покупки.Отдел,
max(Отделы.Потраченная_сумма)[Максимально потрачено],
min(Отделы.Потраченная_сумма)[Минимально потрачено],
avg(Отделы.Потраченная_сумма)[Средняя трата],
sum(Отделы.Потраченная_сумма)[Суммарная трата]
FROM Отделы Inner Join Покупки
ON Отделы.Название = Покупки.Отдел
GROUP BY Покупки.Отдел

--z3*
SELECT * 
 FROM(SELECT case when Отделы.Потраченная_сумма  between 10000 and 40000  then 'от 10000 до 40000'
		else 'от 50000 до 70000'
		end[диапазон трат],
		count(*)[количество]
		FROM Отделы Group by Case
		when Отделы.Потраченная_сумма  between 10000 and 40000  then 'от 10000 до 40000'
		else 'от 50000 до 70000'
		end) as T           --почему без T  ошибка
		Order by Case[диапазон трат]
		when 'от 10000 до 40000' then 2
		when 'от 50000 до 70000' then 1
		else 0
		end

--z4*

select Отделы.Название,
       Отделы.Количество_сотрудников,
       round(avg(cast(Отделы.Потраченная_сумма as float(4))), 1) as [средняя потраченная сумма]
from Отделы
group by Отделы.Название,Отделы.Количество_сотрудников

--z5 + z6*

select Отделы.Название,
       Отделы.Количество_сотрудников,
	   Отделы.Предельная_норма_расхода,
       round(avg(cast(Отделы.Потраченная_сумма as float(4))), 1) as [средняя потраченная сумма]
from Отделы
WHERE Отделы.Предельная_норма_расхода > 35000
group by Отделы.Название,Отделы.Количество_сотрудников,Отделы.Предельная_норма_расхода


--z7*

 select Отделы.Предельная_норма_расхода,
       count(Отделы.Название) as [Кол-во]
from Отделы
Group by Отделы.Предельная_норма_расхода
HAVING Отделы.Предельная_норма_расхода in (30000, 70000, 80000)

