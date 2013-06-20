-- Party data for twitter users: 0 = Democrat, 1 = Republican
SELECT REPLACE(REPLACE(party, "D", 0), "R", 1) AS _party
    FROM twitter
    INTO OUTFILE 'ttest-twitterUsers-party.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

-- Party data for nonTwitter users
SELECT REPLACE(REPLACE(party, "D", 0), "R", 1) AS _party
    FROM nonTwitter
    INTO OUTFILE 'ttest-nonTwitterUsers-party.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

-- Age data for twitter users
SELECT age
    FROM twitter
    INTO OUTFILE 'ttest-twitterUsers-age.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

-- Age data for nonTwitter users
SELECT age
    FROM nonTwitter
    INTO OUTFILE 'ttest-nonTwitterUsers-age.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

-- Status data for twitter users - House = 0, Senate = 1
SELECT REPLACE(REPLACE(status, "Rep", 0), "Sen", 1) AS _status
    FROM twitter
    INTO OUTFILE 'ttest-twitterUsers-status.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

-- Status data for nonTwitter users
SELECT REPLACE(REPLACE(status, "Rep", 0), "Sen", 1) AS _status
    FROM nonTwitter
    INTO OUTFILE 'ttest-nonTwitterUsers-status.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';
