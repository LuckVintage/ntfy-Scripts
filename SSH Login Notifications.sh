#!/bin/bash
exec >/dev/null 2>&1
# Get the username of the user who logged in
SSH_USER="$SSH_CLIENT"
USERNAME=$(whoami)

# IP address of the user who logged in
IP_ADDRESS=$(echo "$SSH_USER" | awk '{print $1}')

# Date and time of the login
LOGIN_TIME=$(date)

# Your Curl command to send the information
curl -H "Authorization: Bearer tk_YOUR-TOKEN-HERE" -H "X-Priority: 5" -H "Title: New SSH Login (Server 2)" -H "Tags: computer,key,ssh_login" -d "Username: $USERNAME 
IP Address: $IP_ADDRESS
Login Time: $LOGIN_TIME" https://ntfy.sh/YOUR-TOPIC-HERE
