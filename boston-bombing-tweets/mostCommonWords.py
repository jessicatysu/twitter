#!/usr/bin/python

# Stolen shamelessly from StackOverflow

import sys,re

# 100 most common words in English
excluded_words = ['the', 'be', 'to', 'of', 'and', 'a', 'in', 'that',
'have', 'i', 'it', 'for', 'not', 'on', 'with', 'he', 'as', 'you', 'do',
'at', 'this', 'but', 'his', 'by', 'from', 'they', 'we', 'say', 'her',
'she', 'or', 'an', 'will', 'my', 'one', 'all', 'would', 'there', 'their',
'what', 'so', 'up', 'out', 'if', 'about', 'who', 'get', 'which', 'go',
'me', 'when', 'make', 'can', 'like', 'time', 'no', 'just', 'him', 'know',
'take', 'people', 'into', 'year', 'your', 'good', 'some', 'could', 'them',
'see', 'other', 'than', 'then', 'now', 'look', 'only', 'come', 'its',
'over', 'think', 'also', 'back', 'after', 'use', 'two', 'how', 'our',
'work', 'first', 'well', 'way', 'even', 'new', 'want', 'because', 'any',
'these', 'give', 'day', 'most', 'us']

# Takes one argument, the name of the file to analyze
f = open(sys.argv[1], 'r')
tweet_glob = ""
for tweet in f:
    tweet_glob += tweet

t = re.split('\W+',tweet_glob.lower())
r = sorted((-t.count(w),w)for w in set(t)-set(excluded_words))[:30]
print r
h=min(9*l/(77-len(w))for l,w in r)
print'',9*r[0][0]/h*'_'
for l,w in r:print'|'+9*l/h*'_'+'|',w
