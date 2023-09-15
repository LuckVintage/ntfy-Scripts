#!/bin/bash

# Fetch the current public IP address
IP=$(curl -L  "https://api.ipify.org/")

# If the IP address could not be obtained, send an error message to ntfy server and exit with an error
if [ -z "$IP" ]; then
  # Replace the following line with your ntfy server query for error message
  curl -H "Authorization: Bearer tk_YOUR-TOKEN-HERE" -H "Title: IP Fetch Error" -H "Tags: warning,ip_updates" -d   "An error occurred while fetching your public IP address." https://ntfy.sh/YOUR-TOPIC-HERE
  exit 1
fi

# Read the IP address from the last time the script was run
OLD_IP=""
if [ -f old_ip.txt ]; then
  OLD_IP=$(cat old_ip.txt)
fi

# If the IP address has changed, make a query to your ntfy server
if [ "$IP" != "$OLD_IP" ]; then
  # Replace the following line with your ntfy server query for IP change message
  curl -H "Authorization: Bearer tk_YOUR-TOKEN-HERE" -H "Title: IP Changed" -H "Tags: computer,ip_updates" -d "Your public IP address has changed to $IP" https://ntfy.sh/YOUR-TOPIC-HERE
  # Update the IP address stored in old_ip.txt
  echo "$IP" > old_ip.txt
fi
