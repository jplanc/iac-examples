#!/bin/bash

# Check for provided log file
if [ $# -eq 0 ]
  then
    echo "Error: Please provide log file"
    exit 1
fi

input_file="$1"

# Loop through the log file and pull out the IPs
while read line; do
    ip=$(echo $line | cut -d\  -f2)
    ip_array+=("$ip") 
done < $input_file

# Sort the list of IPs with sort
# Use uniq to get the counts
# Display the counts in descending numerical order with sort -rn
# Use sed to trim leading whitespace added by uniq (via Stackoverflow)
for ip in ${ip_array[*]}; do
  echo $ip
done | sort | uniq -c | sort -rn | sed -e 's/^[[:space:]]*//'
