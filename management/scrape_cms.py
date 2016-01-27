#!/usr/env python

"""
Scrapes the CSV file produced by CMS to get the current list of netids.
"""

import csv

netids = []
with open('CS_4220_student_table.csv', 'r') as csvfile:
    reader = csv.reader(csvfile, delimiter=',')
    for row in reader:
        if row[2] != "NetId":
            netids.append(row[2])

netids.sort()
with open('netids-cms.txt', 'w') as f:
    for netid in netids:
        f.write("{0}\n".format(netid))
