--z1

use UNIVER;

SELECT * FROM SUBJECT

DECLARE SUBJECT_CS CURSOR
		FOR  SELECT SUBJECT FROM SUBJECT
			WHERE SUBJECT.PULPIT = 'ИСиТ'

DECLARE @SUB char(20), @p char(300) = '';
OPEN SUBJECT_CS;
FETCH SUBJECT_CS into @SUB;
PRINT 'Дисциплины';
WHILE @@FETCH_STATUS = 0
	BEGIN 
		set @p = RTRIM(@SUB) + ',' + @p;
		FETCH SUBJECT_CS into @SUB;
	END;
PRINT @p;
CLOSE SUBJECT_CS;

--z2

use UNIVER;

DECLARE AUDL CURSOR LOCAL                            
	             for SELECT AUDITORIUM_TYPE, AUDITORIUM_CAPACITY from AUDITORIUM;

DECLARE @AT char(40), @AC int;      
	OPEN AUDL;	  
	fetch  AUDL into @AT, @AC; 	
      print '1. '+@AT+cast(@AC as varchar(10));  	
	fetch  AUD into @AT, @AC; 	
      print '2. '+@AT+cast(@AC as varchar(10));  
	  close AUDL;
  go  
  


DECLARE AUD CURSOR GLOBAl                            
	             for SELECT AUDITORIUM_TYPE, AUDITORIUM_CAPACITY from AUDITORIUM;

DECLARE @AT char(20), @AC int;      
	OPEN AUD;	  
	fetch  AUD into @AT, @AC; 	
      print '1. '+@AT+cast(@AC as varchar(10));        	
	fetch  AUD into @AT, @AC; 	
      print '2. '+@AT+cast(@AC as varchar(10)); 
	  close AUD
  go   

deallocate AUD

--z3

use UNIVER;

DECLARE @AUD char(10), @AUDC char(40), @AUDN char(1);  
	DECLARE AUD CURSOR LOCAL DYNAMIC                  --STATIC            
		 for SELECT AUDITORIUM, AUDITORIUM_CAPACITY, AUDITORIUM_NAME 
		       FROM dbo.AUDITORIUM where AUDITORIUM_NAME LIKE('%-3');				   
	open AUD;
	print   'Количество строк : '+cast(@@CURSOR_ROWS as varchar(5)); 
    	UPDATE AUDITORIUM set AUDITORIUM_CAPACITY = 30 where AUDITORIUM_TYPE = 'ЛК';
	DELETE AUDITORIUM where AUDITORIUM_NAME LIKE('%-3');
	INSERT AUDITORIUM (AUDITORIUM, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY, AUDITORIUM_NAME) 
	                 values ('215-3', 'ЛК', 30,'215-3'); 
	FETCH  AUD into @AUD, @AUDC, @AUDN;     
	while @@fetch_status = 0                                    
      begin 
          print rtrim(@AUD) + ' '+ rtrim(@AUDC) + ' '+ rtrim(@AUDN);    
          fetch AUD into @AUD, @AUDC, @AUDN; 
       end;          
   CLOSE  AUD;

   --z4

   use UNIVER;

SELECT * FROM AUDITORIUM 

DECLARE  @Uc int, @Un char(50);  
DECLARE Primer2 cursor local dynamic SCROLL                               
               for SELECT row_number() over (order by AUDITORIUM_TYPE) N,
	                          AUDITORIUM  FROM dbo.AUDITORIUM where AUDITORIUM_TYPE = 'ЛБ-К' 
OPEN Primer2;
FETCH  Primer2 into  @Uc, @Un;                 
print 'следующая строка        : ' + cast(@Uc as varchar(3))+ ' ' + rtrim(@Un);      
FETCH LAST from  Primer2 into @Uc, @Un;       
print 'последняя строка          : ' +  cast(@Uc as varchar(3))+ ' ' + rtrim(@Un);      
FETCH FIRST from  Primer2 into @Uc, @Un;       
print 'первая строка          : ' +  cast(@Uc as varchar(3))+ ' ' + rtrim(@Un);     
FETCH NEXT from  Primer2 into @Uc, @Un;       
print 'следующая строка за текущей          : ' +  cast(@Uc as varchar(3))+ ' ' + rtrim(@Un);     
FETCH PRIOR from  Primer2 into @Uc, @Un;       
print 'предыдущая строка от текущей          : ' +  cast(@Uc as varchar(3))+ ' ' + rtrim(@Un);    
FETCH ABSOLUTE 3 from  Primer2 into @Uc, @Un;       
print 'третья строка от начала          : ' +  cast(@Uc as varchar(3))+ ' ' + rtrim(@Un);  
FETCH RELATIVE  5 from  Primer2 into @Uc, @Un;       
print 'пятая строка вперед от текущей          : ' +  cast(@Uc as varchar(3))+ ' ' + rtrim(@Un);  

CLOSE Primer2

--z5

--z6
use UNIVER;

SELECT PROGRESS.NOTE, STUDENT.NAME, GROUPS.FACULTY
		FROM PROGRESS JOIN STUDENT 
			ON PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
					  JOIN GROUPS
						ON STUDENT.IDGROUP = GROUPS.IDGROUP

INSERT INTO PROGRESS(SUBJECT,IDSTUDENT,PDATE,NOTE)
	values('ООП', 1000, '2013-01-01', 3);

DECLARE Primer3 CURSOR GLOBAL DYNAMIC
	FOR SELECT PROGRESS.NOTE, STUDENT.NAME, GROUPS.FACULTY
		FROM PROGRESS JOIN STUDENT 
			ON PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
					  JOIN GROUPS
						ON STUDENT.IDGROUP = GROUPS.IDGROUP

