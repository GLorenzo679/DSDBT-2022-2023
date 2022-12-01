/*
    CREATE MATERIALIZED VIEW WITH SQL STATEMENT
*/

INSERT INTO ViewIncome (SERVICETYPE,
                        NATIONALITY, 
                        SEMESTER, 
                        SERVICE, 
                        REGION, 
                        YEAR, 
                        TOTAL_INCOME, 
                        TOTAL_NUM_CONSULTANCIES)
(
    SELECT  SERVICETYPE,
            NATIONALITY,
            SEMESTER,
            SERVICE,
            REGION,
            YEAR,
            SUM(INCOME) AS TOTAL_INCOME,
            SUM(#CONSULTANCIES) AS TOTAL_NUM_CONSULTANCIES
    FROM INCOME I, TIME T, SERVICE S, COMPANY C, CONSULTANTS_BRANCH CB    
    WHERE I.TIMEID = T.TIMEID
        AND I.SERVICEID = S.SERVICEID
        AND I.COMPANYCATEGORYID = C.COMPANYCATEGORYID
        AND I.BRANCHID = CB.BRANCHID
    GROUP BY SERVICETYPE, NATIONALITY, SEMESTER, SERVICE, REGION, YEAR;
)