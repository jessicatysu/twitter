#!/usr/bin/python

import re

infile = open("../data/tweets-6-12.csv", 'r')
outfile = open("../data/tweets-6-12-removeBadLines.csv", 'w')

for line in infile:
    if (re.search("\^\&\^\&\^", line)):
        outfile.write(line)

infile.close()
outfile.close()
