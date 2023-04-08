INSERT INTO a37g3.dbo.Books (PubID, Title)
SELECT P.PubID, 'Book Title ' + CAST(P.PubID AS VARCHAR(10))
FROM a37g3.dbo.Publication P
WHERE NOT EXISTS (SELECT 1 FROM a37g3.dbo.Books B WHERE B.PubID = P.PubID);