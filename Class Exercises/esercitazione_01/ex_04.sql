SELECT  C.REGION,
        T.MONTH,
        SUM(S.TOTAMOUNT)
        SUM(SUM(S.TOTAMOUNT)) OVER (PARTITION BY C.REGION
                                        ORDER BY T.MONTH
                                        ROWS UNBOUNDED PRECEDING) AS CUMULATIVE
FROM SALES S, CUSTOMER C, TIME T
WHERE S.CUSTOMERID = C.CUSTOMERID 
    AND S.TIMEID = T.TIMEID
GROUP BY C.REGION, T.MONTH;

/*
----EXAMPLE OUTPUT----

Region, Month,  SUM(), CUMULATIVE
R1,     1/2022, 100,    100
R1,     2/2022, 200,    300
R1,     3/2022, 150,    450
....
R2,     1/2022, 50,     50
R2,     2/2022, 150,    200
....

*/