#!/usr/bin/python

import time
import twitter

# Logs into account "jsuPS120" with password "caltech" using OAuth
api = twitter.Api(consumer_key='kfCLfVgcpV87LwYnjBLnFw',
                     consumer_secret='SEO4WAY5GdedrVBS8Hz11XQtuShmOt1uudMkAJTc',
                     access_token_key='1345392391-UfUoO1hii6MNZ8ZWfvDL4c00ZhCu6mHKVggLCJs',
                     access_token_secret='g6HzksnRUrqQLxo2XCBtvtiDL4idUt8P8EcnXTTHjI')

# print api.VerifyCredentials() # Credentials verified

# print api.GetUser("BarackObama").statuses_count
# print api.GetUser("BarackObama").followers_count
# print api.GetUser("BarackObama").friends_count

# print api.GetRateLimitStatus()[u'remaining_hits']

d = open('data3.csv', 'r')
out = open('out3.csv', 'w')
count = 0
for person in d:
#    # Only allows for a certain number of queries every 15 minutes
#    if api.GetRateLimitStatus()[u'remaining_hits'] <= 0:
#        time.sleep(60 * 15)

#    if count % 180 == 0:
#        for i in range(15):
#            print 'Rate limited: wait ' + str(15 - i) + ' minutes'
#            time.sleep(60)

    data = person.split(',')
    try:
        u = api.GetUser(data[0]) # Gets user info
    except:
        print "Error on " + data[0]
        continue

    count += 1 # Tell which rep we're on

    print '[' + str(count) + '] ' + data[1] + '. ' + data[2] + ' ' + data[3]

    # Gets time (in 30-day-blocks) since account creation
    then = time.strptime(u.created_at, '%a %b %d %H:%M:%S +0000 %Y')
    now = time.localtime()
    months = (time.mktime(now) - time.mktime(then)) / 3600 / 24 / 30

    out.write(person.rstrip() + ',' + str(u.statuses_count) + ',')
    out.write(str(int(months)) + ',' + str(u.followers_count) + ',')
    out.write(str(u.friends_count) + '\n')

d.close()
out.close()
