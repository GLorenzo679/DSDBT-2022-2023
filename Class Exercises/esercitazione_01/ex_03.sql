SELECT  C.PROVINCE,
        C.REGION,
        T.MONTH,
        SUM(S.TOTAMOUNT),
        RANK() OVER (PARTITION BY T.MONTH
                        ORDER BY SUM(S.TOTAMOUNT) DESC)
FROM SALES S, CUSTOER C, TIME T
WHERE S.CUSTOMERID = C.CUSTOMERID
    AND S.TIMEID = T.TIMEID
GROUP BY C.PROVINCE, C.REGION, T.MONTH;

/*
----EXAMPLE OUTPUT----

Month,  Province,   SUM(),  RANK()
1/2022,     P1,     1000,   1
1/2022,     P2,     950,    2
1/2022,     P5,     800,    3
1/2022,     P2,     1200,   1
2/2022,     P1,     700,    2

*/