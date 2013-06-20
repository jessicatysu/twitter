-- Boston bombing: all
SELECT body
    FROM tweets INNER JOIN twitter
    ON tweets.twitter_id = twitter.twitter_id
    WHERE post_date BETWEEN '2013-04-15' AND '2013-04-22'
    INTO OUTFILE 'bostonbombing-all.txt'
    LINES TERMINATED BY '\n';

-- Overall: all
SELECT body
    FROM tweets INNER JOIN twitter
    ON tweets.twitter_id = twitter.twitter_id
    INTO OUTFILE 'overall-all.txt'
    LINES TERMINATED BY '\n';

-- Boston bombing: Republicans
SELECT body
    FROM tweets INNER JOIN twitter
    ON tweets.twitter_id = twitter.twitter_id
    WHERE post_date BETWEEN '2013-04-15' AND '2013-04-22'
        AND party = 'R'
    INTO OUTFILE 'bostonbombing-Republicans.txt'
    LINES TERMINATED BY '\n';

-- Overall: Republicans
SELECT body
    FROM tweets INNER JOIN twitter
    ON tweets.twitter_id = twitter.twitter_id
    WHERE party = 'R'
    INTO OUTFILE 'overall-Republicans.txt'
    LINES TERMINATED BY '\n';

-- Boston bombing: Democrats
SELECT body
    FROM tweets INNER JOIN twitter
    ON tweets.twitter_id = twitter.twitter_id
    WHERE post_date BETWEEN '2013-04-15' AND '2013-04-22'
        AND party = 'D'
    INTO OUTFILE 'bostonbombing-Democrats.txt'
    LINES TERMINATED BY '\n';

-- Overall: Democrats
SELECT body
    FROM tweets INNER JOIN twitter
    ON tweets.twitter_id = twitter.twitter_id
    WHERE party = 'D'
    INTO OUTFILE 'overall-Democrats.txt'
    LINES TERMINATED BY '\n';
