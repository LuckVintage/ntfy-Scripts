#!/bin/bash

# Set the threshold for CPU usage
THRESHOLD=40

# Get the current CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d. -f1)

# Get the current date and time in the desired format with AM/PM
CURRENT_DATE=$(date +"%a %d %b %Y %I:%M:%S %p")

# Check if CPU usage is greater than or equal to the threshold
if [ "$CPU_USAGE" -ge "$THRESHOLD" ]; then
    # If the condition is met, send the cURL request
    curl -H "Authorization: Bearer tk_YOUR-TOKEN-HERE" \
         -H "Tags: computer,warning,fire,cpu_alerts" \
         -H "X-Priority: 5" \
         -H "X-Title: CPU Usage Alert on Server 4!" \
         -d "The CPU usage on server 4 at $CURRENT_DATE was $CPU_USAGE%." \
         https://ntfy.sh/YOUR-TOPIC-HERE
fi
