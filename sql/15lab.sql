use UNIVER
--1
create table TR_AUDIT(
	ID int identity,
	STMT varchar(20) check (STMT in ('INS','DEL','UPD')),
	TRNAME varchar(50),
	CC varchar(300)
)

create trigger TR_TEACHER_INS on TEACHER after insert
as declare @a1 varchar(20),@a2 nvarchar(50), @a3 char(1),@a4 nvarchar(20), @in varchar(300);
print 'Операция вставки';
set @a1 = (SELECT [TEACHER] from inserted);
set @a2 = (SELECT [TEACHER_NAME] from inserted);
set @a3 = (SELECT [GENDER] from inserted);
set @a4 = (SELECT [PULPIT] from inserted)
set @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' ' + @a4;
insert into TR_AUDIT(STMT,TRNAME,CC) values ('INS', 'TR_TEACHER_INS', @in);
return;

insert into TEACHER(TEACHER,TEACHER_NAME,GENDER,PULPIT) values ('БСНК','Буснюк Николай Николаевич', 'м',  'ХПД');

select * from TR_AUDIT

--2
create trigger TR_TEACHER_DEL on TEACHER after DELETE 
as declare @b1 varchar(20),@b2 nvarchar(50),@b3 char(1),@b4 nvarchar(20), @tn varchar(300);
print 'Операция удаления';
set @b1 = (SELECT TEACHER from deleted);
set @b2 = (SELECT TEACHER_NAME from deleted);
set @b3 = (SELECT GENDER from deleted);
set @b4 = (SELECT PULPIT from deleted);
set @tn = @b1 + ' ' + @b2 + ' ' + @b3 + ' '+ @b4;
insert into TR_AUDIT(STMT,TRNAME,CC) values ('DEL','TR_TEACHER_DEL', @tn);
return;

delete from TEACHER where TEACHER.TEACHER = 'КРЛВ';
SELECT * from TR_AUDIT

drop  table TR_AUDIT
drop trigger TR_TEACHER_DEL
drop trigger TR_TEACHER_INS
drop trigger TR_TEACHER_UPD


--3
create trigger TR_TEACHER_UPD on TEACHER after UPDATE
as declare @c1 varchar(20), @c2 nvarchar(50),@c3 char(1), @c4 nvarchar(20), @un varchar(300);
print 'Операция обновления';
set @c1 = (SELECT TEACHER from inserted);
set @c2 = (SELECT TEACHER_NAME from inserted);
set @c3 = (SELECT GENDER from inserted);
set @c4 = (SELECT PULPIT from inserted);
set @un = @c1 + ' ' + @c2 + ' ' + @c3 + ' ' +@c4;
insert into TR_AUDIT(STMT, TRNAME,CC) values ('UPD', 'TR_TEACHER_UPD',@un);
return;

update TEACHER set TEACHER.PULPIT = 'ИСиТ' where TEACHER.TEACHER = 'БСНК'
 
 SELECT * from TR_AUDIT

--4
create trigger TR_TEACHER on TEACHER after INSERT,DELETE,UPDATE
as declare @d1 varchar(20),@d2 nvarchar(50),@d3 char(1), @d4 nvarchar(20), @tt varchar(300);
declare @ins int = (SELECT count(*) from inserted),
		@del int = (SELECT count(*) from deleted);
if @ins > 0 and @del = 0
begin 
	print 'Событие Insert: ';
	set @d1 = (SELECT TEACHER from inserted);
	set @d2 = (SELECT TEACHER_NAME from inserted);
	set @d3 = (SELECT GENDER from inserted);
	set @d4 = (SELECT PULPIT from inserted);
	set @tt = @d1 + ' ' + @d2 + ' ' + @d3 + ' ' + @d4;
	insert into TR_AUDIT(STMT,TRNAME,CC) values ('INS', 'TR_TEACHER', @tt);
