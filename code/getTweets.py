#!/usr/bin/python

import time
import twitter
import sys

TWEETS_TO_RETRIEVE = 200 # Number of tweets to retrieve for each user

# Logs into account "jsuPS120" with password "caltech" using OAuth
# And yeah I don't really care if you know my password, it's a throwaway
# account anyway.
api = twitter.Api(consumer_key='kfCLfVgcpV87LwYnjBLnFw',
                     consumer_secret='SEO4WAY5GdedrVBS8Hz11XQtuShmOt1uudMkAJTc',
                     access_token_key='1345392391-UfUoO1hii6MNZ8ZWfvDL4c00ZhCu6mHKVggLCJs',
                     access_token_secret='g6HzksnRUrqQLxo2XCBtvtiDL4idUt8P8EcnXTTHjI')

def getAllTweets(congress_data, outfile, errfile):
    count = 0
    for person in congress_data:
        data = person.split(',')
        try:
            getSingleUser(data[0], outfile)
        except twitter.TwitterError:
            print "Error on " + data[0]
            print sys.exc_info()
            errfile.write(data[0])
            errfile.write("\n")
            continue

        # Report which congressperson we're on
        count += 1
        print '[' + str(count) + ']' + data[1] + ', ' + data[2] + ' ' + data[3]

def getSingleUser(screen_name, outfile):
    # Rate limits
    while (api.GetRateLimitStatus(u'statuses')[u'resources'][u'statuses'][u'/statuses/user_timeline'][u'remaining'] <= 50):
        print "Sleeping for 60 seconds"
        time.sleep(60)
    
    # Get the user timeline for a single user
    statuses = api.GetUserTimeline(screen_name=screen_name, count=TWEETS_TO_RETRIEVE)
    for s in statuses:
        outfile.write(screen_name)
        outfile.write('^&^&^') # Separator
        outfile.write(s.created_at.encode('ascii', 'replace'))
        outfile.write('^&^&^')
        outfile.write(s.text.encode('ascii', 'replace'))
        outfile.write("\n")

d = open("../data/Legislator-Info/data.csv", 'r')
out = open("../data/Legislator-Info/tweets.csv", 'w')
err = open("err.txt", 'w')

getAllTweets(d, out, err)

d.close()
out.close()
err.close()
