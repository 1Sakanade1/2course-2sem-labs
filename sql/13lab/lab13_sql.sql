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
PRINT 'кол-во строк = ' + cast(@k1 as nvarchar(4));

DROP PROCEDURE PSUBJECT

--z2

GO
ALTER PROCEDURE PSUBJECT @p varchar(20) = null, @c int OUTPUT
	AS 
	BEGIN 
		DECLARE @k int = (SELECT COUNT(*) FROM SUBJECT);
		PRINT 'параметры: @p =' + @p + ', @c = ' + cast(@c as nvarchar(4));
		SELECT * FROM SUBJECT WHERE SUBJECT = @p;
		SET @C = @@ROWCOUNT;
		RETURN @k;
	END;
DECLARE @k int = 0, @r int = 0, @p varchar(20) = 'БД';
EXEC @k = PSUBJECT @p, @c = @r OUTPUT;
PRINT 'кол-во кафедр всего = ' + cast(@k as varchar(3));
PRINT 'кол-во товаров с кодом ' + @p + ' = '	+ cast(@r as varchar(3));

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
INSERT #SUBJECT exec PSUBJECT @p = 'ИСит';
INSERT #SUBJECT exec PSUBJECT @p = 'ОХ';



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
			PRINT 'номер ошибки: ' + cast(error_number() as varchar(10));
			PRINT 'сообщение: ' + error_message();
			PRINT 'уровень: ' + cast(error_severity() as varchar(10));
			PRINT 'метка: ' + cast(error_state() as varchar(10));
			PRINT 'Номер строки: ' + cast(error_line() as varchar(10));
			if error_procedure() is not null
			PRINT 'имя процедуры: ' + error_procedure();
			return -1;
		END CATCH;
declare @rc int;  
exec @rc = PAUDITORIUM_INSERT @a  = '321-1', @n = 'ЛК', @c = 30, @t = '321-1';  
if @rc != 1 print 'код ошибки : ' + cast(@rc as varchar(3));

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
	      raiserror('ошибка', 11, 1);
	 else 
	  open SUB;	  
		fetch  SUB into @tv;   
		print   'предметы';   
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
	print 'ошибка в параметрах' 
	if error_procedure() is not null   
		print 'имя процедуры : ' + error_procedure();
	return @rc;
end catch; 

declare @rc int;  
exec @rc = SUBJECT_REPORT @p  = 'ИСиТ';  
print 'кол-во предметов: ' + cast(@rc as varchar(3)); 

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
    print 'номер ошибки  : ' + cast(error_number() as varchar(6));
    print 'сообщение     : ' + error_message();
    print 'уровень       : ' + cast(error_severity()  as varchar(6));
    print 'метка         : ' + cast(error_state()   as varchar(8));
    print 'номер строки  : ' + cast(error_line()  as varchar(8));
    if error_procedure() is not  null
    print 'имя процедуры : ' + error_procedure();
     if @@trancount > 0 rollback tran ; 
     return -1;	  
end catch;


DELETE FROM AUDITORIUM WHERE AUDITORIUM_TYPE = 'ЛР'
DELETE FROM AUDITORIUM_TYPE WHERE AUDITORIUM_TYPE = 'ЛР'

SELECT * FROM AUDITORIUM
SELECT * FROM AUDITORIUM_TYPE

declare @rc int;  
exec @rc = PAUDITORIUM_INSERTX @a = '132-4', @n = 'ЛР', @c = 30,
@t =  'ЛР', @tn =  'Лабораторная'; 
if @rc != 1 print 'код ошибки : ' + cast(@rc as varchar(3));
     
DROP PROCEDURE PAUDITORIUM_INSERTX


--z7 **
use MSV_MyBase_2


--z1*
GO
CREATE PROCEDURE PMSV
	AS
	BEGIN
		DECLARE @k int = (SELECT COUNT(*) FROM Товары)
		SELECT * FROM Товары;
		return @k;
	END;	

DECLARE @k1 int = 0;
EXEC @k1 = PMSV;
PRINT 'кол-во строк = ' + cast(@k1 as nvarchar(4));

DROP PROCEDURE PMSV


