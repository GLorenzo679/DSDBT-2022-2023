/*
    MATERIALIZED VIEW WITH NORMAL SQL STATEMENT
*/
CREATE TABLE VM1 (
    TICKET_TYPE VARCHAR(20),
    DATE DATE,
    MONTH VARCHAR(20),
    YEAR INTEGER,
    TOT_REVENUE INTEGER CHECK (TOT_REVENUE IS NOT NULL AND TOT_REVENUE > 0),
    TOT_SOLD_TICKETS INTEGER CHECK (TOT_SOLD_TICKETS IS NOT NULL AND TOT_SOLD_TICKETS > 0)
    PRIMARY KEY(TICKET_TYPE, DATE)
);