end;
else 
if @ins = 0 and @del > 0
begin
print 'Событие Delete';
set @d1 = (SELECT TEACHER from deleted);
set @d2 = (SELECT TEACHER_NAME from deleted);
set @d3 = (SELECT GENDER from deleted);
set @d4 = (SELECt PULPIT from deleted);
set @tt = @d1 + ' ' + @d2 + ' ' + @d3 + ' ' + @d4;
insert into TR_AUDIT(STMT,TRNAME,CC) values ('DEL', 'TR_TEACHER', @tt);
end;
else if @ins > 0 and @del > 0
begin 
print 'Событие Update';
set @d1 = (SELECt TEACHER from inserted);
set @d2 = (SELECT TEACHER_NAME from inserted);
set @d3 = (SELECT GENDER from inserted);
set @d4 = (SELECT PULPIT from inserted);
set @tt = @d1 + ' ' + @d2 + ' ' + @d3 + ' ' +@d4;
set @d1 = (SELECT TEACHER from deleted);
set @d2 = (SELECT TEACHER_NAME from deleted);
set @d3 = (SELECT GENDER from deleted);
set @d4 = (SELECT PULPIT from deleted);
set @tt = @d1 + ' ' + @d2 + ' ' + @d3 + ' ' +@d4 + ' ' + @tt;
insert into TR_AUDIT(STMT,TRNAME,CC) values ('UPD','TR_TEACHER', @tt);
end;
return;

insert into TEACHER values('БЛНВ','Блинова Евгения Александровна', 'ж' , 'ХПД' )
UPDATE TEACHER set TEACHER.PULPIT = 'ИСиТ' where TEACHER.TEACHER = 'БЛНВ'
delete TEACHER where TEACHER.TEACHER = 'БЛНВ'
select * from TR_AUDIT

--5
alter table TEACHER add constraint MCONST CHECK (gender IN ('м', 'ж'));

update TEACHER set GENDER = 'ААА' where GENDER = 'м'

--6
create trigger TR_TEACHER_DEL1 on TEACHER after DELETE
as print 'TEACHERS_AFTER_DELETE1';
return;

create trigger TR_TEACHER_DEL2 on TEACHER after DELETE
as print 'TEACHERS_AFTER_DELETE2';
return;

create trigger TR_TEACHER_DEL3 on TEACHER after DELETE
as print 'TEACHERS_AFTER_DELETE3';
return;

select t.name,e.type_desc from sys.triggers t join sys.trigger_events e
on t.object_id = e.object_id
where OBJECT_NAME(t.parent_id) = 'TEACHER' and e.type_desc = 'DELETE'

exec SP_SETTRIGGERORDER @triggername = 'TR_TEACHER_DEL3',@order = 'First',@stmttype = 'DELETE';

exec SP_SETTRIGGERORDER @triggername = 'TR_TEACHER_DEL2',@order = 'Last',@stmttype = 'DELETE';

insert into TEACHER(TEACHER,TEACHER_NAME,GENDER,PULPIT) values('TEST','TEST','м','ОХ')

delete from TEACHER where TEACHER.TEACHER_NAME = 'TEST'



--7
create trigger AUDITORIUM_TRAN on AUDITORIUM after INSERT,DELETE,UPDATE
as declare @c int = (SELECT sum(AUDITORIUM.AUDITORIUM_CAPACITY) from AUDITORIUM)
if(@c > 320)
	begin 
		raiserror('Общая вместимость аудиторий не может быть больше 300',10,1);	
		rollback;
end 
return
drop trigger AUDITORIUM_TRAN
UPDATE AUDITORIUM set AUDITORIUM_CAPACITY = 15 where AUDITORIUM = '206-1'

DROP trigger TR_TEACHER_INS
DROP trigger TR_TEACHER_DEL
DROP trigger TR_TEACHER_UPD
DROP trigger TR_TEACHER
DROP trigger TR_TEACHER_DEL1
DROP trigger TR_TEACHER_DEL2
DROP trigger TR_TEACHER_DEL3
DROP trigger AUDITORIUM_TRAN
--8
create trigger TEACHER_INSTEAD_OF on TEACHER instead of DELETE
as raiserror('Удаление запрещено',10,1);
return
delete from TEACHER where TEACHER = 'ЖЛК'

