-- PART 1
SELECT X.Title -- P.PubID, P.Publisher, P.Year, X.Title
FROM a37g3.dbo.Publication P
LEFT JOIN (
    SELECT B.Title, B.PubID
    FROM a37g3.dbo.Books B
    UNION
    SELECT CONCAT(M.Title, ' ISSUE NO. ', M.Issue), M.PubID
    FROM a37g3.dbo.Magazines M
) AS X ON P.PubID = X.PubID
WHERE P.Publisher = 'Nanyang Publisher Company'


-- PART 2
SELECT X.Title, C.COUNT
FROM a37g3.dbo.Publication P
         LEFT JOIN (SELECT B.Title, B.PubID
                    FROM a37g3.dbo.Books B
                    UNION
                    SELECT CONCAT(M.Title, ' ISSUE NO. ', M.Issue) AS Title, M.PubID
                    FROM a37g3.dbo.Magazines M) AS X ON P.PubID = X.PubID
         JOIN (SELECT S.PubID, COUNT(*) AS COUNT
               FROM a37g3.dbo.StockInBookStore S
               GROUP BY S.PubID) AS C ON C.PubID = X.PubID
WHERE P.Publisher = 'Nanyang Publisher Company'
ORDER BY C.COUNT;
