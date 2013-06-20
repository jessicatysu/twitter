-- Tweets/month data for urban users
SELECT (num_tweets / acct_age) AS tweets_per_month
    FROM twitter INNER JOIN statepop
    ON twitter.state = statepop.state
    WHERE population > 5000000
    INTO OUTFILE 'ttest-urban-tweetspermonth.csv'
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n';

-- Tweets/month data for rural users
SELECT (num_tweets / acct_age) AS tweets_per_month
    FROM twitter INNER JOIN statepop
    ON twitter.state = statepop.state
    WHERE population <= 5000000
    INTO OUTFILE 'ttest-rural-tweetspermonth.csv'
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n';

-- Followers data for urban users
SELECT num_followers
    FROM twitter INNER JOIN statepop
    ON twitter.state = statepop.state
    WHERE population > 5000000
    INTO OUTFILE 'ttest-urban-numfollowers.csv'
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n';

-- Followers data for rural users
SELECT num_followers
    FROM twitter INNER JOIN statepop
    ON twitter.state = statepop.state
    WHERE population <= 5000000
    INTO OUTFILE 'ttest-rural-numfollowers.csv'
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n';

-- Following data for urban users
SELECT num_following
    FROM twitter INNER JOIN statepop
    ON twitter.state = statepop.state
    WHERE population > 5000000
    INTO OUTFILE 'ttest-urban-numfollowing.csv'
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n';

-- Following data for rural users
SELECT num_following
    FROM twitter INNER JOIN statepop
    ON twitter.state = statepop.state
    WHERE population <= 5000000
    INTO OUTFILE 'ttest-rural-numfollowing.csv'
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n';