--9
create trigger DDL_TEACHER on database for DDL_DATABASE_LEVEL_EVENTS
as 
declare @t varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(50)');
declare @t1 varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(50)');
declare @t2 varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectType)[1]', 'varchar(50)');
if @t1 = 'TEACHER'
begin
	print 'Тип события: ' + @t;
	print 'Имя объекта: ' + @t1;
	print 'Тип объекта: ' + @t2;
	raiserror ('Операции с таблицей TEACHER запрещены',16,1);
	rollback;
end;

alter table TEACHER Drop column TEACHER_NAME;

drop trigger DDL_TEACHER on database


---10**
use MSV_MyBase_2
--1*
create table TR_AUDIT(
	ID int identity,
	STMT varchar(20) check (STMT in ('INS','DEL','UPD')),
	TRNAME varchar(50),
	CC varchar(300)
)

create trigger TR_MSV_INS on Товары after insert
as declare @a1 varchar(20),@a2 nvarchar(50), @a3 char(1),@a4 nvarchar(20), @in varchar(300);
print 'Операция вставки';
set @a1 = (SELECT [Название] from inserted);
set @a2 = (SELECT [Описание] from inserted);
set @a3 = (SELECT [Дата_поступления] from inserted);
set @in = @a1 + ' ' + @a2 + ' ' + @a3
insert into TR_AUDIT(STMT,TRNAME,CC) values ('INS', 'TR_MSV_INS', @in);
return;

insert into Товары(Название,Описание,Дата_поступления) values('Товар4','Описание1','2023-06-03')

select * from TR_AUDIT

--2*
create table TR_AUDIT(
	ID int identity,
	STMT varchar(20) check (STMT in ('INS','DEL','UPD')),
	TRNAME varchar(50),
	CC varchar(300)
)
drop trigger TR_MSV_DEL
create trigger TR_MSV_DEL on Товары after delete
as declare @a1 varchar(20),@a2 nvarchar(50), @a3 char(1),@a4 nvarchar(20), @in varchar(300);
print 'Операция удаления';
set @a1 = (SELECT [Название] from deleted);
set @a2 = (SELECT [Описание] from deleted);
set @a3 = (SELECT [Дата_поступления] from deleted);
set @in = @a1 + ' ' + @a2 + ' ' + @a3
insert into TR_AUDIT(STMT,TRNAME,CC) values ('DEL', 'TR_MSV_INS', @in);
return;

delete from Товары where Название = 'Товар4'

select * from TR_AUDIT

--3*
create table TR_AUDIT(
	ID int identity,
	STMT varchar(20) check (STMT in ('INS','DEL','UPD')),
	TRNAME varchar(50),
	CC varchar(300)
)

create trigger TR_MSV_UPD on Товары after update
as declare @a1 varchar(20),@a2 nvarchar(50), @a3 char(1),@a4 nvarchar(20), @in varchar(300);
print 'Операция обновления';
set @a1 = (SELECT [Название] from inserted);
set @a2 = (SELECT [Описание] from inserted);
set @a3 = (SELECT [Дата_поступления] from inserted);
set @in = @a1 + ' ' + @a2 + ' ' + @a3
insert into TR_AUDIT(STMT,TRNAME,CC) values ('UPD', 'TR_MSV_INS', @in);
return;

update Товары set Описание = 'Описание3' where Описание = 'Описание2'
update Товары set Описание = 'Описание2' where Описание = 'Описание3'
select * from TR_AUDIT




drop  table TR_AUDIT
drop trigger TR_MSV_DEL
drop trigger TR_MSV_INS
drop trigger TR_MSV_UPD
--4*
create trigger TR_MSV on Товары after INSERT,DELETE,UPDATE
as declare @d1 varchar(20),@d2 nvarchar(50),@d3 varchar(20), @d4 nvarchar(20), @tt varchar(300);
declare @ins int = (SELECT count(*) from inserted),
		@del int = (SELECT count(*) from deleted);
if @ins > 0 and @del = 0
begin 
	print 'Событие Insert: ';
	set @d1 = (SELECT Название from inserted);
	set @d2 = (SELECT Описание from inserted);
	set @d3 = (SELECT Дата_поступления from inserted);
	set @tt = @d1 + ' ' + @d2 + ' ' + @d3 
	insert into TR_AUDIT(STMT,TRNAME,CC) values ('INS', 'TR_MSV', @tt);
