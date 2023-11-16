use UNIVER
--z1

SELECT FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT,AVG(PROGRESS.NOTE)[��. ������]
		FROM FACULTY 
		Inner Join GROUPS 
		on FACULTY.FACULTY = GROUPS.FACULTY 
		Inner Join STUDENT 
		on GROUPS.IDGROUP = STUDENT.IDGROUP 
		Inner Join PROGRESS 
		on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
		WHERE FACULTY.FACULTY in ('����')
		GROUP BY ROLLUP (FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT)


SELECT FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT,AVG(PROGRESS.NOTE)
		FROM FACULTY 
		Inner Join GROUPS 
		on FACULTY.FACULTY = GROUPS.FACULTY 
		Inner Join STUDENT 
		on GROUPS.IDGROUP = STUDENT.IDGROUP 
		Inner Join PROGRESS 
		on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
		WHERE FACULTY.FACULTY in ('����')
		GROUP BY FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT


--z2

SELECT FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT,AVG(PROGRESS.NOTE)
		FROM FACULTY 
		Inner Join GROUPS 
		on FACULTY.FACULTY = GROUPS.FACULTY 
		Inner Join STUDENT 
		on GROUPS.IDGROUP = STUDENT.IDGROUP 
		Inner Join PROGRESS 
		on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
		WHERE FACULTY.FACULTY in ('����')
		GROUP BY CUBE (FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT)

--z3

SELECT FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT,AVG(PROGRESS.NOTE)
		FROM FACULTY 
		Inner Join GROUPS 
		on FACULTY.FACULTY = GROUPS.FACULTY 
		Inner Join STUDENT 
		on GROUPS.IDGROUP = STUDENT.IDGROUP 
		Inner Join PROGRESS 
		on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
		WHERE FACULTY.FACULTY in ('����')
		GROUP BY FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT
UNION

SELECT FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT,AVG(PROGRESS.NOTE)
		FROM FACULTY 
		Inner Join GROUPS 
		on FACULTY.FACULTY = GROUPS.FACULTY 
		Inner Join STUDENT 
		on GROUPS.IDGROUP = STUDENT.IDGROUP 
		Inner Join PROGRESS 
		on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
		WHERE FACULTY.FACULTY in ('����')
		GROUP BY FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT



--UNION ALL

SELECT FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT,AVG(PROGRESS.NOTE)
		FROM FACULTY 
		Inner Join GROUPS 
		on FACULTY.FACULTY = GROUPS.FACULTY 
		Inner Join STUDENT 
		on GROUPS.IDGROUP = STUDENT.IDGROUP 
		Inner Join PROGRESS 
		on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
		WHERE FACULTY.FACULTY in ('����')
		GROUP BY FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT
UNION ALL

SELECT FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT,AVG(PROGRESS.NOTE)
		FROM FACULTY 
		Inner Join GROUPS 
		on FACULTY.FACULTY = GROUPS.FACULTY 
		Inner Join STUDENT 
		on GROUPS.IDGROUP = STUDENT.IDGROUP 
		Inner Join PROGRESS 
		on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
		WHERE FACULTY.FACULTY in ('����')
		GROUP BY FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT

--4z


SELECT FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT,AVG(PROGRESS.NOTE)
		FROM FACULTY 
		Inner Join GROUPS 
		on FACULTY.FACULTY = GROUPS.FACULTY 
		Inner Join STUDENT 
		on GROUPS.IDGROUP = STUDENT.IDGROUP 
		Inner Join PROGRESS 
		on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
		WHERE FACULTY.FACULTY in ('����')
		GROUP BY FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT
UNION

SELECT FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT,AVG(PROGRESS.NOTE)
		FROM FACULTY 
		Inner Join GROUPS 
		on FACULTY.FACULTY = GROUPS.FACULTY 
		Inner Join STUDENT 
		on GROUPS.IDGROUP = STUDENT.IDGROUP 
		Inner Join PROGRESS 
		on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
		WHERE FACULTY.FACULTY in ('����')
		GROUP BY FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT
INTERSECT

SELECT FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT,AVG(PROGRESS.NOTE)
		FROM FACULTY 
		Inner Join GROUPS 
		on FACULTY.FACULTY = GROUPS.FACULTY 
		Inner Join STUDENT 
		on GROUPS.IDGROUP = STUDENT.IDGROUP 
		Inner Join PROGRESS 
		on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
		WHERE FACULTY.FACULTY in ('����')
		GROUP BY FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT
UNION ALL

SELECT FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT,AVG(PROGRESS.NOTE)
		FROM FACULTY 
		Inner Join GROUPS 
		on FACULTY.FACULTY = GROUPS.FACULTY 
		Inner Join STUDENT 
		on GROUPS.IDGROUP = STUDENT.IDGROUP 
		Inner Join PROGRESS 
		on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
		WHERE FACULTY.FACULTY in ('����')
		GROUP BY FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT


