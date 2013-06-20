-- Tweets per month for non-leaders
SELECT (num_tweets / acct_age) AS tweets_per_month
    FROM twitter
    WHERE twitter_id NOT IN
        (SELECT twitter_id FROM leaders)
    INTO OUTFILE 'ttest-nonLeaders-tweetspermonth.csv'
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n';

-- Tweets per month for leaders
SELECT (num_tweets / acct_age) AS tweets_per_month
    FROM leaders
    INTO OUTFILE 'ttest-leaders-tweetspermonth.csv'
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n';

-- Followers for non-leaders
SELECT num_followers
    FROM twitter
    WHERE twitter_id NOT IN
        (SELECT twitter_id FROM leaders)
    INTO OUTFILE 'ttest-nonLeaders-numfollowers.csv'
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n';

-- Followers for leaders
SELECT num_followers
    FROM leaders
    INTO OUTFILE 'ttest-leaders-numfollowers.csv'
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n';

-- Following for non-leaders
SELECT num_following
    FROM twitter
    WHERE twitter_id NOT IN
        (SELECT twitter_id FROM leaders)
    INTO OUTFILE 'ttest-nonLeaders-numfollowing.csv'
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n';

-- Following for leaders
SELECT num_following
    FROM leaders
    INTO OUTFILE 'ttest-leaders-numfollowing.csv'
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n';

-- Age of non-leaders
SELECT age
    FROM twitter
    WHERE twitter_id NOT IN
        (SELECT twitter_id FROM leaders)
    INTO OUTFILE 'ttest-nonLeaders-age.csv'
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n';

-- Age of leaders
SELECT age
    FROM leaders
    INTO OUTFILE 'ttest-leaders-age.csv'
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n';
