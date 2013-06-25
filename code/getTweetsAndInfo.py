#!/usr/bin/python

import datetime
import time
import twitter
import sys

TWEETS_TO_RETRIEVE = 200 # Number of tweets to retrieve for each user

# Logs into account "jsuPS120" with password "caltech" using OAuth
# ...I could really care less if you know my password.
api = twitter.Api(consumer_key='kfCLfVgcpV87LwYnjBLnFw',
                     consumer_secret='SEO4WAY5GdedrVBS8Hz11XQtuShmOt1uudMkAJTc',
                     access_token_key='1345392391-UfUoO1hii6MNZ8ZWfvDL4c00ZhCu6mHKVggLCJs',
                     access_token_secret='g6HzksnRUrqQLxo2XCBtvtiDL4idUt8P8EcnXTTHjI')

now = datetime.datetime.now()
today = str(now.year) + '-' + str(now.month) + '-' + str(now.day)

data = open("../data/Legislator-Info/data.csv", 'r')
tweets = open("../data/Tweets-And-Info/Tweets/tweets-" + today + ".csv", 'w')
info = open("../data/Tweets-And-Info/Info/info-" + today + ".csv", 'w')
err = open("../data/Tweets-And-Info/Errors/err-" + today + ".txt", 'w')

# Get all congressional Twitter data, including their tweets, number of
# followers, number of friends, number of statuses, and account age.
def getTweetsAndInfo(congress_data, tweetfile, infofile, errfile):
    count = 0
    for person in congress_data:
        data = person.split(',')
        try:
            getSingleUserTweets(data[0], tweetfile)
            getSingleUserInfo(data[0], infofile)
        except twitter.TwitterError:
            # Write names of error'ed congressmen to file so we can get
            # their tweets later or examine what the problem is.  The error
            # may have occurred either in getting the tweets or getting the
            # information.  So it is possible to have the tweets but not
            # the information, and vice versa.
            print "Error on " + data[0]
            print sys.exc_info()
            errfile.write(data[0])
            errfile.write("\n")
            continue
        
        # Report which congressperson we're on
        count += 1
        print '[' + str(count) + ']' + data[1] + ', ' + data[2] + ' ' + data[3]

# Gets the user timeline for a single user, writing it to a file.
def getSingleUserTweets(screen_name, tweetfile):
    # Rate limits
    while (api.GetRateLimitStatus(u'statuses')[u'resources'][u'statuses'][u'/statuses/user_timeline'][u'remaining'] <= 100):
        print "Rate limited: Sleeping for 60 seconds [" + screen_name + "]"
        time.sleep(60)
    
    # Get the user timeline for a single user
    statuses = api.GetUserTimeline(screen_name=screen_name, count=TWEETS_TO_RETRIEVE)
    for s in statuses:
        # Write twitter name to file
        tweetfile.write(screen_name)
        tweetfile.write('^&^&^') # Separator

        # Write date of tweet to file
        tweetfile.write(processDate(s.created_at.encode('ascii', 'replace')))
        tweetfile.write('^&^&^')

        # Write tweet to file, removing all newlines.
        text = s.text.encode('ascii', 'replace')
        text = "".join(text.split("\n"))
        tweetfile.write(text)
        tweetfile.write("\n")

def getSingleUserInfo(screen_name, infofile):
    # Rate limits
    while (api.GetRateLimitStatus(u'users')[u'resources'][u'users'][u'/users/show/:id'][u'remaining'] <= 100):
        print "Rate limited: Sleeping for 60 seconds [" + screen_name + "]"
        time.sleep(60)

    # Get the user information for a single user
    user = api.GetUser(screen_name=screen_name)
    infofile.write(screen_name + ',')
    infofile.write(str(user.statuses_count) + ',')
    infofile.write(str(user.followers_count) + ',')
    infofile.write(str(user.friends_count) + ',')
    infofile.write(str(getTimeSince(user.created_at)) + '\n')


# Converts a date given by the Twitter system into a date recognized by
# MySQL.  The original dates are in the form "Wed Jun 12 18:32:02 +0000
# 2013".  The new dates should be in the form "2013-06-12 18:32:02".
def processDate(string):
    month = {"Jan": "01", "Feb": "02", "Mar": "03", "Apr": "04", "May":
    "05", "Jun": "06", "Jul": "07", "Aug": "08", "Sep": "09", "Oct": "10",
    "Nov": "11", "Dec": "12"}
    darray = string.split(" ")
    return (darray[5] + "-" + month[darray[1]] + "-" + darray[2] + " " +
        darray[3])

# Takes a time string returned by the Twitter API and finds how many months
# it's been since that time.
def getTimeSince(string):
    then = time.strptime(string, "%a %b %d %H:%M:%S +0000 %Y")
    now = time.localtime()
    # Assume all months are 30 days, in our approximation
    return (time.mktime(now) - time.mktime(then)) / 3600 / 24 / 30

#    print (api.GetRateLimitStatus(u'statuses')[u'resources'][u'statuses'][u'/statuses/user_timeline'][u'remaining'])
#    print (api.GetRateLimitStatus(u'users')[u'resources'][u'users'][u'/users/show/:id'][u'remaining'])
getTweetsAndInfo(congress_data=data, tweetfile=tweets, infofile=info, errfile=err)

data.close()
tweets.close()
info.close()
err.close()
