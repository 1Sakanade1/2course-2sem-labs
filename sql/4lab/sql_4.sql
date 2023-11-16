USE UNIVER

SELECT * FROM AUDITORIUM;

SELECT * FROM AUDITORIUM_TYPE;

-- 1 + 2 z
SELECT AUDITORIUM_TYPE.AUDITORIUM_TYPENAME,AUDITORIUM.AUDITORIUM
			FROM AUDITORIUM Inner join AUDITORIUM_TYPE ON
			AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE And
			AUDITORIUM_TYPE.AUDITORIUM_TYPENAME Like '%���������%'

-- 3 z
SELECT FACULTY.FACULTY_NAME, PULPIT.PULPIT_NAME, PROFESSION.PROFESSION_NAME, SUBJECT.SUBJECT_NAME, STUDENT.NAME,--TODO FIX
Case 
			When(PROGRESS.NOTE = 6 ) then '�����'
			When(PROGRESS.NOTE = 7 ) then '����'
			When(PROGRESS.NOTE = 8 ) then '������'
			end[������]
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
select PULPIT.PULPIT_NAME [�������], isnull(TEACHER.TEACHER_NAME, '***') [�������������]
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
SELECT ������.����_�����������,������.��������,�������.id
			FROM ������ Inner join ������� ON
			������.�������� = �������.����� And
			�������.����� Like '%�����%'

-- 3 z*

SELECT ������.����_�����������,������.��������,�������.id,
Case 
			When(�������.id = 1 ) then '����'
			When(�������.id = 2 ) then '���'
			When(�������.id = 3 ) then '���'
end[�����_������]
			FROM ������ Inner join ������� ON
			������.�������� = �������.�����
			Order by �������.id desc

-- 4 z*

select ������.��������[��������_������], isnull(������.��������, '***') [��������_������]
			FROM ������
			left  join ������� ON 
			������.�������� = �������.�����;

-- 5 z*
SELECT ������.����_�����������,������.��������, ������.��������
			FROM ������� full outer join ������  ON
			������.�������� = �������.�����
			WHERE ������.�������� is null

SELECT ������.����_�����������,������.��������
			FROM ������ full outer join ������� ON
			������.�������� = �������.�����
			WHERE ������.�������� is not null

SELECT *
		FROM ������ full outer join ������� ON
			 ������.�������� = �������.�����

-- 6 z*
SELECT ������.����_�����������,������.��������,�������.id
			FROM ������ Inner join ������� ON
			������.�������� = �������.�����

SELECT ������.����_�����������,������.��������,�������.id
			FROM ������ Cross join ������� Where
			������.�������� = �������.�����




		