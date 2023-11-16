--z1
SET nocount on

IF exists(SELECT * FROM SYS.OBJECTS
		  WHERE OBJECT_ID = object_id(N'DBO.NewT'))
DROP TABLE NewT;


DECLARE @c int, @flag char = 'c';

SET IMPLICIT_TRANSACTIONS ON --включили режим неявной транзакции
CREATE TABLE NewT
(
	K int
)
	INSERT NewT values (1),
					(2),
					(3);

	SET @c = (SELECT count(*) FROM NewT);

	PRINT 'Количество строк в таблице NewT: ' + cast(@c as varchar(2));
	IF  @flag = 'c' COMMIT;
	ELSE ROLLBACK;
SET IMPLICIT_TRANSACTIONS OFF --выключаем режим неявной транзакции

IF exists(SELECT * FROM SYS.OBJECTS
		  WHERE OBJECT_ID = object_id(N'DBO.NewT'))
PRINT 'Таблица NewT есть';
ELSE PRINT 'Таблицы NewT нет'

--z2
USE UNIVER
DECLARE @trcount int
BEGIN TRY
	BEGIN TRAN
		DELETE AUDITORIUM_TYPE WHERE AUDITORIUM_TYPENAME = 'Новая лекционная';
		--DELETE AUDITORIUM_TYPE WHERE AUDITORIUM_TYPENAME = 'Самая новая лекционная';
		--INSERT AUDITORIUM_TYPE VALUES ('ЛК-Н', 'Новая лекционная');
		INSERT AUDITORIUM_TYPE VALUES ('ЛК-Н', 'Новая лекционная');
		--INSERT AUDITORIUM_TYPE VALUES ('ЛК-С', 'Самая новая лекционная');
		COMMIT TRAN;
	END TRY
BEGIN CATCH 
		PRINT 'Ошибка: ' + case
							WHEN error_number() = 2627 and patindex('%AUDITORIUM_TYPE_PK%', error_message()) > 0
								THEN 'дублирование типа аудитории'
						   else 'неизвестная ошибка: ' + cast(error_number() as varchar(5)) + error_message()
						   end;
	SET @trcount = @@TRANCOUNT
	PRINT @trcount
	IF @@TRANCOUNT > 0 ROLLBACK TRAN;
END CATCH;

--z3
USE UNIVER;
DECLARE @point varchar(32);
BEGIN TRY
	BEGIN TRAN				--начало явной транзакции
		DELETE AUDITORIUM_TYPE WHERE AUDITORIUM_TYPENAME = 'Новая лекционная';
		SET @point = 'p1'; SAVE TRAN @point;
		
		INSERT AUDITORIUM_TYPE VALUES ('ЛК-Н', 'Новая лекционная');
		SET @point = 'p2'; SAVE TRAN @point;
		
		INSERT AUDITORIUM_TYPE VALUES ('ЛК-Н', 'Новая лекционная');
		--INSERT AUDITORIUM_TYPE VALUES ('ЛК-НН', 'НоваяНовая лекционная');
	COMMIT TRAN;
END TRY
BEGIN CATCH 
		PRINT 'Ошибка: ' + CASE 
						   WHEN error_number() = 2627 and patindex('%AUDITORIUM_TYPE_PK%', error_message()) > 0
							THEN 'дублирование типа аудитории'
							ELSE 'неизвестная ошибка: ' + cast(error_number() as varchar(5)) + error_message()
						   end;
	IF @@TRANCOUNT > 0
		begin 
			print 'контрольная точка: ' + @point;
			rollback tran @point;		--откат к контрольной точке
			commit tran;				--фиксация изменений, выпоолненных до контрольной точки
		end
END CATCH

--z4 z5 z6 z7 отдельно

--z8
BEGIN TRAN -- внешняя
	INSERT AUDITORIUM_TYPE VALUES ('ХТПС', 'Химики тепло-приводные сильные');
	SELECT * FROM AUDITORIUM_TYPE WHERE AUDITORIUM_TYPE = 'ХТПС'
	BEGIN TRAN -- внутренняя
		UPDATE AUDITORIUM SET AUDITORIUM = '336-1' WHERE AUDITORIUM_TYPE = 'ХТПС'
		COMMIT -- внутренняя commit ток внутри
		IF @@TRANCOUNT > 0 ROLLBACK --внешняя отмена внутренней
	SELECT
		(SELECT COUNT(*) FROM AUDITORIUM WHERE AUDITORIUM_TYPE='ХТПС') 'AUDIT',
		(SELECT COUNT(*) FROM AUDITORIUM_TYPE  WHERE AUDITORIUM_TYPE='ХТПС') 'TYPE'
