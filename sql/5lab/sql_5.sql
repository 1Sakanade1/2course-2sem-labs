USE UNIVER
-- 1 z

select PULPIT.PULPIT_NAME
			FROM PULPIT, FACULTY
			WHERE PULPIT.FACULTY = FACULTY.FACULTY
			and 
			FACULTY.FACULTY in (select PROFESSION.FACULTY
								FROM PROFESSION					
								WHERE PROFESSION_NAME LIKE ('%����������%')
								   or PROFESSION_NAME LIKE ('%����������%'))X

-- 2 z

select PULPIT.PULPIT_NAME
			FROM PULPIT Inner Join FACULTY
			ON FACULTY.FACULTY = PULPIT.FACULTY
			WHERE FACULTY.FACULTY in (select PROFESSION.FACULTY
								FROM PROFESSION					
								WHERE PROFESSION_NAME LIKE ('%����������%')
								   or PROFESSION_NAME LIKE ('%����������%')) 

-- 3 z

select distinct PULPIT.PULPIT_NAME
			FROM PULPIT Inner Join FACULTY
			ON FACULTY.FACULTY = PULPIT.FACULTY
			Inner Join PROFESSION
			ON FACULTY.FACULTY = PROFESSION.FACULTY
						WHERE PROFESSION_NAME Like ('%����������%')
						   or PROFESSION_NAME Like ('%����������%')

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
			(select  AVG(NOTE) FROM PROGRESS WHERE [SUBJECT] = '����') as '����',
			(select AVG(NOTE) FROM PROGRESS WHERE [SUBJECT] = '��') as '��',
			(select  AVG(NOTE) FROM PROGRESS WHERE [SUBJECT] = '����') as '����'
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
select �������.id
			FROM �������, ������
			WHERE �������.����� = ������.��������
			and 
			������.�������� in (select ����������.��������_������
								FROM ����������
								WHERE ��������_�������� LIKE ('��������1'))

-- 2 z*

select �������.id
			FROM ������� Inner Join ������
			ON �������.����� = ������.�������� 
			WHERE ������.�������� in (select ����������.��������_������
								FROM ����������
								WHERE ��������_�������� LIKE ('��������1'))

-- 3 z*

select �������.id
			FROM ������� Inner Join ������
			ON �������.����� = ������.��������
			Inner Join ����������
			ON ����������.��������_������ = ������.��������
			WHERE ��������_�������� LIKE ('��������1')

-- 4 z*

-- ��� ������, �� ������� ��������� ������ ����� �������  


select ����� 
			FROM ������� as a
			WHERE ����� = (select top(1) ��������_������ FROM ������  as b
												WHERE a.����� = b.��������_������ order by �����������_����� desc)


-- 5 z*

select �������.id, �������.�����
			FROM �������
			WHERE not exists(select * FROM ������
										 WHERE �������.��������_������ = ������.��������)

-- 6 z*

select top(1)
			(select avg(������.�����������_�����) FROM ������
						Where ��������_������ like '�����1')[���_������_1],
			(select avg(������.�����������_�����) FROM ������
						Where ��������_������ like '�����2')[���_������_2]
						FROM ������

-- 7 z*

select ������.��������_������, ������.�����������_�����  FROM ������
				WHERE ������.�����������_����� >=all(select �����������_����� from ������)


-- 8 z*			
select ������.��������_������, ������.�����������_�����  FROM ������
				WHERE ������.�����������_����� >=any(select �����������_����� from ������)



-- 9 z*


USE UNIVER


SELECT STUDENT.BDAY,STUDENT.NAME
FROM STUDENT
WHERE BDAY in(SELECT STUDENT.BDAY
			FROM STUDENT
			GROUP BY STUDENT.BDAY 
			HAVING COUNT(BDAY) > 1)
	