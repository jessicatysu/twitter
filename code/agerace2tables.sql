DROP TABLE IF EXISTS race;
DROP TABLE IF EXISTS age;

CREATE TABLE race (
    state                   CHAR(2),
    population              INTEGER,
    non_hispanic_white      NUMERIC(3, 1),
    hispanic                NUMERIC(3, 1),
    black                   NUMERIC(3, 1),
    AIAN1                   NUMERIC(3, 1),
    asian                   NUMERIC(3, 1),
    NHPI2                   NUMERIC(3, 1),
    mixed_race              NUMERIC(3, 1)
);

CREATE TABLE age (
    state                   CHAR(2),
    population              INTEGER,
    male                    INTEGER,
    female                  INTEGER,
    under_5                 INTEGER,
    5_to_9                  INTEGER,
    10_to_14                INTEGER,
    15_to_19                INTEGER,
    20_to_24                INTEGER,
    18_to_24                INTEGER,
    25_to_34                INTEGER,
    35_to_44                INTEGER,
    45_to_54                INTEGER,
    55_to_64                INTEGER,
    55_to_59                INTEGER,
    60_to_64                INTEGER,
    65_to_74                INTEGER,
    75_to_84                INTEGER,
    85_and_over             INTEGER,
    median_age              INTEGER,
    under_18                INTEGER,
    18_and_over             INTEGER,
    65_and_over             INTEGER,
    65_and_over_male        INTEGER,
    65_and_over_female      INTEGER,
    under_18_percent        INTEGER,
    65_and_over_percent     INTEGER
);

LOAD DATA
    LOCAL INFILE 'state-demographics-age-pruned.csv'
    INTO TABLE age
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    (state, population, male, female, under_5, 5_to_9, 10_to_14, 15_to_19,
    20_to_24, 18_to_24, 25_to_34, 35_to_44, 45_to_54, 55_to_64, 55_to_59,
    60_to_64, 65_to_74, 75_to_84, 85_and_over, median_age, under_18,
    18_and_over, 65_and_over, 65_and_over_male, 65_and_over_female,
    under_18_percent, 65_and_over_percent);

LOAD DATA
    LOCAL INFILE 'state-demographics-race.csv'
    INTO TABLE race
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    (state, population, non_hispanic_white, hispanic, black, AIAN1, asian,
    NHPI2, mixed_race);

-- Race regressions

SELECT non_hispanic_white, hispanic, black, asian, mixed_race, (num_tweets
/ acct_age) AS vol_tweets FROM
    twitter INNER JOIN race
    ON twitter.state = race.state
    INTO OUTFILE 'white_hispanic_black_asian_mixedVStweets.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT non_hispanic_white, hispanic, black, asian, mixed_race, num_followers FROM
    twitter INNER JOIN race
    ON twitter.state = race.state
    INTO OUTFILE 'white_hispanic_black_asian_mixedVSfollowers.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT non_hispanic_white, hispanic, black, asian, mixed_race,
num_following FROM
    twitter INNER JOIN race
    ON twitter.state = race.state
    INTO OUTFILE 'white_hispanic_black_asian_mixedVSfollowing.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT non_hispanic_white, hispanic, black, asian, mixed_race,
(num_followers / race.population) AS followersPC FROM
    twitter INNER JOIN race
    ON twitter.state = race.state
    INTO OUTFILE 'white_hispanic_black_asian_mixedVSfollowersPC.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT non_hispanic_white, hispanic, black, asian, mixed_race,
(num_following / race.population) AS followingPC FROM
    twitter INNER JOIN race
    ON twitter.state = race.state
    INTO OUTFILE 'white_hispanic_black_asian_mixedVSfollowingPC.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

-- Age distribution regressions

SELECT median_age, (num_tweets / acct_age) AS vol_tweets FROM
    twitter INNER JOIN age
    ON twitter.state = age.state
    INTO OUTFILE 'medianageVStweets.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT median_age, num_followers FROM
    twitter INNER JOIN age
    ON twitter.state = age.state
    INTO OUTFILE 'medianageVSfollowers.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT median_age, num_following FROM
    twitter INNER JOIN age
    ON twitter.state = age.state
    INTO OUTFILE 'medianageVSfollowing.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT median_age, (num_followers /  1000 / age.population) AS followersPC FROM
    twitter INNER JOIN age
    ON twitter.state = age.state
    INTO OUTFILE 'medianageVSfollowersPC.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT median_age, (num_following /  1000 / age.population) AS followingPC FROM
    twitter INNER JOIN age
    ON twitter.state = age.state
    INTO OUTFILE 'medianageVSfollowingPC.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';


SELECT (18_to_24 / population) AS youth, (num_tweets / acct_age) AS vol_tweets FROM
    twitter INNER JOIN age
    ON twitter.state = age.state
    INTO OUTFILE '18to24VStweets.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT (18_to_24 / population) AS youth, num_followers FROM
    twitter INNER JOIN age
    ON twitter.state = age.state
    INTO OUTFILE '18to24VSfollowers.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT (18_to_24 / population) AS youth, num_following FROM
    twitter INNER JOIN age
    ON twitter.state = age.state
    INTO OUTFILE '18to24VSfollowing.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT (18_to_24 / population) AS youth, (num_followers /  1000 / age.population) AS followersPC FROM
    twitter INNER JOIN age
    ON twitter.state = age.state
    INTO OUTFILE '18to24VSfollowersPC.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT (18_to_24 / population) AS youth, (num_following /  1000 / age.population) AS followingPC FROM
    twitter INNER JOIN age
    ON twitter.state = age.state
    INTO OUTFILE '18to24VSfollowingPC.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';


SELECT 65_and_over_percent, (num_tweets / acct_age) AS vol_tweets FROM
    twitter INNER JOIN age
    ON twitter.state = age.state
    INTO OUTFILE '65andoverVStweets.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT 65_and_over_percent, num_followers FROM
    twitter INNER JOIN age
    ON twitter.state = age.state
    INTO OUTFILE '65andoverVSfollowers.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT 65_and_over_percent, num_following FROM
    twitter INNER JOIN age
    ON twitter.state = age.state
    INTO OUTFILE '65andoverVSfollowing.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT 65_and_over_percent, (num_followers /  1000 / age.population) AS followersPC FROM
    twitter INNER JOIN age
    ON twitter.state = age.state
    INTO OUTFILE '65andoverVSfollowersPC.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT 65_and_over_percent, (num_following /  1000 / age.population) AS followingPC FROM
    twitter INNER JOIN age
    ON twitter.state = age.state
    INTO OUTFILE '65andoverVSfollowingPC.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';
