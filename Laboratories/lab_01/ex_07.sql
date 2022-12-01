SELECT  DATEMONTH,
        DATEYEAR,
        REGION,
        SUM(NUMBEROFCALLS),
        SUM(SUM(NUMBEROFCALLS)) OVER (PARTITION BY DATEYEAR, REGION
                                        ORDER BY DATEMONTH
                                        ROWS UNBOUNDED PRECEDING)
FROM FACTS F, TIMEDIM T, LOCATION L
WHERE F.ID_LOCATION_CALLER = L.ID_LOCATION
    AND F.ID_TIME = T.ID_TIME
GROUP BY REGION, DATEMONTH, DATEYEAR;