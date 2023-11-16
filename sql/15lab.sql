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
print '�������� �������';
set @a1 = (SELECT [TEACHER] from inserted);
set @a2 = (SELECT [TEACHER_NAME] from inserted);
set @a3 = (SELECT [GENDER] from inserted);
set @a4 = (SELECT [PULPIT] from inserted)
set @in = @a1 + ' ' + @a2 + ' ' + @a3 + ' ' + @a4;
insert into TR_AUDIT(STMT,TRNAME,CC) values ('INS', 'TR_TEACHER_INS', @in);
return;

insert into TEACHER(TEACHER,TEACHER_NAME,GENDER,PULPIT) values ('����','������ ������� ����������', '�',  '���');

select * from TR_AUDIT

--2
create trigger TR_TEACHER_DEL on TEACHER after DELETE 
as declare @b1 varchar(20),@b2 nvarchar(50),@b3 char(1),@b4 nvarchar(20), @tn varchar(300);
print '�������� ��������';
set @b1 = (SELECT TEACHER from deleted);
set @b2 = (SELECT TEACHER_NAME from deleted);
set @b3 = (SELECT GENDER from deleted);
set @b4 = (SELECT PULPIT from deleted);
set @tn = @b1 + ' ' + @b2 + ' ' + @b3 + ' '+ @b4;
insert into TR_AUDIT(STMT,TRNAME,CC) values ('DEL','TR_TEACHER_DEL', @tn);
return;

delete from TEACHER where TEACHER.TEACHER = '����';
SELECT * from TR_AUDIT

drop  table TR_AUDIT
drop trigger TR_TEACHER_DEL
drop trigger TR_TEACHER_INS
drop trigger TR_TEACHER_UPD


--3
create trigger TR_TEACHER_UPD on TEACHER after UPDATE
as declare @c1 varchar(20), @c2 nvarchar(50),@c3 char(1), @c4 nvarchar(20), @un varchar(300);
print '�������� ����������';
set @c1 = (SELECT TEACHER from inserted);
set @c2 = (SELECT TEACHER_NAME from inserted);
set @c3 = (SELECT GENDER from inserted);
set @c4 = (SELECT PULPIT from inserted);
set @un = @c1 + ' ' + @c2 + ' ' + @c3 + ' ' +@c4;
insert into TR_AUDIT(STMT, TRNAME,CC) values ('UPD', 'TR_TEACHER_UPD',@un);
return;

update TEACHER set TEACHER.PULPIT = '����' where TEACHER.TEACHER = '����'
 
 SELECT * from TR_AUDIT

--4
create trigger TR_TEACHER on TEACHER after INSERT,DELETE,UPDATE
as declare @d1 varchar(20),@d2 nvarchar(50),@d3 char(1), @d4 nvarchar(20), @tt varchar(300);
declare @ins int = (SELECT count(*) from inserted),
		@del int = (SELECT count(*) from deleted);
if @ins > 0 and @del = 0
begin 
	print '������� Insert: ';
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
print '������� Delete';
set @d1 = (SELECT TEACHER from deleted);
set @d2 = (SELECT TEACHER_NAME from deleted);
set @d3 = (SELECT GENDER from deleted);
set @d4 = (SELECt PULPIT from deleted);
set @tt = @d1 + ' ' + @d2 + ' ' + @d3 + ' ' + @d4;
insert into TR_AUDIT(STMT,TRNAME,CC) values ('DEL', 'TR_TEACHER', @tt);
end;
else if @ins > 0 and @del > 0
begin 
print '������� Update';
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

insert into TEACHER values('����','������� ������� �������������', '�' , '���' )
UPDATE TEACHER set TEACHER.PULPIT = '����' where TEACHER.TEACHER = '����'
delete TEACHER where TEACHER.TEACHER = '����'
select * from TR_AUDIT

--5
alter table TEACHER add constraint MCONST CHECK (gender IN ('�', '�'));

update TEACHER set GENDER = '���' where GENDER = '�'

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

insert into TEACHER(TEACHER,TEACHER_NAME,GENDER,PULPIT) values('TEST','TEST','�','��')

delete from TEACHER where TEACHER.TEACHER_NAME = 'TEST'



