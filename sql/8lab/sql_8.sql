use UNIVER


--z1
CREATE VIEW [�������������]
		as select TEACHER.TEACHER [���],
		TEACHER.TEACHER_NAME [��� �������������],
		TEACHER.GENDER [���],
		TEACHER.PULPIT [��� �������]
		FROM TEACHER;

SELECT * FROM [�������������]

SELECT * FROM TEACHER

--z2

CREATE VIEW [���������� ������]
		as select FACULTY.FACULTY_NAME [���������],
		count(PULPIT.PULPIT)[���������� ������]
		from FACULTY inner join PULPIT
		on FACULTY.FACULTY=PULPIT.FACULTY 
		group by FACULTY_NAME

SELECT * FROM [���������� ������]

--z3
CREATE VIEW [���������]
	as select AUDITORIUM.AUDITORIUM[���],
	AUDITORIUM.AUDITORIUM_TYPE[������������ ���������]
	FROM AUDITORIUM
	WHERE AUDITORIUM.AUDITORIUM_TYPE like '��%'

insert into [���������] values ('101-3','��-�')

update [���������] set [���]='100-1' where [���]='101-3'

delete from [���������] where [���]='101-3'

SELECT * FROM [���������]


--z4
CREATE VIEW [����������_���������]
	as select  AUDITORIUM.AUDITORIUM[���],
	AUDITORIUM.AUDITORIUM_NAME[������������ ���������]
	FROM AUDITORIUM
	WHERE AUDITORIUM.AUDITORIUM_TYPE like '��%' WITH CHECK OPTION

SELECT * FROM [����������_���������]


--z5

ALTER VIEW [����������]
	as select top 150 SUBJECT.SUBJECT[���],
	SUBJECT.SUBJECT_NAME[������������ ����������],
	SUBJECT.PULPIT[��� �������]
	FROM SUBJECT
	ORDER BY SUBJECT

SELECT * FROM [����������]

--z6

alter view [���������� ������] WITH SCHEMABINDING
as select FACULTY.FACULTY_NAME [���������],
count(PULPIT.PULPIT)[���������� ������]
from dbo.FACULTY inner join dbo.PULPIT
on FACULTY.FACULTY=PULPIT.FACULTY
group by FACULTY_NAME

SELECT * FROM [���������� ������]

ALTER TABLE dbo.PULPIT ADD COLUMN TEST_COLUMN VARCHAR(50)
--z7**

--z1*
use MSV_MyBase_2

CREATE VIEW [view_purchases]
		as select �������.id [id],
		�������.��������_������ [�������� ������],
		�������.����� [�����],
		�������.����� [�����]
		FROM �������;

SELECT * FROM [view_purchases]

--z2*

CREATE VIEW [������_count]
		as select 
		������.��������_������ [��������],
		count(�����������_�����)[���������� �������]
		FROM ������
		group by ������.��������_������

SELECT * FROM [������_count]

--z3*

CREATE VIEW [������_countz3]
		as select 
		������.��������_������ [��������],
		count(�����������_�����)[���������� �������]
		FROM ������
		where ��������_������ like '�����1'
		group by ������.��������_������

SELECT * FROM [������_countz3]

--z4*
CREATE VIEW [������_countz4]
		as select
		������.��������_������ [��������],
		�����������_����� [����������� �����]
		FROM ������
		where ��������_������ like '�����1'

insert into [������_countz4] values('����������� �����',25000)  /* todo �� �������� ������ */

update [������_countz4] set [����������� �����]='25000' where [����������� �����]='20000'

delete from [������_countz4] where [��������]='����������� �����'

SELECT * FROM [������_countz4]
--z5*

CREATE VIEW [������_countz5]
		as select top 150
		������.��������_������ [��������],
		count(�����������_�����)[���������� �������]
		FROM ������
		where ��������_������ like '�����1'
		group by ������.��������_������

SELECT * FROM [������_countz5]

--z6*

CREATE VIEW [view_purchasesz6] WITH SCHEMABINDING  /*todo ��� �� �������� */
		as select �������.id [id],
		�������.��������_������ [�������� ������],
		�������.����� [�����],
		�������.����� [�����],
		������.����������_����������� [���-�� �����������]
		FROM ������� inner join ������
		on ������.�������� = �������.�����

SELECT * FROM [view_purchasesz6]

