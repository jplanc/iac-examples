#!/usr/bin/env python3

import sys

# Read in the log file
try:
    input_file = open(sys.argv[1], 'r')
    lines = input_file.readlines()
except:
    print('Error: Please provide log file')
    exit(1)    

# Extract the IPs from the file lines
ip_list = []
for line in lines:
    ip = line.split(' ')[1]
    ip_list.append(ip)

# Count the instances of each IP
ip_counts = []
for ip in ip_list:
    count = ip_list.count(ip)
    ip_counts.append(count)

# Combine and sort the IP and count list
ip_array = sorted(zip(ip_counts, ip_list), reverse=True)

# Pull out duplicates
unique_list = []
for elem in ip_array:
    if elem not in unique_list:
        unique_list.append(elem)

# Print out the counts and IPs
for elem in unique_list:
    print(elem[0], elem[1])
