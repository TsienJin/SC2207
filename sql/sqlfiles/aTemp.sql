SELECT x.ComplaintsID
FROM (
    SELECT b.ComplaintsID
    FROM a37g3.dbo.ComplaintsOnBookstore b
    UNION
    SELECT o.ComplaintsID
    FROM a37g3.dbo.ComplaintsOnOrders o
     ) AS x

