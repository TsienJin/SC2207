-- SELECT ROUND(AVG(ph.Price),2) AS AVGPRICE
-- FROM a37g3.dbo.PriceHistory ph
-- WHERE ph.PubID IN (
--     SELECT b.PubID
--     FROM a37g3.dbo.Books b
--     WHERE b.Title = 'Harry Porter Finale'
--     ) AND
--     ph.StartDate <= '2022-08-31' AND
--     ph.EndDate >= '2022-08-01'



DECLARE @start AS date;
DECLARE @end AS date;

SET @start = '2022-08-01';
SET @end = '2022-08-31';


WITH numPriceDays AS (
    SELECT *,
        CASE
            -- CASE when price starts before range and ends in range
            WHEN (ph.EndDate >= @start AND ph.EndDate <= @end AND ph.StartDate <= @start)
                THEN DATEDIFF(day, @start, ph.EndDate) + 1

            -- CASE when price starts in range and ends out of range
            WHEN (ph.StartDate <= @end AND ph.StartDate >= @start AND ph.EndDate >= @end)
                THEN DATEDIFF(day, ph.StartDate, @end) + 1

            -- CASE when price starts and ends out of range
            WHEN (ph.StartDate <= @start AND ph.EndDate >= @end)
                THEN DATEDIFF(day, @start, @end) + 1

            -- CASE when start and end within range
            WHEN (ph.EndDate >= @start AND ph.StartDate <= @end)
                THEN DATEDIFF(day, ph.StartDate, ph.EndDate) + 1

            ELSE 0
        END AS DaysInRange
    FROM a37g3.dbo.PriceHistory ph
),
weight AS (
    SELECT *, n.Price * n.DaysInRange AS weight
    FROM numPriceDays n
)
SELECT ROUND(SUM(w.weight)/SUM(w.DaysInRange), 2) AS AVGPRICE FROM weight w
WHERE w.PubID IN (
    SELECT b.PubID
    FROM a37g3.dbo.Books b
    WHERE b.Title = 'Harry Porter Finale'
    )
GROUP BY w.pubID;