The legislators.csv table is downloaded from the Sunlight Congress API, on 
April 10th 2013.  It contains information about all the legislators.

The data.csv table is a processed version of the legislators.csv table that
contains only the information we want (twitter_id, Rep/Sen, first name,
last name, party, state, gender, age).

data1.csv, data2.csv, data3.csv is just data.csv split into three parts.

data-small.csv is a small dataset used for debugging.

out1.csv, out2.csv, out3.csv contain the information in data1.csv,
data2.csv, data3.csv, except they also contain the number of followers,
number following, and number of tweets of the legislator.
