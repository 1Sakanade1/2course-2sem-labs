USE MSV_MyBase_2;

CREATE TABLE Отделы
(
	Название NVARCHAR(20) PRIMARY KEY,
	Количество_сотрудников INT NOT NULL,
	Предельная_норма_расхода INT NOT NULL,
	Потраченная_сумма INT NOT NULL,
)

CREATE TABLE Товары
(
	Название NVARCHAR(20) PRIMARY KEY,
	Описание NVARCHAR(20) NULL,
	Дата_поступления date NULL
)
	
CREATE TABLE Покупки
(
	id  INT PRIMARY KEY,
	Отдел NVARCHAR(20) REFERENCES Отделы(Название),
	Товар NVARCHAR(20) REFERENCES Товары(Название)
)





