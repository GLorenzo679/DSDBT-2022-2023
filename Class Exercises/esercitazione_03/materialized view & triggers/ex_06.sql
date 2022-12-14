/*
    MATERIALIZED VIEW LOG
*/

CREATE MATERIALIZED VIEW LOG ON INCOME
WITH SEQUENCE, ROWID
(BranchID, ServiceID, TimeID, CompanyCategoryID, #Consultancies, Income)
INCLUDING NEW VALUES;

CREATE MATERIALIZED VIEW LOG ON SERVICE
WITH SEQUENCE, ROWID
(ServiceID, Service, ServiceType)
INCLUDING NEW VALUES;

CREATE MATERIALIZED VIEW LOG ON TIME
WITH SEQUENCE, ROWID
(TimeID, Semester, Year)
INCLUDING NEW VALUES;

CREATE MATERIALIZED VIEW LOG ON CONSULTANTS_BRANCH
WITH SEQUENCE, ROWID
(BranchID, Region)
INCLUDING NEW VALUES;

CREATE MATERIALIZED VIEW LOG ON COMPANY
WITH SEQUENCE, ROWID
(CompanyCategoryID, Nationality)
INCLUDING NEW VALUES;