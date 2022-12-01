SELECT  REGION,
        SUM(TOTAL_VALUE)/COUNT(DISTINCT DATE)
FROM PRODUCTS P, TIME T, STOREHOUSE SH
WHERE P.TID = T.TID
    AND P.SID = SH.SID
    AND YEAR = 2015
GROUP BY REGION;

/*
    -----ALTERNATIVE SOLUTION-----
*/

SELECT  DISTINCT REGION,
        AVG(SUM(TOTAL_VALUE)) OVER (PARTITION BY REGION)
FROM PRODUCTS P, TIME T, STOREHOUSE SH
WHERE P.TID = T.TID
    AND P.SID = SH.SID
    AND YEAR = 2015
GROUP BY REGION, DATE;