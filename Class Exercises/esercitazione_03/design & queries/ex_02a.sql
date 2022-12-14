SELECT  PACKAGE,
        YEAR,
        SUM(TOT_INCOME)/SUM(TOT_LITERS),
        (SUM(TOT_LITERS)/SUM(SUM(TOT_LITERS))) * 100 OVER (PARTITION BY PACKAGE),
        SUM(SUM(TOT_LITERS))/ OVER (PARTITION BY PACKAGE
                                ORDER BY YEAR
                                ROWS UNBOUNDED PRECEDING)
FROM EXPORT E, DESTINATION D, WINE_TYPE WT, TIME T
WHERE E.TID = T.TID
    AND E.DID = D.DID
    AND E.WTID = WT.WTID
    AND DOC = True
    AND CONTINENT = 'Asia'
GROUP BY PACKAGE, YEAR;