/*
    TRIGGER FOR UPDATE ON SERVICE
*/

CREATE TRIGGER UpdateServiceType
AFTER UPDATE OF ServiceType ON SERVICE
FOR EACH ROW

DECLARE
N INTEGER;

BEGIN
    SELECT COUNT(*) INTO N
    FROM ViewIncome
    WHERE ServiceType = :OLD.ServiceType;

    IF (N>0) THEN
        UPDATE ViewIncome
        SET ServiceType = :NEW.ServiceType
        WHERE ServiceType = :OLD.ServiceType
    END IF;
END;