DECLARE @MARK int, @NAME nvarchar(30), @FAC nvarchar(10);
OPEN  Primer3
	FETCH FIRST FROM Primer3 into @MARK, @NAME, @FAC;
	WHILE @@FETCH_STATUS = 0 
		BEGIN
			IF @MARK < 4
			BEGIN	
				PRINT 'Будет удален: ' + rtrim(cast(@MARK as nvarchar(5))) + ' ' + @NAME + ' ' + @FAC ; 
				DELETE PROGRESS WHERE CURRENT OF Primer3;
				FETCH Primer3 into @MARK, @NAME, @FAC;
			END
		END
CLOSE Primer3;


--z7**

--z1*
use MSV_MyBase_2;

SELECT * FROM Отделы

DECLARE Cursor_Otdeli1 CURSOR
		FOR  SELECT Название FROM Отделы
			WHERE Название_товара = 'Товар1'

DEALLOCATE Cursor_Otdeli1;

DECLARE @OTD char(20), @p char(300) = '';
OPEN Cursor_Otdeli1;
FETCH Cursor_Otdeli1 into @OTD;
PRINT ' Отделы';
WHILE @@FETCH_STATUS = 0
	BEGIN 
		set @p = RTRIM(@OTD) + ',' + @p;
		FETCH Cursor_Otdeli1 into @OTD;
	END;
PRINT @p;
CLOSE Cursor_Otdeli1;


--z2*

DECLARE LCursor_Otdeli2 CURSOR LOCAL
		FOR  SELECT Название FROM Отделы
			WHERE Название_товара = 'Товар1'

OPEN LCursor_Otdeli1;
FETCH LCursor_Otdeli1 into @OTD;
PRINT ' Отделы';
WHILE @@FETCH_STATUS = 0
	BEGIN 
		set @p = RTRIM(@OTD) + ',' + @p;
		FETCH LCursor_Otdeli1 into @OTD;
	END;
PRINT @p;
CLOSE LCursor_Otdeli1;

			
DECLARE GCursor_Otdeli2 CURSOR GLOBAL
		FOR  SELECT Название FROM Отделы
			WHERE Название_товара = 'Товар1'

OPEN GCursor_Otdeli1;
FETCH GCursor_Otdeli1 into @OTD;
PRINT ' Отделы';
WHILE @@FETCH_STATUS = 0
	BEGIN 
		set @p = RTRIM(@OTD) + ',' + @p;
		FETCH GCursor_Otdeli1 into @OTD;
	END;
PRINT @p;
CLOSE GCursor_Otdeli1;

--z3*

--3_1*
DECLARE Cursor_Otdeli3_D CURSOR DYNAMIC
		FOR  SELECT Название FROM Отделы
			WHERE Название_товара = 'Товар1'

DECLARE @OTD char(20), @p char(300) = '';
OPEN Cursor_Otdeli3_D;
FETCH Cursor_Otdeli3_D into @OTD;
PRINT ' Отделы';
WHILE @@FETCH_STATUS = 0
	BEGIN 
		set @p = RTRIM(@OTD) + ',' + @p;
		FETCH  Cursor_Otdeli3_D into @OTD;
	END;
PRINT @p;
CLOSE Cursor_Otdeli3_D;


--3_2*
DECLARE Cursor_Otdeli3_S CURSOR STATIC
		FOR  SELECT Название FROM Отделы
			WHERE Название_товара = 'Товар1'

DECLARE @OTD char(20), @p char(300) = '';
OPEN Cursor_Otdeli3_S;
FETCH Cursor_Otdeli3_S into @OTD;
PRINT ' Отделы';
WHILE @@FETCH_STATUS = 0
	BEGIN 
		set @p = RTRIM(@OTD) + ',' + @p;
		FETCH  Cursor_Otdeli3_S into @OTD;
	END;
PRINT @p;
CLOSE Cursor_Otdeli3_S;

--z4*

DECLARE @id4 NVARCHAR(50)
DECLARE myCursor4 SCROLL CURSOR FOR
SELECT Название FROM Отделы
ORDER BY Потраченная_сумма DESC

OPEN myCursor4

FETCH LAST FROM myCursor4 INTO @id4
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT @id4
    FETCH PRIOR FROM myCursor4 INTO @id4
END

CLOSE myCursor4
DEALLOCATE myCursor4

--z5*
DECLARE @id5 NVARCHAR(50)
DECLARE myCursor CURSOR FOR
SELECT Название FROM Отделы
WHERE Название_товара = 'Товар1'

OPEN myCursor
FETCH NEXT FROM myCursor INTO @id5
WHILE @@FETCH_STATUS = 0
BEGIN
    -- update the record
    UPDATE Отделы SET Название_товара = 'Товар2' WHERE CURRENT OF myCursor
    
    FETCH NEXT FROM myCursor INTO @id5
END

CLOSE myCursor
DEALLOCATE myCursor
--z6*

DECLARE @id NVARCHAR(50)
DECLARE myCursor CURSOR FOR
SELECT Название FROM Отделы
WHERE Название_товара = 'Товар1'

OPEN myCursor

FETCH NEXT FROM myCursor INTO @id
WHILE @@FETCH_STATUS = 0
BEGIN
	IF @id = 'Товар3'
	BEGIN
		DELETE Отделы WHERE CURRENT OF Primer3;
	END
    FETCH NEXT FROM myCursor INTO @id
END

CLOSE myCursor
DEALLOCATE myCursor