--7
create trigger AUDITORIUM_TRAN on AUDITORIUM after INSERT,DELETE,UPDATE
as declare @c int = (SELECT sum(AUDITORIUM.AUDITORIUM_CAPACITY) from AUDITORIUM)
if(@c > 320)
	begin 
		raiserror('����� ����������� ��������� �� ����� ���� ������ 300',10,1);	
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
as raiserror('�������� ���������',10,1);
return
delete from TEACHER where TEACHER = '���'

--9
create trigger DDL_TEACHER on database for DDL_DATABASE_LEVEL_EVENTS
as 
declare @t varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(50)');
declare @t1 varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(50)');
declare @t2 varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectType)[1]', 'varchar(50)');
if @t1 = 'TEACHER'
begin
	print '��� �������: ' + @t;
	print '��� �������: ' + @t1;
	print '��� �������: ' + @t2;
	raiserror ('�������� � �������� TEACHER ���������',16,1);
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

create trigger TR_MSV_INS on ������ after insert
as declare @a1 varchar(20),@a2 nvarchar(50), @a3 char(1),@a4 nvarchar(20), @in varchar(300);
print '�������� �������';
set @a1 = (SELECT [��������] from inserted);
set @a2 = (SELECT [��������] from inserted);
set @a3 = (SELECT [����_�����������] from inserted);
set @in = @a1 + ' ' + @a2 + ' ' + @a3
insert into TR_AUDIT(STMT,TRNAME,CC) values ('INS', 'TR_MSV_INS', @in);
return;

insert into ������(��������,��������,����_�����������) values('�����4','��������1','2023-06-03')

select * from TR_AUDIT

--2*
create table TR_AUDIT(
	ID int identity,
	STMT varchar(20) check (STMT in ('INS','DEL','UPD')),
	TRNAME varchar(50),
	CC varchar(300)
)
drop trigger TR_MSV_DEL
create trigger TR_MSV_DEL on ������ after delete
as declare @a1 varchar(20),@a2 nvarchar(50), @a3 char(1),@a4 nvarchar(20), @in varchar(300);
print '�������� ��������';
set @a1 = (SELECT [��������] from deleted);
set @a2 = (SELECT [��������] from deleted);
set @a3 = (SELECT [����_�����������] from deleted);
set @in = @a1 + ' ' + @a2 + ' ' + @a3
insert into TR_AUDIT(STMT,TRNAME,CC) values ('DEL', 'TR_MSV_INS', @in);
return;

delete from ������ where �������� = '�����4'

select * from TR_AUDIT

--3*
create table TR_AUDIT(
	ID int identity,
	STMT varchar(20) check (STMT in ('INS','DEL','UPD')),
	TRNAME varchar(50),
	CC varchar(300)
)

create trigger TR_MSV_UPD on ������ after update
as declare @a1 varchar(20),@a2 nvarchar(50), @a3 char(1),@a4 nvarchar(20), @in varchar(300);
print '�������� ����������';
set @a1 = (SELECT [��������] from inserted);
set @a2 = (SELECT [��������] from inserted);
set @a3 = (SELECT [����_�����������] from inserted);
set @in = @a1 + ' ' + @a2 + ' ' + @a3
insert into TR_AUDIT(STMT,TRNAME,CC) values ('UPD', 'TR_MSV_INS', @in);
return;

update ������ set �������� = '��������3' where �������� = '��������2'
update ������ set �������� = '��������2' where �������� = '��������3'
select * from TR_AUDIT




drop  table TR_AUDIT
drop trigger TR_MSV_DEL
drop trigger TR_MSV_INS
drop trigger TR_MSV_UPD
--4*
create trigger TR_MSV on ������ after INSERT,DELETE,UPDATE
as declare @d1 varchar(20),@d2 nvarchar(50),@d3 varchar(20), @d4 nvarchar(20), @tt varchar(300);
declare @ins int = (SELECT count(*) from inserted),
		@del int = (SELECT count(*) from deleted);
if @ins > 0 and @del = 0
begin 
	print '������� Insert: ';
	set @d1 = (SELECT �������� from inserted);
	set @d2 = (SELECT �������� from inserted);
	set @d3 = (SELECT ����_����������� from inserted);
	set @tt = @d1 + ' ' + @d2 + ' ' + @d3 
	insert into TR_AUDIT(STMT,TRNAME,CC) values ('INS', 'TR_MSV', @tt);
