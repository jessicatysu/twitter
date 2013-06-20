#!/usr/bin/python

import time
import twitter
# Logs into account "jsuPS120" with password "caltech" using OAuth
api = twitter.Api(consumer_key='kfCLfVgcpV87LwYnjBLnFw',
                     consumer_secret='SEO4WAY5GdedrVBS8Hz11XQtuShmOt1uudMkAJTc',
                     access_token_key='1345392391-UfUoO1hii6MNZ8ZWfvDL4c00ZhCu6mHKVggLCJs',
                     access_token_secret='g6HzksnRUrqQLxo2XCBtvtiDL4idUt8P8EcnXTTHjI')

#print api.GetUser("BarackObama").friends_count

# print api.GetRateLimitStatus()[u'remaining_hits']

#statuses = api.GetUserTimeline(screen_name="BarackObama", count=2);
#print [s.text for s in statuses]
#print [s.created_at for s in statuses]
#print [s.user for s in statuses]
#
#for s in statuses:
#    print type(s.text.encode('ascii', 'replace'))
#    print type(s.created_at)


def getAllTweets(congress_data, outfile):
    count = 0
    for person in congress_data:
        data = person.split(',')
        try:
            statuses = api.GetUserTimeline(screen_name=data[0], count=200)
            for s in statuses:
                outfile.write(data[0])
                outfile.write('^&^&^') # Separator
                outfile.write(s.created_at.encode('ascii', 'replace'))
                outfile.write('^&^&^')
                outfile.write(s.text.encode('ascii', 'replace'))
                outfile.write("\n")
        except:
            print "Error on " + data[0]
            continue

        # Tell which rep we're on
        count += 1
        print '[' + str(count) + ']' + data[1] + ', ' + data[2] + ' ' + data[3]

#d = open("../data/data-small.csv", 'r')
#d1 = open("../data/data1.csv", 'r')
#d2 = open("../data/data2.csv", 'r')
d3 = open("../data/data3.csv", 'r')
#out = open("../data/tweets-small.csv", 'w')
#out = open("../data/tweets1.csv", 'w')
#out = open("../data/tweets2.csv", 'w')
out = open("../data/tweets3.csv", 'w')

#getAllTweets(d, out)
#getAllTweets(d1, out)
#time.sleep(1000)
#getAllTweets(d2, out)
#time.sleep(1000)
getAllTweets(d3, out)

#d.close()
#d1.close()
#d2.close()
d3.close()
out.close()
