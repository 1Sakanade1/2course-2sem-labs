USE MSV_MyBase_3_LAB;
--** 2 ������� **
CREATE TABLE ������
(
	�������� NVARCHAR(20) PRIMARY KEY,
	����������_����������� INT NOT NULL,
	����������_�����_������� INT NOT NULL,
	�����������_����� INT NOT NULL,
)

CREATE TABLE ������
(
	�������� NVARCHAR(20) PRIMARY KEY,
	�������� NVARCHAR(20) NULL,
	����_����������� date NULL
)
	
CREATE TABLE �������
(
	id  INT PRIMARY KEY,
	����� NVARCHAR(20)FOREIGN KEY REFERENCES ������(��������),
	����� NVARCHAR(20)FOREIGN KEY REFERENCES ������(��������)
)





