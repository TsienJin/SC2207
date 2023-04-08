SELECT ROUND(AVG(ph.Price),2) AS AVGPRICE
FROM a37g3.dbo.PriceHistory ph
WHERE ph.PubID IN (
    SELECT b.PubID
    FROM a37g3.dbo.Books b
    WHERE b.Title = 'Harry Porter Finale'
    ) AND
    ph.StartDate <= '2022-08-31' AND
    ph.EndDate >= '2022-08-01'