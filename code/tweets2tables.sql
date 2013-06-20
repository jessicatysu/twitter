DROP TABLE IF EXISTS tweets;

CREATE TABLE tweets (
    twitter_id      VARCHAR(20),
    post_date       DATETIME,
    body            VARCHAR(200)
);

LOAD DATA
    LOCAL INFILE 'tweets_parsed-6-12.csv'
    INTO TABLE tweets
    FIELDS TERMINATED BY '^&^&^'
    LINES TERMINATED BY '\n'
    (twitter_id, post_date, body);
