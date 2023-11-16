--z1
DROP FUNCTION COUNT_STUDENT
go
CREATE FUNCTION COUNT_STUDENT(@faculty varchar(20)) returns int 
	AS
	BEGIN DECLARE @rc int = 0;
		SET @rc =(SELECT COUNT(STUDENT.IDSTUDENT)
							FROM FACULTY
								INNER JOIN GROUPS ON GROUPS.FACULTY = FACULTY.FACULTY
								INNER JOIN STUDENT ON STUDENT.IDGROUP = GROUPS.IDGROUP
									WHERE FACULTY.FACULTY = @faculty)
		return @rc;
	END;

go

DECLARE @faculty int = dbo.COUNT_STUDENT('����');
PRINT '���������� ��������= ' + cast(@faculty as varchar(4));
	
SELECT FACULTY, DBO.COUNT_STUDENT(FACULTY) [����������]
FROM FACULTY

go
ALTER FUNCTION COUNT_STUDENT(@faculty varchar(20) = null, @prof varchar(20) = null) returns int 
	AS
	BEGIN DECLARE @rc int = 0;
		SET @rc =(SELECT COUNT(STUDENT.IDSTUDENT)
							FROM FACULTY
								INNER JOIN GROUPS ON GROUPS.FACULTY = FACULTY.FACULTY
								INNER JOIN STUDENT ON STUDENT.IDGROUP = GROUPS.IDGROUP
									WHERE FACULTY.FACULTY = @FACULTY 
									AND GROUPS.PROFESSION = @PROF)
		return @rc;
	END;
go

DECLARE @faculty int = dbo.COUNT_STUDENT('����', '1-40 01 02');
PRINT '���������� ��������= ' + cast(@faculty as varchar(4));

SELECT FACULTY.FACULTY, GROUPS.PROFESSION, DBO.COUNT_STUDENT(FACULTY.FACULTY, GROUPS.PROFESSION)
FROM FACULTY
		INNER JOIN GROUPS ON GROUPS.FACULTY = FACULTY.FACULTY
GROUP BY FACULTY.FACULTY, GROUPS.PROFESSION


--z2

go
create FUNCTION FSUBJECTS(@p varchar(20)) returns varchar(300) 
     as
     begin  
     declare @tv char(20);  
     declare @t varchar(300) = '����������: ';  
     declare SUB CURSOR LOCAL 
     for select SUBJECT from SUBJECT 
								where SUBJECT.PULPIT = @p;
     open SUB;	  
     fetch  SUB into @tv;   	 
     while @@fetch_status = 0       
     begin 
         set @t = @t + ', ' + rtrim(@tv);         
         FETCH  SUB into @tv; 
     end;    
     return @t;
     end;  
go

select PULPIT,  dbo.FSUBJECTS(PULPIT) [ ]
		from PULPIT;

DROP FUNCTION FSUBJECTS

--z3

go
CREATE FUNCTION FFACPUL(@f varchar(50), @p varchar(50)) returns table 
	AS RETURN
		SELECT FACULTY.FACULTY, PULPIT.PULPIT
		    FROM FACULTY LEFT OUTER JOIN PULPIT
		    ON FACULTY.FACULTY = PULPIT.FACULTY
		WHERE FACULTY.FACULTY=ISNULL(@f, FACULTY.FACULTY) AND PULPIT.PULPIT=ISNULL(@p, PULPIT.PULPIT);
		

go
select * from dbo.FFACPUL(NULL, NULL);
select * from dbo.FFACPUL('����', NULL);
select * from dbo.FFACPUL(NULL, '�����');
select * from dbo.FFACPUL('����', '�����');

--z4

go
CREATE FUNCTION FCTEACHER(@k varchar(50)) returns int 
	AS 
	BEGIN
		DECLARE @rc int =(SELECT COUNT(*) FROM TEACHER WHERE PULPIT = ISNULL(@k, PULPIT));
		return @rc;
	end;

go
SELECT PULPIT, dbo.FCTEACHER(PULPIT) [���������� ��������������] 
		FROM PULPIT

SELECT dbo.FCTEACHER(NULL) [����� ��������������]

