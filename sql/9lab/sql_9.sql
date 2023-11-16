use UNIVER

--z1
DECLARE @charVar char(10) = 'Hello';
DECLARE @varcharVar varchar(20) = 'World';
DECLARE @datetimeVar datetime;
DECLARE @timeVar time;
DECLARE @intVar int;
DECLARE @smallintVar smallint;
DECLARE @tinyintVar tinyint;
DECLARE @numericVar numeric(12,5);

SET @datetimeVar = GETDATE();
SET @timeVar = CONVERT(time, '12:30:00');
SET @intVar = 1000;
SET @smallintVar = 50;
SET @tinyintVar = 5;
SET @numericVar = 12345.67890;

SELECT @charVar, @varcharVar;
PRINT @datetimeVar;
PRINT @timeVar;
PRINT @intVar;
PRINT @smallintVar;
PRINT @tinyintVar;
PRINT @numericVar;

-- ����������:
-- Hello   World
-- ��� 11 2023  1:16AM
-- 12:30:00.0000000
-- 1000
-- 50
-- 5
-- 12345.67890


--z2
declare @total integer = (select sum(AUDITORIUM_CAPACITY) from AUDITORIUM),
		@count integer,
		@avg real,
		@countLess integer,
		@percent numeric (12,5)


print 'Total capacity: ' + cast(@total as char)
if @total > 200
begin
set @count = (select count(*) from AUDITORIUM)
set @avg  =  (select avg(AUDITORIUM_CAPACITY) from AUDITORIUM)
set @countLess = (select count(*) from AUDITORIUM where AUDITORIUM_CAPACITY < @avg)
set @percent = cast(@countLess as real) / cast(@count as real)

print 'Count of auditoriums:    ' + cast (@count as char)
print 'Average capacity:        ' + cast (@avg as char)
print 'Count of less than avg:  ' + cast (@countLess as char)
print 'Percent of them:         ' + cast (@percent as char)
end


else 
print 'Total capacity: ' + cast(@total as char)





--z3
DECLARE @rowCount int = @@ROWCOUNT;
DECLARE @version varchar(100) = @@VERSION;
DECLARE @spid int = @@SPID;
DECLARE @error int = @@ERROR;
DECLARE @servername varchar(100) = @@SERVERNAME;
DECLARE @trancount int = @@TRANCOUNT;
DECLARE @fetchStatus int = @@FETCH_STATUS;
DECLARE @nestLevel int = @@NESTLEVEL;

PRINT 'RowCount: ' + cast(@rowCount AS varchar(10));
PRINT 'Version: ' + @version;
PRINT 'SPID: ' + cast(@spid AS varchar(10));
PRINT 'Error: ' + cast(@error AS varchar(10));
PRINT 'ServerName: ' + @servername;
PRINT 'TranCount: ' + cast(@trancount AS varchar(10));
PRINT 'FetchStatus: ' + cast(@fetchStatus AS varchar(10));
PRINT 'NestLevel: ' + cast(@nestLevel AS varchar(10));
--z4
--4_1
declare @z numeric(5, 3), 
		@t float, 
		@x float, 
		@sin numeric(5, 3),
		@4tx numeric(5, 3), 
		@1ex numeric(5, 3)

set @t = 1
set @x = 1.2		-- �������� �� ������ �����

if (@t > @x) 
	set @z = sin(@t) * sin(@t)
else if (@t < @x)
	set @z = 4 * (@t + @x)
else 
	set @z = 1 - exp(@x - 2)

print 'z = ' + cast(@z as char)

--4_2
declare @fullFIO varchar(100) = (select top 1 NAME from STUDENT )

print '������ ���:        ' + @fullFIO

declare @shortFIO varchar(100) = substring(@fullFIO, 0, charindex(' ', @fullFIO)+1) 
							   + substring(@fullFIO, charindex(' ', @fullFIO) + 1, 1) + '. '
							   + substring(@fullFIO, charindex(' ', @fullFIO, charindex(' ', @fullFIO) + 1) + 1, 1) + '.'

print '����������� ���:   ' + @shortFIO

--4_3
declare @student table (��� varchar(100), [���� ��������] varchar(50), ������� integer)

declare @name varchar(100) = (select top 1 s.NAME from STUDENT s where month(s.BDAY) = month(getdate()) + 1)
declare @bday varchar(100) = (select top 1 s.BDAY from STUDENT s where month(s.BDAY) = month(getdate()) + 1)
declare @age int = datediff(year, @bday, getdate())
insert @student values(@name, @bday, @age)

declare @bday2 varchar(100) = (select top 1 s.BDAY from STUDENT s where month(s.BDAY) = month(getdate()) + 1 order by s.IDSTUDENT desc)
declare @name2 varchar(100) = (select top 1 s.NAME from STUDENT s where s.BDAY = @bday2)
declare @age2 int = datediff(year, @bday2, getdate())
insert @student values(@name2, @bday2, @age2)

select * from @student

--4_4
declare @group integer = 6
declare @dow date
set @dow = 
(select top 1 p.PDATE from PROGRESS p 
join STUDENT s on s.IDSTUDENT = p.IDSTUDENT
where s.IDGROUP = @group and p.SUBJECT = '����')
print @dow
--------------------------
declare @dow2 date
set @dow2 = 
(select top 1 p.PDATE from PROGRESS p 
join STUDENT s on s.IDSTUDENT = p.IDSTUDENT
where  p.SUBJECT = '����')
print @dow2

--z5

declare @idgr integer = 14			-- �������� ��� ����� �� ������ ������
declare @count integer = (select count(*) from STUDENT where IDGROUP = @idgr)
declare @avg numeric(5,2)

print '���������� ��������� � ������ - ' + cast(@count as varchar)

if (@count > 7)
begin
set @avg = (select avg (cast (p.NOTE as real)) from STUDENT s join PROGRESS p on s.IDSTUDENT = p.IDSTUDENT)
print '������� ���� � ' + cast(@idgr as varchar) + ' ������ � ' + cast(@avg as varchar)
end
else 
begin
print '���-�� ��������� � ' + cast(@idgr as varchar) + ' ������ � ' + cast(@count as varchar) + ' �������.'
end

--z6
select PROGRESS.IDSTUDENT [�������],
	case
		when NOTE between 9 and 10 then '�������'
		when NOTE between 6 and 8 then '������'
		when NOTE between 4 and 5 then '���������'
		else '�����'
	end ���������
from PROGRESS

group by PROGRESS.IDSTUDENT,
	case 
		when NOTE between 9 and 10 then '�������'
		when NOTE between 6 and 8 then '������'
		when NOTE between 4 and 5 then '���������'
		else '�����'
	end 

--z7
drop table #temp
create table #temp (tid integer, tstr varchar(20), tnum numeric(10,3))

declare @i int = 0
while (@i < 10)
begin
insert into #temp values(@i, '������ �' + cast(@i as varchar), 100*rand())
set @i = @i + 1
end

select * from #temp

--z8
declare @i int = 1

while @i < 100
begin
print @i
set @i = @i * 2
if (@i > 50)
	return
end

--z9
begin try
declare @i int = 1
set @i = @i / 0
end try

begin catch
print 'ERROR!'
print 'Error number:    ' + cast(ERROR_NUMBER() as varchar)
print 'Error severity:  ' + cast(ERROR_SEVERITY() as varchar)
print 'Error line:      ' + cast(ERROR_LINE() as varchar)
print 'Error state:     ' + cast(ERROR_STATE() as varchar)
print 'Error message:   ' + cast(ERROR_MESSAGE() as varchar)
end catch

