-- Republicans who post <100 tweets/month
SELECT body
    FROM tweets INNER JOIN twitter
    ON tweets.twitter_id = twitter.twitter_id
    WHERE party = 'R'
        AND (num_tweets / acct_age) < 100
    INTO OUTFILE 'tweets-nonOutliers-Republicans.csv'
    LINES TERMINATED BY '\n';

-- Democrats who post <100 tweets/month
SELECT body
    FROM tweets INNER JOIN twitter
    ON tweets.twitter_id = twitter.twitter_id
    WHERE party = 'D'
        AND (num_tweets / acct_age) < 100
    INTO OUTFILE 'tweets-nonOutliers-Democrats.csv'
    LINES TERMINATED BY '\n';