end;
else 
if @ins = 0 and @del > 0
begin
print '������� Delete';
	set @d1 = (SELECT �������� from deleted);
	set @d2 = (SELECT �������� from deleted);
	set @d3 = (SELECT ����_����������� from deleted);
	set @tt = @d1 + ' ' + @d2 + ' ' + @d3 
insert into TR_AUDIT(STMT,TRNAME,CC) values ('DEL', 'TR_MSV', @tt);
end;
else if @ins > 0 and @del > 0
begin 
print '������� Update';
	set @d1 = (SELECT �������� from inserted);
	set @d2 = (SELECT �������� from inserted);
	set @d3 = (SELECT ����_����������� from inserted);
	set @tt = @d1 + ' ' + @d2 + ' ' + @d3	
	
	set @d1 = (SELECT �������� from deleted);
	set @d2 = (SELECT �������� from deleted);
	set @d3 = (SELECT ����_����������� from deleted);
	set @tt = @d1 + ' ' + @d2 + ' ' + @d3 
insert into TR_AUDIT(STMT,TRNAME,CC) values ('UPD','TR_MSV', @tt);
end;
return;

insert into ������ values('�����5','��������5','2023-06-03')
update ������ set �������� = '��������6' where �������� = '��������5'
delete from ������ where �������� =  '��������6'
select * from TR_AUDIT

--5*
alter table ������ add constraint MCONST CHECK (�������� IN ('�����1', '�����2','�����3'));

update ������ set �������� = '���' where �������� = '�����3'

alter table ������ drop constraint MCONST

--6*

create trigger TR_MSV_DEL1 on ������ after DELETE
as print 'TEACHERS_AFTER_DELETE1';
return;

create trigger TR_MSV_DEL2 on ������ after DELETE
as print 'TEACHERS_AFTER_DELETE2';
return;

create trigger TR_MSV_DEL3 on ������ after DELETE
as print 'TEACHERS_AFTER_DELETE3';
return;

select t.name,e.type_desc from sys.triggers t join sys.trigger_events e
on t.object_id = e.object_id
where OBJECT_NAME(t.parent_id) = '������' and e.type_desc = 'DELETE'

exec SP_SETTRIGGERORDER @triggername = 'TR_MSV_DEL3',@order = 'First',@stmttype = 'DELETE';

exec SP_SETTRIGGERORDER @triggername = 'TR_MSV_DEL2',@order = 'Last',@stmttype = 'DELETE';

insert into ������ values('�����4','��������4','2023-06-03')

delete from ������ where �������� = '�����4'

--7*

create trigger MSV_TRAN on ������ after INSERT,DELETE,UPDATE
as declare @c int = (SELECT sum(������.����������_�����_�������) from ������)
if(@c > 300)
	begin 
		raiserror('����� ����� �������� �� ����� ���� >300',10,1);	
		rollback;
end 
return
drop trigger MSVE_TRAN
UPDATE ������ set ����������_�����_������� = 5000 where �������� = '�����1'

DROP trigger TR_MSV_INS
DROP trigger TR_MSV_DEL
DROP trigger TR_MSV_UPD
DROP trigger TR_MSV
DROP trigger TR_MSV_DEL1
DROP trigger TR_MSV_DEL2
DROP trigger TR_MSV_DEL3
DROP trigger MSV_TRAN

--8*
create trigger MSV_INSTEAD_OF on ���������� instead of DELETE
as raiserror('�������� ���������',10,1);
return
delete from ���������� where ����������.��������_�������� = '��������1'

--9*
create trigger DDL_MSV on database for DDL_DATABASE_LEVEL_EVENTS
as 
declare @t varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(50)');
declare @t1 varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(50)');
declare @t2 varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectType)[1]', 'varchar(50)');
if @t1 = '����������'
begin
	print '��� �������: ' + @t;
	print '��� �������: ' + @t1;
	print '��� �������: ' + @t2;
	raiserror ('�������� � �������� TEACHER ���������',16,1);
	rollback;
end;

alter table ���������� drop column ��������_������

drop trigger DDL_MSV on database