ALTER TABLE dbo.Customer_Info
DROP COLUMN F9, F10, F11, F12, F13, F14, F15, F16, F17, F18, F19, F20, F21, F22, F23, F24, F25, F26;

DELETE FROM Customer_Info
WHERE ID IS NULL

ALTER TABLE dbo.Customer_Info
ALTER COLUMN ID nvarchar(50) NOT NULL;

ALTER TABLE dbo.Customer_Info
ADD PRIMARY KEY (ID);

ALTER TABLE Customer_Transactions
DROP COLUMN F6, F7, F8, F9, F10;

ALTER TABLE Orders
ALTER COLUMN OrderID nvarchar(50) NOT NULL;

ALTER TABLE Orders
ALTER COLUMN CustomerID nvarchar(50) NOT NULL;

ALTER TABLE Orders
ALTER COLUMN ItemID nvarchar(50) NOT NULL;

ALTER TABLE Items
DROP COLUMN F6;

ALTER TABLE Items
ALTER COLUMN ItemID nvarchar(50) NOT NULL;

ALTER TABLE Items
DROP COLUMN Price;

ALTER TABLE Items
ADD Profit Int;

UPDATE Items
SET Profit = SellPrice - CostPrice;

-------------------------------------------------------------------------
/*Doanh Thu mỗi đơn hàng*/
SELECT Orders.OrderID, MONTH(Orders.TransactionDate) AS Month, SUM(Items.Profit) AS Revenue
FROM Orders
JOIN Items
ON Orders.ItemID = Items.ItemID
GROUP BY Orders.OrderID, MONTH(Orders.TransactionDate)
ORDER BY Revenue DESC

/*Tổng doanh thu*/
WITH A AS(
SELECT Orders.OrderID, COUNT(*) AS Num_Order, SUM(Items.Profit) AS Revenue
FROM Orders
JOIN Items
ON Orders.ItemID = Items.ItemID
GROUP BY Orders.OrderID)
SELECT SUM(A.Num_Order) AS Total_Order, SUM(A.Revenue) AS Total
FROM A

/*Doanh thu tháng 1*/
WITH A AS(
SELECT Orders.OrderID, MONTH(Orders.TransactionDate) AS Month, COUNT(*) AS Num_Order, SUM(Items.Profit) AS Revenue
FROM Orders
JOIN Items
ON Orders.ItemID = Items.ItemID
GROUP BY Orders.OrderID, MONTH(Orders.TransactionDate)
HAVING MONTH(Orders.TransactionDate) = 12)
SELECT SUM(A.Num_Order) AS Jan_Num_Order, SUM(A.Revenue) AS Jan_Revenue
FROM A

SELECT A.* INTO Traffic
	FROM(	
		SELECT * FROM [2020-01]
		UNION ALL
		SELECT * FROM [2020-02]
		UNION ALL 
		SELECT * FROM [2020-03]
		UNION ALL
		SELECT * FROM [2020-04]
		UNION ALL 
		SELECT * FROM [2020-05]
		UNION ALL 
		SELECT * FROM [2020-06]
		UNION ALL 
		SELECT * FROM [2020-07]
		UNION ALL 
		SELECT * FROM [2020-08]
		UNION ALL 
		SELECT * FROM [2020-09]
		UNION ALL 
		SELECT * FROM [2020-10]
		UNION ALL 
		SELECT * FROM [2020-11]
		UNION ALL 
		SELECT * FROM [2020-12]) A

ALTER TABLE Traffic
ADD Month int;

UPDATE Traffic
SET Month = MONTH([Posted On (DD/MM/YYYY)])

SELECT * FROM Traffic

SELECT SUM(users) as Num_user, SUM(uniquePageviews) as Num_UPV, SUM(pageviews) as Num_PV
FROM Traffic
WHERE month = 12

ALTER TABLE Traffic
ADD Product nvarchar(255);

select * from Traffic
WHERE [Page URL] IS NULL

DELETE FROM Traffic
WHERE [Page URL] IS NULL

UPDATE Traffic
SET Product = SUBSTRING([Page URL],9,50)

UPDATE Traffic
SET Product = SUBSTRING(Product,CHARINDEX('/',Product)+1,50)

SELECT * FROM Items

SELECT * FROM Traffic
WHERE CHARINDEX('/',Product) = 0

/* Product mang lại pageview cao nhất*/
SELECT TOP 10
	Product, sum(pageviews) as PageViews
FROM Traffic
group by Product
ORDER BY sum(pageviews) DESC

/*Top 10 Product mang lại doanh thu cao nhất*/
SELECT TOP 10
	Orders.ItemID, Items.Product, SUM(Items.Profit) AS Revenue
FROM Orders
JOIN Items
ON Orders.ItemID = Items.ItemID
GROUP BY Orders.ItemID, Items.Product
ORDER BY SUM(Items.Profit) DESC

/*Những Product ko mang lại lợi nhuận thậm chí còn lỗ*/
SELECT TOP 10
	Orders.ItemID, SUM(Items.Profit) AS Revenue
FROM Orders
JOIN Items
ON Orders.ItemID = Items.ItemID
GROUP BY Orders.ItemID
ORDER BY SUM(Items.Profit) ASC

/*Những hãng không mang lại lợi nhuận*/
SELECT 
	Traffic.Brand, SUM(Items.Profit) AS Revenue
FROM Traffic
JOIN Items
ON Traffic.Product = Items.Product
GROUP BY Traffic.Brand
HAVING SUM(Items.Profit) <= 0
ORDER BY SUM(Items.Profit) DESC

select * from Customer_Info
