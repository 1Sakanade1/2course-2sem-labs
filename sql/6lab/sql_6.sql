USE UNIVER
-- z 1
SELECT  AUDITORIUM_TYPE.AUDITORIUM_TYPE,
max(AUDITORIUM.AUDITORIUM_CAPACITY)[������������ �����������],
min(AUDITORIUM.AUDITORIUM_CAPACITY)[����������� �����������],
avg(AUDITORIUM.AUDITORIUM_CAPACITY)[������� �����������],
sum(AUDITORIUM.AUDITORIUM_CAPACITY)[��������� �����������],
count(*)[���������� ���������]
FROM AUDITORIUM Inner Join AUDITORIUM_TYPE
ON AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
GROUP BY AUDITORIUM_TYPE.AUDITORIUM_TYPE


-- z 3
SELECT * 
 FROM(SELECT case when NOTE  between 4 and 6  then '�� 4 �� 6'
		else '�� 6 �� 9'
		end[������� ������],
		count(*)[����������]
		FROM PROGRESS Group by Case
		when NOTE  between 4 and 6  then '�� 4 �� 6'
		else '�� 6 �� 9'
		end) as T           
		Order by Case[������� ������]
		when '�� 4 �� 6' then 2
		when '�� 6 �� 9' then 1
		else 0
		end


-- z 4 

select F.FACULTY,
       G.PROFESSION,
       (2014 - G.YEAR_FIRST ) [����],
       round(avg(cast(NOTE as float(4))), 1) as [������� ������]
from FACULTY F
         join GROUPS G on F.FACULTY = G.FACULTY
         join STUDENT S on G.IDGROUP = S.IDGROUP
         join PROGRESS P on S.IDSTUDENT = P.IDSTUDENT
group by F.FACULTY, G.PROFESSION, G.YEAR_FIRST

--z 5
select F.FACULTY,
       G.PROFESSION,
       (2014 - G.YEAR_FIRST ) [����],
       round(avg(cast(NOTE as float(4))), 1) as [������� ������]
from FACULTY F
         join GROUPS G on F.FACULTY = G.FACULTY
         join STUDENT S on G.IDGROUP = S.IDGROUP
         join PROGRESS P on S.IDSTUDENT = P.IDSTUDENT
		 	WHERE P.SUBJECT = '����' or P.SUBJECT = '����'
group by F.FACULTY, G.PROFESSION, G.YEAR_FIRST


--z 6 

select F.FACULTY,
       G.PROFESSION,
       (2014 - G.YEAR_FIRST ) [����],
       round(avg(cast(NOTE as float(4))), 1) as [������� ������]
from FACULTY F
         join GROUPS G on F.FACULTY = G.FACULTY
         join STUDENT S on G.IDGROUP = S.IDGROUP
         join PROGRESS P on S.IDSTUDENT = P.IDSTUDENT
		 WHERE G.FACULTY = '����'	
group by F.FACULTY, G.PROFESSION, G.YEAR_FIRST

--z 7 
 select SUBJECT,
       count(NOTE) as [���-��]
from PROGRESS
group by SUBJECT, NOTE
HAVING NOTE in (8, 9)


--z 8 **
USE MSV_MyBase_2

--z1*

SELECT  �������.�����,
max(������.�����������_�����)[����������� ���������],
min(������.�����������_�����)[���������� ���������],
avg(������.�����������_�����)[������� �����],
sum(������.�����������_�����)[��������� �����]
FROM ������ Inner Join �������
ON ������.�������� = �������.�����
GROUP BY �������.�����

--z3*
SELECT * 
 FROM(SELECT case when ������.�����������_�����  between 10000 and 40000  then '�� 10000 �� 40000'
		else '�� 50000 �� 70000'
		end[�������� ����],
		count(*)[����������]
		FROM ������ Group by Case
		when ������.�����������_�����  between 10000 and 40000  then '�� 10000 �� 40000'
		else '�� 50000 �� 70000'
		end) as T           --������ ��� T  ������
		Order by Case[�������� ����]
		when '�� 10000 �� 40000' then 2
		when '�� 50000 �� 70000' then 1
		else 0
		end

--z4*

select ������.��������,
       ������.����������_�����������,
       round(avg(cast(������.�����������_����� as float(4))), 1) as [������� ����������� �����]
from ������
group by ������.��������,������.����������_�����������

--z5 + z6*

select ������.��������,
       ������.����������_�����������,
	   ������.����������_�����_�������,
       round(avg(cast(������.�����������_����� as float(4))), 1) as [������� ����������� �����]
from ������
WHERE ������.����������_�����_������� > 35000
group by ������.��������,������.����������_�����������,������.����������_�����_�������


--z7*

 select ������.����������_�����_�������,
       count(������.��������) as [���-��]
from ������
Group by ������.����������_�����_�������
HAVING ������.����������_�����_������� in (30000, 70000, 80000)

