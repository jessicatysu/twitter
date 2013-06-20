-- Count number of retweets for each person.  Thanks StackOverflow.
SELECT twitter.twitter_id, 
    SUM(CASE when body LIKE "RT %" THEN 1 ELSE 0 END) AS num_retweets
    FROM twitter LEFT JOIN tweets
    ON tweets.twitter_id = twitter.twitter_id
    GROUP BY twitter.twitter_id
    INTO OUTFILE "num_retweets.csv"
    FIELDS TERMINATED BY ","
    LINES TERMINATED BY "\n";

-- Democrats
SELECT SUM(CASE when body LIKE "RT %" THEN 1 ELSE 0 END) AS num_retweets
    FROM twitter LEFT JOIN tweets
    ON tweets.twitter_id = twitter.twitter_id
    WHERE party = 'D'
    GROUP BY twitter.twitter_id
    INTO OUTFILE "num_retweets-Democrats.csv"
    FIELDS TERMINATED BY ","
    LINES TERMINATED BY "\n";


-- Republicans
SELECT SUM(CASE when body LIKE "RT %" THEN 1 ELSE 0 END) AS num_retweets
    FROM twitter LEFT JOIN tweets
    ON tweets.twitter_id = twitter.twitter_id
    WHERE party = 'R'
    GROUP BY twitter.twitter_id
    INTO OUTFILE "num_retweets-Republicans.csv"
    FIELDS TERMINATED BY ","
    LINES TERMINATED BY "\n";

-- Democrats (fraction of retweets)
SELECT SUM(CASE when body LIKE "RT %" THEN 1 ELSE 0 END) / SUM(1) AS frac_retweets
    FROM twitter LEFT JOIN tweets
    ON tweets.twitter_id = twitter.twitter_id
    WHERE party = 'D'
    GROUP BY twitter.twitter_id
    INTO OUTFILE "frac_retweets-Democrats.csv"
    FIELDS TERMINATED BY ","
    LINES TERMINATED BY "\n";


-- Republicans
SELECT SUM(CASE when body LIKE "RT %" THEN 1 ELSE 0 END) / SUM(1) AS frac_retweets
    FROM twitter LEFT JOIN tweets
    ON tweets.twitter_id = twitter.twitter_id
    WHERE party = 'R'
    GROUP BY twitter.twitter_id
    INTO OUTFILE "frac_retweets-Republicans.csv"
    FIELDS TERMINATED BY ","
    LINES TERMINATED BY "\n";

-- Regression
SELECT (CASE when party = 'R' THEN 1 ELSE 0 END) AS party,
    (CASE when twitter.twitter_id IN (SELECT twitter_id FROM leaders) 
    THEN 1 ELSE 0 END) AS leader,
    SUM(CASE when body LIKE "RT %" THEN 1 ELSE 0 END) AS num_retweets
    FROM twitter LEFT JOIN tweets
    ON tweets.twitter_id = twitter.twitter_id
    GROUP BY twitter.twitter_id
    INTO OUTFILE "party-leadership-num_retweets.csv"
    FIELDS TERMINATED BY ","
    LINES TERMINATED BY "\n";
