-- Leadership list obtained from
-- http://www.thecapitol.net/FAQ/cong_leadershipWpics113_1.html

DROP TABLE IF EXISTS leaders;

CREATE TABLE leaders (
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

INSERT INTO leaders
    SELECT * FROM twitter
        -- Speaker of the House
        WHERE (first_name = "John" AND last_name = "Boehner")
        -- House Majority Leader
        OR (first_name = "Eric" AND last_name = "Cantor")
        -- Majority Whip
        OR (first_name = "Kevin" AND last_name = "McCarthy")
        -- Republican Conference Chairwoman
        OR (first_name = "Cathy" AND last_name = "McMorris Rodgers")
        -- House Republican Policy Committee Chairman
        OR (first_name = "James" AND last_name = "Lankford")
        -- House Republican Policy Committee Vice-Chairman
        OR (first_name = "Lynn" AND last_name = "Jenkins")
        -- Minority Leader
        OR (first_name = "Nancy" AND last_name = "Pelosi")
        -- Minority Whip
        OR (first_name = "Steny" AND last_name = "Hoyer")
        -- Assistant Democratic Leader
        OR (first_name = "James" AND last_name = "Clyburn")
        -- Democratic Caucus Chairman
        OR (first_name = "Xavier" AND last_name = "Becerra")
        -- Democratic Caucus Vice Chairman
        OR (first_name = "Joseph" AND last_name = "Crowley")
    
        -- President of the Senate -- not listed in our database, but has a
        -- Twitter account.  We omit him for consistency.
        OR (first_name = "Joseph" AND last_name = "Biden")
        -- President Pro Tempore of the Senate
        OR (first_name = "Patrick" AND last_name = "Leahy")
        -- Majority Leader
        OR (first_name = "Harry" AND last_name = "Reid")
        -- Majority Whip
        OR (first_name = "Richard" AND last_name = "Durbin")
        -- Democratic Caucus, Co-Chairman, Democratic Policy Committee
        OR (first_name = "Charles" AND last_name = "Schumer")
        -- Democratic Conference Secretary, Democratic Senatorial Campaign
        -- Committee Chair
        OR (first_name = "Patty" AND last_name = "Murray")
        -- Co-Chairman, Democratic Policy Committee
        OR (first_name = "Debbie" AND last_name = "Stabenow")
        -- Minority Leader
        OR (first_name = "Mitch" AND last_name = "McConnell")
        -- Minority Whip
        OR (first_name = "John" AND last_name = "Cornyn")
        -- Republican Conference Chairman
        OR (first_name = "John" AND last_name = "Thune")
        -- Republican Policy Committee Chairman
        OR (first_name = "John" AND last_name = "Barrasso")
        -- Republican Campaign Committee Chair
        OR (first_name = "Jerry" AND last_name = "Moran");
