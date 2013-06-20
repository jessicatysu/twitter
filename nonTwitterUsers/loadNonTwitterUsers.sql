DROP TABLE IF EXISTS nonTwitter;

CREATE TABLE nonTwitter (
    status      CHAR(3),
    first_name  VARCHAR(20),
    last_name   VARCHAR(20),
    party       CHAR(1),
    state       CHAR(2),
    gender      CHAR(1),
    age         INTEGER
);

LOAD DATA
    LOCAL INFILE '../nonTwitterUsers/nonTwitterUsersInOffice.csv'
    INTO TABLE nonTwitter
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    (status, first_name, last_name, party, state, gender, age);