--z2*
GO
ALTER PROCEDURE PMSV @p varchar(20) = null, @c int OUTPUT
	AS 
	BEGIN 
		DECLARE @k int = (SELECT COUNT(*) FROM Товары);
		PRINT 'параметры: @p =' + @p + ', @c = ' + cast(@c as nvarchar(4));
		SELECT * FROM Товары WHERE Название = @p;
		SET @C = @@ROWCOUNT;
		RETURN @k;
	END;
DECLARE @k int = 0, @r int = 0, @p varchar(20) = 'Товар1';
EXEC @k = PMSV @p, @c = @r OUTPUT;
PRINT 'кол-во товаров всего = ' + cast(@k as varchar(3));
PRINT 'кол-во товаров с названием ' + @p + ' = '	+ cast(@r as varchar(3));

--z3*

ALTER PROCEDURE PMSV @p varchar(20)
	AS 
	BEGIN 
		DECLARE @k int = (SELECT COUNT(*) FROM Товары);
		SELECT * FROM Товары WHERE Название = @p;
	END;

CREATE TABLE #PRODUCTS
(
	Название nvarchar(50) primary key,
	Описание nvarchar(50),
	Дата_поступления nvarchar(50)
)
INSERT #PRODUCTS exec PMSV @p = 'Товар1';
INSERT #PRODUCTS exec PMSV @p = 'Товар2';

select * from #PRODUCTS

--z4*
GO
CREATE PROCEDURE PMsv_INSERT @a varchar(50), @n varchar(50), @c varchar(50)
	AS DECLARE @rc int = 1;
		BEGIN TRY 
			INSERT INTO Товары (Название,Описание,Дата_поступления)
			values(@a, @n, @c)
			return @rc;
		END TRY 
		BEGIN CATCH
			PRINT 'номер ошибки: ' + cast(error_number() as varchar(10));
			PRINT 'сообщение: ' + error_message();
			PRINT 'уровень: ' + cast(error_severity() as varchar(10));
			PRINT 'метка: ' + cast(error_state() as varchar(10));
			PRINT 'Номер строки: ' + cast(error_line() as varchar(10));
			if error_procedure() is not null
			PRINT 'имя процедуры: ' + error_procedure();
			return -1;
		END CATCH;
declare @rc int;  
exec @rc = PMsv_INSERT @a  = 'Товар1', @n = 'Описание', @c = 'Дата';  
if @rc != 1 print 'код ошибки : ' + cast(@rc as varchar(3));

SELECT * FROM Товары

DELETE FROM Товары WHERE Название = 'kkk'


--z5*
drop procedure MSV_REPORT
create procedure MSV_REPORT  @p VARCHAR(20)
as  
declare @rc int = 0;                            
begin try    
     declare @tv char(20), @t char(300) = ' ';  
     declare TOV CURSOR LOCAL STATIC for 
	select название from Товары where Описание = @p;
	if not exists (select Описание from Товары where Описание = @p)
	      raiserror('ошибка', 11, 1);
	 else 
	  open SUB;	  
		fetch  SUB into @tv;   
		print   'Товары';   
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
	print 'ошибка в параметрах' 
	if error_procedure() is not null   
		print 'имя процедуры : ' + error_procedure();
	return @rc;
end catch; 

declare @rc int;  
exec @rc = MSV_REPORT @p  = 'Описание1';  
print 'кол-во предметов: ' + cast(@rc as varchar(3)); 

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

    insert into Поставщики(Название_компании,Название_товара)
                                               values (@t, @tn)
      
    commit tran; 
    return @rc;           
end try
begin catch 
    print 'номер ошибки  : ' + cast(error_number() as varchar(6));
    print 'сообщение     : ' + error_message();
    print 'уровень       : ' + cast(error_severity()  as varchar(6));
    print 'метка         : ' + cast(error_state()   as varchar(8));
    print 'номер строки  : ' + cast(error_line()  as varchar(8));
    if error_procedure() is not  null
    print 'имя процедуры : ' + error_procedure();
     if @@trancount > 0 rollback tran ; 
     return -1;	  
end catch;



declare @rc int;  
exec @rc = MSV_INSERTX @a = 'Товар4', @n = 'Описание', @c = 'дата',
@t =  'Компания5', @tn =  'Товар1'; 
if @rc != 1 print 'код ошибки : ' + cast(@rc as varchar(3));
     
DROP PROCEDURE PAUDITORIUM_INSERTX