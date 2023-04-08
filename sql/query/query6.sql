-- QUERY for question
SELECT TOP 1 o.BookstoreID, ROUND(SUM(o.ItemQty*o.ItemPrice), 2) as Revenue
FROM a37g3.dbo.ItemsInOrder o
INNER JOIN a37g3.dbo.Orders ord ON o.OrderID = ord.OrderID
WHERE ord.DateTime <= '2022-08-31' AND ord.DateTime >= '2022-08-01'
GROUP BY o.BookstoreID
ORDER BY Revenue DESC
