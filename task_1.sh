#!/bin/bash

# List of websites to check
websites=("https://google.com" "https://facebook.com" "https://twitter.com")

# Log file to store results
log_file="website_status.log"

# Clear previous log file content
> "$log_file"

# Check each website's availability
for site in "${websites[@]}"
do
    response=$(curl -Is "$site" | head -n 1)
    if [[ $response == *"200 OK"* ]]; then
        echo "$site is UP" | tee -a "$log_file"
    else
        echo "$site is DOWN" | tee -a "$log_file"
    fi
done

echo "Results have been saved in $log_file."
