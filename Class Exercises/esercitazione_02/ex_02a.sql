SELECT  SH.STOREHOUSE,
        DATE,
        SUM(TOTAL_VALUE),
        AVG(SUM(TOTAL_VALUE)) OVER (PARTITION BY SH.STOREHOUSE
                                    ORDER BY DATE
                                    RANGE BETWEEN INTERVAL '6' DAYS PRECEDING   -->Logical aggregation window
                                            AND CURRENT ROW)
FROM PRODUCTS P, TIME T, STOREHOUSE SH
WHERE P.TID = T.TID
    AND P.SID = S.SID
    AND S.CITY = 'Turin'
    AND T.3M = 1/2013
GROUP BY SID, SH.STOREHOUSE, DATE;

/*
    When I have GROUP BY and PARTITION, I have to insert at least 2 aggregation functions.
    In this case AVG(SUM()).
*/