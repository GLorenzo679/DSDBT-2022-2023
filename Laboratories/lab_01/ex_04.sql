SELECT  DAYOFMONTH,
        SUM(PRICE),
        AVG(SUM(PRICE)) OVER (ORDER BY DAYOFMONTH
                                ROWS 2 PRECEDING)
FROM FACTS F, TIMEDIM T
WHERE DATEMONTH = '7-2003'
    AND DATEYEAR = 2003
    AND F.ID_TIME = T.ID_TIME
GROUP BY DAYOFMONTH
ORDER BY DAYOFMONTH;