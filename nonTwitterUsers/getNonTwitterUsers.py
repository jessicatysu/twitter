#!/usr/bin/python

# Creates a file containing the data we are really interested in, i.e.
# twitter_id,title,firstname,lastname,party,state,in_office,gender,age

from datetime import date

f = open("../data/legislators.csv", "r")
d = open("nonTwitterUsersInOffice.csv", "w")
count = 0
for person in f:
    data = person.split(",")
    # Skip first line
    if data[0] == "title": continue
    # Skip people without twitter handles
    if data[21] != "": continue
    if data[9] == '0': continue

    # Build data string
    newdata = data[0] + "," # title
    newdata += data[1] + "," + data[3] + "," # first and last name
    newdata += data[6] + "," + data[7] + "," # party, state
    newdata += data[10] + "," # gender
    
    # data[27] = birthdate; parse this
    dat = data[27].split("-")
    birth_date = date(int(dat[0]), int(dat[1]), int(dat[2].rstrip()))
    age = int((date.today() - birth_date).days/365.25)
    newdata += str(age) + "\n"
    
    # Write to file
    d.write(newdata)
    count += 1

d.close()
print str(count) + " congresspeople without Twitter accounts"
