#!/usr/bin/python

data = open('../data/tweets-6-12-removeBadLines.csv', 'r')
out = open('../data/tweets_parsed-6-12.csv', 'w')

def getMonth(s):
    return {'Jan': '01', 'Feb': '02', 'Mar': '03', 'Apr': '04', 
        'May': '05', 'Jun': '06', 'Jul': '07', 'Aug': '08', 'Sep': '09',
        'Oct': '10', 'Nov': '11', 'Dec': '12'}[s]

for tweet in data:
    try:
        stuff = tweet.split("^&^&^")
        date = stuff[1].split(" ")
    except:
        print "Error on tweet:\n" + tweet
        continue
    out.write(stuff[0] + "^&^&^")
    # YYYY-
    out.write(date[4] + "-")
    # MM-
    out.write(getMonth(date[1]) + "-")
    # DD-
    out.write(date[2] + " ")
    # HH:MM:SS
    out.write(date[3] + "^&^&^")
    
    # tweet
    out.write(stuff[2])


data.close()
out.close()
