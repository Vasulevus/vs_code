USE AFT;
CREATE TABLE customers
				(
					customerid CHAR(5) NOT NULL,
					companyname VARCHAR(40) NOT NULL,
					contactname CHAR(30) NULL,
					[address] VARCHAR(60) NULL,
					city CHAR(15) NULL,
					phone CHAR(24) NULL,
					fax CHAR(24) NULL
				);
CREATE TABLE orders
				(
					orderid INTEGER NOT NULL,
					customerid CHAR(5) NOT NULL,
					orderdate DATE NULL,
					shippeddate DATE NULL,
					freight MONEY NULL,
					shipname VARCHAR(40) NULL,
					shipaddress VARCHAR(60) NULL,
					quantity INTEGER NULL
				);

ALTER TABLE dbo.orders ADD shipregion INT NULL; -- додаємо поле

ALTER TABLE dbo.orders ALTER COLUMN shipregion CHAR(40) NULL; --змінюємо поле


ALTER TABLE dbo.orders DROP COLUMN shipregion; --видаляємо поле


USE AFT;
DROP TABLE IF EXISTS customers, orders; -- видаляємо таблиці, якщо такі існують
CREATE TABLE customers
				(
					customerid CHAR(5) NOT NULL CONSTRAINT custkey PRIMARY KEY, --створюємо primary key
					companyname VARCHAR(40) NOT NULL,
					contactname VARCHAR(40) NULL,
					[address] VARCHAR(60) NULL,
					phone CHAR(24) NULL,
					fax CHAR(24) NULL
				);
GO
CREATE TABLE orders
				(
					orderid INT NOT NULL CONSTRAINT orderkey PRIMARY KEY, --створюємо primary key
					customerid CHAR(5) NOT NULL CONSTRAINT custforeignkey FOREIGN KEY REFERENCES customers(customerid), --створюємо foreign key
					orderdate DATE NOT NULL,
					shippeddate DATE NULL,
					freight MONEY NULL,
					shipname VARCHAR(50) NULL,
					shipaddress VARCHAR(50) NULL,
					quantity INT NULL
				);
GO
ALTER TABLE orders ALTER COLUMN orderdate DATE NULL; -- змінюємо на те, що може бути NULL
go
ALTER TABLE orders ADD CONSTRAINT getrealdate DEFAULT GETDATE() FOR orderdate -- додаємо обмеження у вигляді за замовчуванням.

GO

AlTER TABLE orders ADD CONSTRAINT betweennumber CHECK (quantity BETWEEN 10 AND 30); -- обмеження чисел між верхньою та нижньою межами



sp_helpconstraint orders; -- перевірка обмежень

