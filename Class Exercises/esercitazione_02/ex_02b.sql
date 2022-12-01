SELECT  DATE,
        CITY,
        (SUM(TOTAL_FREE_M2)/SUM(TOTAL_M2))*100 AS M2_PERCENTAGE
        RANK() OVER (ORDER BY M2_PERCENTAGE ASC)
FROM SURFACE S, STOREHOUS SH, TIME T
WHERE S.SID = SH.SID
    AND S.TID = T.TID
    AND YEAR = 2014
GROUP BY DATE, CITY;