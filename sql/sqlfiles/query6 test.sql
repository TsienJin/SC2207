SELECT (o.ItemPrice*o.ItemQty) AS REVENUE
FROM a37g3.dbo.ItemsInOrder o
INNER JOIN a37g3.dbo.Orders ord ON o.OrderID = ord.OrderID
WHERE ord.DateTime <= '2022-08-31' AND
      ord.DateTime >= '2022-08-01' AND
      o.BookstoreID = 3

