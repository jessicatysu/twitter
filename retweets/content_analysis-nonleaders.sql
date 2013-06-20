-- Republicans who aren't leaders
SELECT body
    FROM tweets INNER JOIN twitter
    ON tweets.twitter_id = twitter.twitter_id
    WHERE party = 'R'
        AND tweets.twitter_id NOT IN
            (SELECT twitter_id FROM leaders)
    INTO OUTFILE 'tweets-nonLeaders-Republicans.csv'
    LINES TERMINATED BY '\n';

-- Democrats who aren't leaders
SELECT body
    FROM tweets INNER JOIN twitter
    ON tweets.twitter_id = twitter.twitter_id
    WHERE party = 'D'
        AND tweets.twitter_id NOT IN
            (SELECT twitter_id FROM leaders)
    INTO OUTFILE 'tweets-nonLeaders-Democrats.csv'
    LINES TERMINATED BY '\n';
