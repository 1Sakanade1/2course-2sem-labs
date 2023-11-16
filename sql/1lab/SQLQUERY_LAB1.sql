SELECT * FROM Customers ;
SELECT * FROM Goods;
SELECT * FROM Orders;

SELECT Наименование_товара FROM Orders WHERE Дата_поставки > '20230601';

SELECT Наименование FROM Goods WHERE Цена BETWEEN 900 AND 1200;

SELECT Заказчик FROM Orders WHERE Наименование_товара = 'Товар1';

SELECT Номер_заказа FROM Orders WHERE Заказчик = 'Заказчик1' ORDER BY Дата_поставки;