--z5


SELECT FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT,AVG(PROGRESS.NOTE)
		FROM FACULTY 
		Inner Join GROUPS 
		on FACULTY.FACULTY = GROUPS.FACULTY 
		Inner Join STUDENT 
		on GROUPS.IDGROUP = STUDENT.IDGROUP 
		Inner Join PROGRESS 
		on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
		WHERE FACULTY.FACULTY in ('����')
		GROUP BY FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT
UNION
SELECT FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT,AVG(PROGRESS.NOTE)
		FROM FACULTY 
		Inner Join GROUPS 
		on FACULTY.FACULTY = GROUPS.FACULTY 
		Inner Join STUDENT 
		on GROUPS.IDGROUP = STUDENT.IDGROUP 
		Inner Join PROGRESS 
		on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
		WHERE FACULTY.FACULTY in ('����')
		GROUP BY FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT
EXCEPT

SELECT FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT,AVG(PROGRESS.NOTE)
		FROM FACULTY 
		Inner Join GROUPS 
		on FACULTY.FACULTY = GROUPS.FACULTY 
		Inner Join STUDENT 
		on GROUPS.IDGROUP = STUDENT.IDGROUP 
		Inner Join PROGRESS 
		on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
		WHERE FACULTY.FACULTY in ('����')
		GROUP BY FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT
UNION ALL

SELECT FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT,AVG(PROGRESS.NOTE)
		FROM FACULTY 
		Inner Join GROUPS 
		on FACULTY.FACULTY = GROUPS.FACULTY 
		Inner Join STUDENT 
		on GROUPS.IDGROUP = STUDENT.IDGROUP 
		Inner Join PROGRESS 
		on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
		WHERE FACULTY.FACULTY in ('����')
		GROUP BY FACULTY.FACULTY,GROUPS.PROFESSION,PROGRESS.SUBJECT




--z6**


--z1*

use MSV_MyBase_2

SELECT �������.����� ,������.��������,AVG(������.�����������_�����)[��. �����] 
	FROM ������� 
	Inner join ������
	on �������.����� = ������.��������
	Inner join ������
	on ������.��������_������ = ������.��������
	GROUP BY ROLLUP (�������.�����,������.��������)

	use MSV_MyBase_2


--z2*
SELECT �������.����� ,������.��������,AVG(������.�����������_�����)[��. �����] 
	FROM ������� 
	Inner join ������
	on �������.����� = ������.��������
	Inner join ������
	on ������.��������_������ = ������.��������
	GROUP BY CUBE (�������.�����,������.��������)


--z3* 4 5

SELECT �������.����� ,������.��������
	FROM ������� 
	Inner join ������
	on �������.����� = ������.��������
	Inner join ������
	on ������.��������_������ = ������.��������
	WHERE ������.�������� in ('��������1')
	GROUP BY �������.�����,������.��������
UNION

SELECT �������.����� ,������.��������
	FROM ������� 
	Inner join ������
	on �������.����� = ������.��������
	Inner join ������
	on ������.��������_������ = ������.��������
	WHERE ������.�������� in ('��������2')
	GROUP BY �������.�����,������.��������
INTERSECT
SELECT �������.����� ,������.��������
	FROM ������� 
	Inner join ������
	on �������.����� = ������.��������
	Inner join ������
	on ������.��������_������ = ������.��������
	WHERE ������.�������� in ('��������1')
	GROUP BY �������.�����,������.��������
UNION ALL

SELECT �������.����� ,������.��������
	FROM ������� 
	Inner join ������
	on �������.����� = ������.��������
	Inner join ������
	on ������.��������_������ = ������.��������
	WHERE ������.�������� in ('��������2')
	GROUP BY �������.�����,������.��������




SELECT �������.����� ,������.��������
	FROM ������� 
	Inner join ������
	on �������.����� = ������.��������
	Inner join ������
	on ������.��������_������ = ������.��������
	WHERE ������.�������� in ('��������1')
	GROUP BY �������.�����,������.��������
UNION

SELECT �������.����� ,������.��������
	FROM ������� 
	Inner join ������
	on �������.����� = ������.��������
	Inner join ������
	on ������.��������_������ = ������.��������
	WHERE ������.�������� in ('��������2')
	GROUP BY �������.�����,������.��������
EXCEPT
SELECT �������.����� ,������.��������
	FROM ������� 
	Inner join ������
	on �������.����� = ������.��������
	Inner join ������
	on ������.��������_������ = ������.��������
	WHERE ������.�������� in ('��������1')
	GROUP BY �������.�����,������.��������
UNION ALL

SELECT �������.����� ,������.��������
	FROM ������� 
	Inner join ������
	on �������.����� = ������.��������
	Inner join ������
	on ������.��������_������ = ������.��������
	WHERE ������.�������� in ('��������2')
	GROUP BY �������.�����,������.��������
