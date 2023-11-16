--z1
GO
CREATE PROCEDURE PSUBJECT
	AS
	BEGIN
		DECLARE @k int = (SELECT COUNT(*) FROM SUBJECT)
		SELECT * FROM SUBJECT;
		return @k;
	END;	

DECLARE @k1 int = 0;
EXEC @k1 = PSUBJECT;
PRINT '���-�� ����� = ' + cast(@k1 as nvarchar(4));

DROP PROCEDURE PSUBJECT

--z2

GO
ALTER PROCEDURE PSUBJECT @p varchar(20) = null, @c int OUTPUT
	AS 
	BEGIN 
		DECLARE @k int = (SELECT COUNT(*) FROM SUBJECT);
		PRINT '���������: @p =' + @p + ', @c = ' + cast(@c as nvarchar(4));
		SELECT * FROM SUBJECT WHERE SUBJECT = @p;
		SET @C = @@ROWCOUNT;
		RETURN @k;
	END;
DECLARE @k int = 0, @r int = 0, @p varchar(20) = '��';
EXEC @k = PSUBJECT @p, @c = @r OUTPUT;
PRINT '���-�� ������ ����� = ' + cast(@k as varchar(3));
PRINT '���-�� ������� � ����� ' + @p + ' = '	+ cast(@r as varchar(3));

--z3

ALTER PROCEDURE PSUBJECT @p varchar(20)
	AS 
	BEGIN 
		DECLARE @k int = (SELECT COUNT(*) FROM SUBJECT);
		SELECT * FROM SUBJECT WHERE PULPIT = @p;
	END;

CREATE TABLE #SUBJECT
(
	SUBJECT nvarchar(50) primary key,
	SUBJECT_NAME nvarchar(50),
	PULPIT nvarchar(50)
)
INSERT #SUBJECT exec PSUBJECT @p = '����';
INSERT #SUBJECT exec PSUBJECT @p = '��';



--z4

GO
CREATE PROCEDURE PAUDITORIUM_INSERT @a char(20), @n varchar(50), @c int = 0, @t char(10)
	AS DECLARE @rc int = 1;
		BEGIN TRY 
			INSERT INTO AUDITORIUM (AUDITORIUM,AUDITORIUM_TYPE,AUDITORIUM_CAPACITY, AUDITORIUM_NAME)
			values(@a, @n, @c, @t)
			return @rc;
		END TRY 
		BEGIN CATCH
			PRINT '����� ������: ' + cast(error_number() as varchar(10));
			PRINT '���������: ' + error_message();
			PRINT '�������: ' + cast(error_severity() as varchar(10));
			PRINT '�����: ' + cast(error_state() as varchar(10));
			PRINT '����� ������: ' + cast(error_line() as varchar(10));
			if error_procedure() is not null
			PRINT '��� ���������: ' + error_procedure();
			return -1;
		END CATCH;
declare @rc int;  
exec @rc = PAUDITORIUM_INSERT @a  = '321-1', @n = '��', @c = 30, @t = '321-1';  
if @rc != 1 print '��� ������ : ' + cast(@rc as varchar(3));

SELECT * FROM AUDITORIUM

DELETE FROM AUDITORIUM WHERE AUDITORIUM = '321-1'

--z5

create procedure SUBJECT_REPORT  @p CHAR(10)
as  
declare @rc int = 0;                            
begin try    
     declare @tv char(20), @t char(300) = ' ';  
     declare SUB CURSOR LOCAL STATIC for 
	select SUBJECT from SUBJECT where PULPIT = @p;
	if not exists (select PULPIT from SUBJECT where PULPIT = @p)
	      raiserror('������', 11, 1);
	 else 
	  open SUB;	  
		fetch  SUB into @tv;   
		print   '��������';   
		while @@fetch_status = 0                                     
		begin 
		     set @t = rtrim(@tv) + ', ' + @t;  
		     set @rc = @rc + 1;       
		     fetch  SUB into @tv; 
		 end;   
		 print @t;        
		 close  SUB;
		 return @rc;
end try  
begin catch              
	print '������ � ����������' 
	if error_procedure() is not null   
		print '��� ��������� : ' + error_procedure();
	return @rc;
end catch; 

declare @rc int;  
exec @rc = SUBJECT_REPORT @p  = '����';  
print '���-�� ���������: ' + cast(@rc as varchar(3)); 

--z6

go
create  procedure PAUDITORIUM_INSERTX
     @a char(20), @n varchar(50), @c int = 0, @t char(10), @tn varchar(50)   
as  declare @rc int=1;                            
begin try 
    set transaction isolation level SERIALIZABLE;          
    begin tran
    insert into AUDITORIUM_TYPE(AUDITORIUM_TYPE, AUDITORIUM_TYPENAME)
                                               values (@t, @tn)
    exec @rc=PAUDITORIUM_INSERT @a, @n, @c, @a;  
    commit tran; 
    return @rc;           
end try
begin catch 
    print '����� ������  : ' + cast(error_number() as varchar(6));
    print '���������     : ' + error_message();
    print '�������       : ' + cast(error_severity()  as varchar(6));
    print '�����         : ' + cast(error_state()   as varchar(8));
    print '����� ������  : ' + cast(error_line()  as varchar(8));
    if error_procedure() is not  null
    print '��� ��������� : ' + error_procedure();
     if @@trancount > 0 rollback tran ; 
     return -1;	  
end catch;


DELETE FROM AUDITORIUM WHERE AUDITORIUM_TYPE = '��'
DELETE FROM AUDITORIUM_TYPE WHERE AUDITORIUM_TYPE = '��'

SELECT * FROM AUDITORIUM
SELECT * FROM AUDITORIUM_TYPE

declare @rc int;  
exec @rc = PAUDITORIUM_INSERTX @a = '132-4', @n = '��', @c = 30,
@t =  '��', @tn =  '������������'; 
if @rc != 1 print '��� ������ : ' + cast(@rc as varchar(3));
     
DROP PROCEDURE PAUDITORIUM_INSERTX


--z7 **
use MSV_MyBase_2


--z1*
GO
CREATE PROCEDURE PMSV
	AS
	BEGIN
		DECLARE @k int = (SELECT COUNT(*) FROM ������)
		SELECT * FROM ������;
		return @k;
	END;	

DECLARE @k1 int = 0;
EXEC @k1 = PMSV;
PRINT '���-�� ����� = ' + cast(@k1 as nvarchar(4));

DROP PROCEDURE PMSV


--z2*
GO
ALTER PROCEDURE PMSV @p varchar(20) = null, @c int OUTPUT
	AS 
	BEGIN 
		DECLARE @k int = (SELECT COUNT(*) FROM ������);
		PRINT '���������: @p =' + @p + ', @c = ' + cast(@c as nvarchar(4));
		SELECT * FROM ������ WHERE �������� = @p;
		SET @C = @@ROWCOUNT;
		RETURN @k;
	END;
DECLARE @k int = 0, @r int = 0, @p varchar(20) = '�����1';
EXEC @k = PMSV @p, @c = @r OUTPUT;
PRINT '���-�� ������� ����� = ' + cast(@k as varchar(3));
PRINT '���-�� ������� � ��������� ' + @p + ' = '	+ cast(@r as varchar(3));

--z3*

ALTER PROCEDURE PMSV @p varchar(20)
	AS 
	BEGIN 
		DECLARE @k int = (SELECT COUNT(*) FROM ������);
		SELECT * FROM ������ WHERE �������� = @p;
	END;

CREATE TABLE #PRODUCTS
(
	�������� nvarchar(50) primary key,
	�������� nvarchar(50),
	����_����������� nvarchar(50)
)
INSERT #PRODUCTS exec PMSV @p = '�����1';
INSERT #PRODUCTS exec PMSV @p = '�����2';

select * from #PRODUCTS

--z4*
GO
CREATE PROCEDURE PMsv_INSERT @a varchar(50), @n varchar(50), @c varchar(50)
	AS DECLARE @rc int = 1;
		BEGIN TRY 
			INSERT INTO ������ (��������,��������,����_�����������)
			values(@a, @n, @c)
			return @rc;
		END TRY 
		BEGIN CATCH
			PRINT '����� ������: ' + cast(error_number() as varchar(10));
			PRINT '���������: ' + error_message();
			PRINT '�������: ' + cast(error_severity() as varchar(10));
			PRINT '�����: ' + cast(error_state() as varchar(10));
			PRINT '����� ������: ' + cast(error_line() as varchar(10));
			if error_procedure() is not null
			PRINT '��� ���������: ' + error_procedure();
			return -1;
		END CATCH;
declare @rc int;  
exec @rc = PMsv_INSERT @a  = '�����1', @n = '��������', @c = '����';  
if @rc != 1 print '��� ������ : ' + cast(@rc as varchar(3));

SELECT * FROM ������

DELETE FROM ������ WHERE �������� = 'kkk'


--z5*
drop procedure MSV_REPORT
create procedure MSV_REPORT  @p VARCHAR(20)
as  
declare @rc int = 0;                            
begin try    
     declare @tv char(20), @t char(300) = ' ';  
     declare TOV CURSOR LOCAL STATIC for 
	select �������� from ������ where �������� = @p;
	if not exists (select �������� from ������ where �������� = @p)
	      raiserror('������', 11, 1);
	 else 
	  open SUB;	  
		fetch  SUB into @tv;   
		print   '������';   
		while @@fetch_status = 0                                     
		begin 
		     set @t = rtrim(@tv) + ', ' + @t;  
		     set @rc = @rc + 1;       
		     fetch  SUB into @tv; 
		 end;   
		 print @t;        
		 close  SUB;
		 return @rc;
end try  
begin catch              
	print '������ � ����������' 
	if error_procedure() is not null   
		print '��� ��������� : ' + error_procedure();
	return @rc;
end catch; 

declare @rc int;  
exec @rc = MSV_REPORT @p  = '��������1';  
print '���-�� ���������: ' + cast(@rc as varchar(3)); 

--z6*

drop procedure MSV_INSERTX
go
create  procedure MSV_INSERTX
     @a VARCHAR(20), @n varchar(50), @c VARCHAR(20), @t varchar(20), @tn varchar(50)  
as  declare @rc int=1;                            
begin try 
    set transaction isolation level SERIALIZABLE;          
    begin tran

	exec @rc=PMsv_INSERT @a, @n, @c;

    insert into ����������(��������_��������,��������_������)
                                               values (@t, @tn)
      
    commit tran; 
    return @rc;           
end try
begin catch 
    print '����� ������  : ' + cast(error_number() as varchar(6));
    print '���������     : ' + error_message();
    print '�������       : ' + cast(error_severity()  as varchar(6));
    print '�����         : ' + cast(error_state()   as varchar(8));
    print '����� ������  : ' + cast(error_line()  as varchar(8));
    if error_procedure() is not  null
    print '��� ��������� : ' + error_procedure();
     if @@trancount > 0 rollback tran ; 
     return -1;	  
end catch;



declare @rc int;  
exec @rc = MSV_INSERTX @a = '�����4', @n = '��������', @c = '����',
@t =  '��������5', @tn =  '�����1'; 
if @rc != 1 print '��� ������ : ' + cast(@rc as varchar(3));
     
DROP PROCEDURE PAUDITORIUM_INSERTX