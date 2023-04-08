WITH Sold AS ( -- Pub IDs that have been sold before
    SELECT DISTINCT i.PubID FROM a37g3.dbo.ItemsInOrder i
    JOIN a37g3.dbo.StockInBookStore bs ON bs.StockID = i.StockID
)
SELECT P.Publisher, X.Title
FROM a37g3.dbo.Publication P
LEFT JOIN ( -- Get name and issue of publication
    SELECT B.Title, B.PubID
    FROM a37g3.dbo.Books B
    UNION
    SELECT CONCAT(M.Title, ' ISSUE NO. ', M.Issue), M.PubID
    FROM a37g3.dbo.Magazines M
) AS X ON P.PubID = X.PubID
WHERE P.PubID NOT IN ( -- Exclusion of sold
    SELECT s.PubID FROM Sold s
    )


SELECT DISTINCT i.PubID FROM a37g3.dbo.ItemsInOrder i
JOIN a37g3.dbo.StockInBookStore bs ON bs.StockID = i.StockID
ORDER BY i.PubID