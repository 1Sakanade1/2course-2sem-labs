--z1
SET nocount on

IF exists(SELECT * FROM SYS.OBJECTS
		  WHERE OBJECT_ID = object_id(N'DBO.NewT'))
DROP TABLE NewT;


DECLARE @c int, @flag char = 'c';

SET IMPLICIT_TRANSACTIONS ON --�������� ����� ������� ����������
CREATE TABLE NewT
(
	K int
)
	INSERT NewT values (1),
					(2),
					(3);

	SET @c = (SELECT count(*) FROM NewT);

	PRINT '���������� ����� � ������� NewT: ' + cast(@c as varchar(2));
	IF  @flag = 'c' COMMIT;
	ELSE ROLLBACK;
SET IMPLICIT_TRANSACTIONS OFF --��������� ����� ������� ����������

IF exists(SELECT * FROM SYS.OBJECTS
		  WHERE OBJECT_ID = object_id(N'DBO.NewT'))
PRINT '������� NewT ����';
ELSE PRINT '������� NewT ���'

--z2
USE UNIVER
DECLARE @trcount int
BEGIN TRY
	BEGIN TRAN
		DELETE AUDITORIUM_TYPE WHERE AUDITORIUM_TYPENAME = '����� ����������';
		--DELETE AUDITORIUM_TYPE WHERE AUDITORIUM_TYPENAME = '����� ����� ����������';
		--INSERT AUDITORIUM_TYPE VALUES ('��-�', '����� ����������');
		INSERT AUDITORIUM_TYPE VALUES ('��-�', '����� ����������');
		--INSERT AUDITORIUM_TYPE VALUES ('��-�', '����� ����� ����������');
		COMMIT TRAN;
	END TRY
BEGIN CATCH 
		PRINT '������: ' + case
							WHEN error_number() = 2627 and patindex('%AUDITORIUM_TYPE_PK%', error_message()) > 0
								THEN '������������ ���� ���������'
						   else '����������� ������: ' + cast(error_number() as varchar(5)) + error_message()
						   end;
	SET @trcount = @@TRANCOUNT
	PRINT @trcount
	IF @@TRANCOUNT > 0 ROLLBACK TRAN;
END CATCH;

--z3
USE UNIVER;
DECLARE @point varchar(32);
BEGIN TRY
	BEGIN TRAN				--������ ����� ����������
		DELETE AUDITORIUM_TYPE WHERE AUDITORIUM_TYPENAME = '����� ����������';
		SET @point = 'p1'; SAVE TRAN @point;
		
		INSERT AUDITORIUM_TYPE VALUES ('��-�', '����� ����������');
		SET @point = 'p2'; SAVE TRAN @point;
		
		INSERT AUDITORIUM_TYPE VALUES ('��-�', '����� ����������');
		--INSERT AUDITORIUM_TYPE VALUES ('��-��', '���������� ����������');
	COMMIT TRAN;
END TRY
BEGIN CATCH 
		PRINT '������: ' + CASE 
						   WHEN error_number() = 2627 and patindex('%AUDITORIUM_TYPE_PK%', error_message()) > 0
							THEN '������������ ���� ���������'
							ELSE '����������� ������: ' + cast(error_number() as varchar(5)) + error_message()
						   end;
	IF @@TRANCOUNT > 0
		begin 
			print '����������� �����: ' + @point;
			rollback tran @point;		--����� � ����������� �����
			commit tran;				--�������� ���������, ������������ �� ����������� �����
		end
END CATCH

--z4 z5 z6 z7 ��������

--z8
BEGIN TRAN -- �������
	INSERT AUDITORIUM_TYPE VALUES ('����', '������ �����-��������� �������');
	SELECT * FROM AUDITORIUM_TYPE WHERE AUDITORIUM_TYPE = '����'
	BEGIN TRAN -- ����������
		UPDATE AUDITORIUM SET AUDITORIUM = '336-1' WHERE AUDITORIUM_TYPE = '����'
		COMMIT -- ���������� commit ��� ������
		IF @@TRANCOUNT > 0 ROLLBACK --������� ������ ����������
	SELECT
		(SELECT COUNT(*) FROM AUDITORIUM WHERE AUDITORIUM_TYPE='����') 'AUDIT',
		(SELECT COUNT(*) FROM AUDITORIUM_TYPE  WHERE AUDITORIUM_TYPE='����') 'TYPE'
