#!/usr/bin/python
import sys
from subprocess import call
try:
    f = open(sys.argv[1], 'r')
except:
    call(["ls"])
    sys.exit()
avg = 0
count = 0
for num in f:
    avg += float(num.rstrip())
    count += 1

print avg / count