end;
else 
if @ins = 0 and @del > 0
begin
print 'Событие Delete';
	set @d1 = (SELECT Название from deleted);
	set @d2 = (SELECT Описание from deleted);
	set @d3 = (SELECT Дата_поступления from deleted);
	set @tt = @d1 + ' ' + @d2 + ' ' + @d3 
insert into TR_AUDIT(STMT,TRNAME,CC) values ('DEL', 'TR_MSV', @tt);
end;
else if @ins > 0 and @del > 0
begin 
print 'Событие Update';
	set @d1 = (SELECT Название from inserted);
	set @d2 = (SELECT Описание from inserted);
	set @d3 = (SELECT Дата_поступления from inserted);
	set @tt = @d1 + ' ' + @d2 + ' ' + @d3	
	
	set @d1 = (SELECT Название from deleted);
	set @d2 = (SELECT Описание from deleted);
	set @d3 = (SELECT Дата_поступления from deleted);
	set @tt = @d1 + ' ' + @d2 + ' ' + @d3 
insert into TR_AUDIT(STMT,TRNAME,CC) values ('UPD','TR_MSV', @tt);
end;
return;

insert into Товары values('Товар5','Описание5','2023-06-03')
update Товары set Описание = 'Описание6' where Описание = 'Описание5'
delete from Товары where Описание =  'Описание6'
select * from TR_AUDIT

--5*
alter table Товары add constraint MCONST CHECK (Название IN ('Товар1', 'Товар2','Товар3'));

update Товары set Название = 'ААА' where Название = 'Товар3'

alter table Товары drop constraint MCONST

--6*

create trigger TR_MSV_DEL1 on Товары after DELETE
as print 'TEACHERS_AFTER_DELETE1';
return;

create trigger TR_MSV_DEL2 on Товары after DELETE
as print 'TEACHERS_AFTER_DELETE2';
return;

create trigger TR_MSV_DEL3 on Товары after DELETE
as print 'TEACHERS_AFTER_DELETE3';
return;

select t.name,e.type_desc from sys.triggers t join sys.trigger_events e
on t.object_id = e.object_id
where OBJECT_NAME(t.parent_id) = 'Товары' and e.type_desc = 'DELETE'

exec SP_SETTRIGGERORDER @triggername = 'TR_MSV_DEL3',@order = 'First',@stmttype = 'DELETE';

exec SP_SETTRIGGERORDER @triggername = 'TR_MSV_DEL2',@order = 'Last',@stmttype = 'DELETE';

insert into Товары values('Товар4','Описание4','2023-06-03')

delete from Товары where Название = 'Товар4'

--7*

create trigger MSV_TRAN on Отделы after INSERT,DELETE,UPDATE
as declare @c int = (SELECT sum(Отделы.Предельная_норма_расхода) from Отделы)
if(@c > 300)
	begin 
		raiserror('Общая сумма расходов не может быть >300',10,1);	
		rollback;
end 
return
drop trigger MSVE_TRAN
UPDATE Отделы set Предельная_норма_расхода = 5000 where Название = 'Отдел1'

DROP trigger TR_MSV_INS
DROP trigger TR_MSV_DEL
DROP trigger TR_MSV_UPD
DROP trigger TR_MSV
DROP trigger TR_MSV_DEL1
DROP trigger TR_MSV_DEL2
DROP trigger TR_MSV_DEL3
DROP trigger MSV_TRAN

--8*
create trigger MSV_INSTEAD_OF on Поставщики instead of DELETE
as raiserror('Удаление запрещено',10,1);
return
delete from Поставщики where Поставщики.Название_компании = 'Компания1'

--9*
create trigger DDL_MSV on database for DDL_DATABASE_LEVEL_EVENTS
as 
declare @t varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(50)');
declare @t1 varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(50)');
declare @t2 varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectType)[1]', 'varchar(50)');
if @t1 = 'Поставщики'
begin
	print 'Тип события: ' + @t;
	print 'Имя объекта: ' + @t1;
	print 'Тип объекта: ' + @t2;
	raiserror ('Операции с таблицей TEACHER запрещены',16,1);
	rollback;
end;

alter table Поставщики drop column Название_товара

drop trigger DDL_MSV on database