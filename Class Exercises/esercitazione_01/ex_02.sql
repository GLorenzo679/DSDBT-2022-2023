SELECT  C.PROVINCE,
        C.REGION,
        SUM(TOTAMOUNT),
        RANK() OVER (   PARTITION BY REGION
                        ORDER BY SUM(TOTAMOUNT) DESC)
FROM SALES S, CUSTOER C
WHERE S.CUSTOMERID = C.CUSTOMERID
GROUP BY C.PROVINCE, C.REGION;

/*
----EXAMPLE OUTPUT----

Province, Region, SUM(), RANK()
P1,         R1,     1000,   1
P2,         R1,     800,    2
P3,         R1,     700,    3
P5,         R2,     950,    1
P4,         R2,     800,    2

*/