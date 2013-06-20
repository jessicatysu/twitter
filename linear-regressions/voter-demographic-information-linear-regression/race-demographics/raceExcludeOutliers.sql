-- Race regressions

SELECT non_hispanic_white, hispanic, black, asian, mixed_race, num_followers FROM
    twitter INNER JOIN race
    ON twitter.state = race.state
    WHERE num_followers < 100000
    INTO OUTFILE 'white_hispanic_black_asian_mixedVSfollowerslessthan100000.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT non_hispanic_white, hispanic, black, asian, mixed_race,
num_following FROM
    twitter INNER JOIN race
    ON twitter.state = race.state
    WHERE num_following < 10000
    INTO OUTFILE 'white_hispanic_black_asian_mixedVSfollowinglessthan10000.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT non_hispanic_white, hispanic, black, asian, mixed_race, num_followers FROM
    twitter INNER JOIN race
    ON twitter.state = race.state
    WHERE num_followers > 100000
    INTO OUTFILE 'white_hispanic_black_asian_mixedVSfollowersmorethan100000.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SELECT non_hispanic_white, hispanic, black, asian, mixed_race,
num_following FROM
    twitter INNER JOIN race
    ON twitter.state = race.state
    WHERE num_following > 10000
    INTO OUTFILE 'white_hispanic_black_asian_mixedVSfollowingmorethan10000.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';
