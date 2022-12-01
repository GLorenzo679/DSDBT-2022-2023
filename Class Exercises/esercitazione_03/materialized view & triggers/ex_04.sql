/*
    TRIGGER FOR UPDATE OF MATERIALIZED VIEW AFTER NEW INSERT ON INCOME
*/

CREATE TRIGGER RefreshViewIncome
AFTER INSERT ON INCOME
FOR EACH ROW

DECLARE
varService VARCHAR(20);
varSType VARCHAR(20);
varRegion VARCHAR(20);
varSemester VARCHAR(20);
varYear VARCHAR(20);
varNationality VARCHAR(20);
N INTEGER;

BEGIN

SELECT Service, ServiceType INTO varService, varSType
FROM SERVICE
WHERE ServiceID = :NEW.ServiceID;

SELECT Region INTO varRegion
FROM CONSULTANTS_BRANCH
WHERE BranchID = :NEW.BranchID;

SELECT Semester, Year INTO varSemester, varYear
FROM TIME
WHERE TimeID = :NEW.TimeID;

SELECT Nationality INTO varNationality
FROM COMPANY
WHERE CompanyID = :NEW.CompanyID;

SELECT COUNT(*) INTO N
FROM ViewIncome
WHERE Service = varService
    AND Nationality = varNationality
    AND Semester = varSemester
    AND Region = varRegion;

IF (N>0) THEN
-- a record exists and I need to update it
    UPDATE ViewIncome
    SET TOTAL_INCOME = TOTAL_INCOME + :NEW.INCOME
        TOTAL_NUM_CONSULTANCIES = TOTAL_NUM_CONSULTANCIES + :NEW.#CONSULTANCIES
    WHERE Service = varService
        AND Nationality = varNationality
        AND Semester = varSemester
        AND Region = varRegion; 
ELSE
--I need to insert a new record
    INSERT INTO ViewIncome (Service, ServiceType, Nationality, Semester, Year, Region, TOTAL_INCOME, TOTAL_NUM_CONSULTANCIES)
    VALUES (varService, varSType, varNationality, varSemester, varYear, varRegion, :NEW.INCOME, :NEW.#CONSULTANCIES);
END IF;
END;