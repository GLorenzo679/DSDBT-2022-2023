SELECT  DATEMONTH,
        DATEYEAR,
        SUM(NUMBEROFCALLS),
        SUM(PRICE),
        RANK() OVER (ORDER BY SUM(PRICE) DESC)
FROM FACTS F, TIMEDIM T, 
WHERE F.ID_TIME = T.ID_TIME
GROUP BY DATEMONTH, DATEYEAR;