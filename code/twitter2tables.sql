DROP TABLE IF EXISTS twitter;
DROP TABLE IF EXISTS statepop;

CREATE TABLE twitter (
    twitter_id      VARCHAR(20),
    status          CHAR(3),
    first_name      VARCHAR(20),
    last_name       VARCHAR(20),
    party           CHAR(1),
    state           CHAR(2),
    gender          CHAR(1),
    age             INTEGER,
    num_tweets      INTEGER,
    acct_age        INTEGER,
    num_followers   INTEGER,
    num_following   INTEGER
);

CREATE TABLE statepop (
    state           CHAR(2),
    population      INTEGER
);

LOAD DATA
    LOCAL INFILE 'twitterdata.csv'
    INTO TABLE twitter
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    (twitter_id, status, first_name, last_name, party, state, gender, age,
        num_tweets, acct_age, num_followers, num_following);

LOAD DATA
    LOCAL INFILE 'statepop.csv'
    INTO TABLE statepop
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    (state, population);

-- Two variable regressions

SELECT age, (num_tweets / acct_age) AS vol_tweets FROM twitter
    INTO OUTFILE 'ageVStweets.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT age, num_followers FROM twitter
    INTO OUTFILE 'ageVSfollowers.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT age, num_following FROM twitter
    INTO OUTFILE 'ageVSfollowing.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT age, (num_followers / population) AS followersPC FROM
    twitter INNER JOIN statepop
    ON twitter.state = statepop.state
    INTO OUTFILE 'ageVSfollowersPC.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT age, (num_following / population) AS followingPC FROM
    twitter INNER JOIN statepop
    ON twitter.state = statepop.state
    INTO OUTFILE 'ageVSfollowingPC.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT party, (num_tweets / acct_age) AS vol_tweets FROM twitter
    INTO OUTFILE 'partyVStweets.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT party, num_followers FROM twitter
    INTO OUTFILE 'partyVSfollowers.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT party, num_following FROM twitter
    INTO OUTFILE 'partyVSfollowing.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT party, (num_followers / population) AS followersPC FROM
    twitter INNER JOIN statepop
    ON twitter.state = statepop.state
    INTO OUTFILE 'partyVSfollowersPC.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT party, (num_following / population) AS followingPC FROM
    twitter INNER JOIN statepop
    ON twitter.state = statepop.state
    INTO OUTFILE 'partyVSfollowingPC.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT gender, (num_tweets / acct_age) AS vol_tweets FROM twitter
    INTO OUTFILE 'genderVStweets.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT gender, num_followers FROM twitter
    INTO OUTFILE 'genderVSfollowers.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT gender, num_following FROM twitter
    INTO OUTFILE 'genderVSfollowing.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT gender, (num_followers / population) AS followersPC FROM
    twitter INNER JOIN statepop
    ON twitter.state = statepop.state
    INTO OUTFILE 'genderVSfollowersPC.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT gender, (num_following / population) AS followingPC FROM
    twitter INNER JOIN statepop
    ON twitter.state = statepop.state
    INTO OUTFILE 'genderVSfollowingPC.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT status, (num_tweets / acct_age) AS vol_tweets FROM twitter
    INTO OUTFILE 'statusVStweets.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT status, num_followers FROM twitter
    INTO OUTFILE 'statusVSfollowers.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT status, num_following FROM twitter
    INTO OUTFILE 'statusVSfollowing.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT status, (num_followers / population) AS followersPC FROM
    twitter INNER JOIN statepop
    ON twitter.state = statepop.state
    INTO OUTFILE 'statusVSfollowersPC.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT status, (num_following / population) AS followingPC FROM
    twitter INNER JOIN statepop
    ON twitter.state = statepop.state
    INTO OUTFILE 'statusVSfollowingPC.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

-- Multiple regressions (age, party, gender, status vs. tweets, followers,
-- following, followersPC, followingPC)
SELECT age, party, gender, status, (num_tweets / acct_age) AS vol_tweets FROM twitter
    INTO OUTFILE 'age_party_gender_statusVStweets.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT age, party, gender, status, num_followers FROM twitter
    INTO OUTFILE 'age_party_gender_statusVSfollowers.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT age, party, gender, status, num_following FROM twitter
    INTO OUTFILE 'age_party_gender_statusVSfollowing.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT age, party, gender, status, (num_followers / population) AS followersPC FROM
    twitter INNER JOIN statepop
    ON twitter.state = statepop.state
    INTO OUTFILE 'age_party_gender_statusVSfollowersPC.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT age, party, gender, status, (num_following / population) AS followingPC FROM
    twitter INNER JOIN statepop
    ON twitter.state = statepop.state
    INTO OUTFILE 'age_party_gender_statusVSfollowingPC.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

-- Race regressions

-- Age regressions