--z6
create function FACULTY_REPORT(@c int) returns @fr table
	                        ( [���������] varchar(50), [���������� ������] int, [���������� �����]  int, 
	                                                                 [���������� ���������] int, [���������� ��������������] int )
	as begin 
                 declare cc CURSOR static for 
	       select FACULTY from FACULTY 
													where dbo.COUNT_STUDENT(FACULTY) < @c; 
	       declare @f varchar(30);
	       open cc;  
                 fetch cc into @f;
	       while @@fetch_status = 0
	       begin
	            insert @fr values( @f,  (select count(PULPIT) from PULPIT where FACULTY = @f),
	            (select count(IDGROUP) from GROUPS  where FACULTY = @f),   
				(select count(IDSTUDENT) from STUDENT inner join GROUPS on STUDENT.IDGROUP = GROUPS.IDGROUP  where FACULTY = @f),   
	            (select count(PROFESSION) from PROFESSION where FACULTY = @f)   ); 
	            fetch cc into @f;  
	       end;   
                 return; 
	end;
	DROP function FACULTY_REPORT
	select * from dbo.FACULTY_REPORT(40)

	-----������� ��� 6
	Create function COUNT_GROUPS(@faculty varchar(20))returns int
	as
	begin
	declare @rc int = 0;
	set @rc = (SELECT count(IDGROUP) from GROUPS where FACULTY = @faculty);
	return @rc;
	end;


	Create function COUNT_PROFESSIONS(@faculty varchar(20))returns int
	as
	begin
	declare @rc int = 0;
	set @rc = (SELECT count(PROFESSION) from PROFESSION where FACULTY = @faculty);
	return @rc;
	end;

	Create function COUNT_PULPITS(@faculty varchar(20))returns int
	as
	begin
	declare @rc int = 0;
	set @rc = (SELECT count(PULPIT) from PULPIT where FACULTY = @faculty);
	return @rc;
	end;
	Create function COUNT_STUDENTSX(@faculty varchar(20))
	returns int as begin declare @rc int = 0;
	set @rc = (SELECT count(STUDENT.IDSTUDENT) from FACULTY inner join GROUPS on FACULTY.FACULTY = GROUPS.FACULTY inner join STUDENT on GROUPS.IDGROUP = STUDENT.IDGROUP where FACULTY.FACULTY = @faculty);
	return @rc;
	end;



	create function FACULTY_REPORTX(@c int) returns @fr table
	                        ( [���������] varchar(50), [���������� ������] int, [���������� �����]  int, 
	                                                                 [���������� ���������] int, [���������� ��������������] int )
	as begin 
                 declare cc CURSOR static for 
	       select FACULTY from FACULTY 
                                                    where dbo.COUNT_STUDENTSX(FACULTY) < @c; 
	       declare @f varchar(30);
	       open cc;  
                 fetch cc into @f;
	       while @@fetch_status = 0
	       begin
	            insert @fr values( @f,  dbo.COUNT_PULPITS(@f),
	            dbo.COUNT_GROUPS(@f),   
				dbo.COUNT_STUDENTSX(@f),   
	            dbo.COUNT_PROFESSIONS(@f)   ); 
	            fetch cc into @f;  
	       end;   
                 return; 
	end;
	DROP FUNCTION FACULTY_REPORTX
		select * from FACULTY_REPORTX(40)




--z5**
use MSV_MyBase_2

--z1*
DROP FUNCTION COUNT_MSV
go
CREATE FUNCTION COUNT_MSV(@faculty varchar(20)) returns int 
	AS
	BEGIN DECLARE @rc int = 0;
		SET @rc =(SELECT COUNT(*)
							FROM ������
								INNER JOIN ������� ON �������.����� = ������.��������
									WHERE ������.�������� = @faculty)
		return @rc;
	END;

go

DECLARE @faculty int = dbo.COUNT_MSV('�����1');
PRINT '���������� �������= ' + cast(@faculty as varchar(4));
	

go
ALTER FUNCTION COUNT_MSV(@faculty varchar(20)=null, @prof varchar(20) = null	) returns int 
	AS
	BEGIN DECLARE @rc int = 0;
		SET @rc =(SELECT COUNT(*)
							FROM ������
								INNER JOIN ������� ON �������.����� = ������.��������
									WHERE ������.�������� = @faculty and ������.�������� = @prof)
		return @rc;
	END;

go
DECLARE @faculty int = dbo.COUNT_MSV('�����1','��������2');
PRINT '���������� �������= ' + cast(@faculty as varchar(4));

--z2*

go
create FUNCTION FMSV(@p varchar(20)) returns varchar(300) 
     as
     begin  
     declare @tv char(20);  
     declare @t varchar(300) = '������: ';  
     declare SUB CURSOR LOCAL 
     for select �������� from ������ 
								where �������� = @p;
     open SUB;	  
     fetch  SUB into @tv;   	 
     while @@fetch_status = 0       
     begin 
         set @t = @t + ', ' + rtrim(@tv);         
         FETCH  SUB into @tv; 
     end;    
     return @t;
     end;  
go

select ����������.��������_��������,  dbo.FMSV('��������1') [������]
		from ����������;

DROP FUNCTION FSUBJECTS


--z3*


go
CREATE FUNCTION MSV3(@f varchar(50), @p varchar(50)) returns table 
	AS RETURN
		select ������.��������, ����������.��������_�������� 
					from ������ left outer join ����������
					on ������.�������� = ����������.��������_������
		WHERE ������.��������=ISNULL(@f, ������.��������) AND ����������.��������_��������=ISNULL(@p, ����������.��������_��������);
		

go
select * from dbo.MSV3(NULL, NULL);
select * from dbo.MSV3('�����1', NULL);
select * from dbo.MSV3(NULL, '��������2');
select * from dbo.MSV3('�����1', '��������2');



--z4*
go
CREATE FUNCTION FCMSV(@k varchar(50)) returns int 
	AS 
	BEGIN
		DECLARE @rc int =(SELECT COUNT(*) FROM ������ WHERE �������� = ISNULL(@k, ��������));
		return @rc;
	end;

go
SELECT ��������, dbo.FCMSV(��������) [���������� �������] 
		FROM ������

