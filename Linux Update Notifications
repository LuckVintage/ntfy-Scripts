#!/bin/bash

# Update package lists
sudo apt-get update

# Check for upgradable packages without performing the upgrade
UPGRADES=$(sudo apt-get upgrade --dry-run | grep 'upgraded,' | awk '{print $1}')

# Debugging: Output the number of upgrades found
echo "Number of upgrades: $UPGRADES"

# Check if there are upgrades available
if [ "$UPGRADES" -gt 0 ]; then
    # Debugging: Output a message when upgrades are found
    echo "Upgrades found: Sending notification"

    # If upgrades are available, send a cURL request with the number of upgrades
    curl -H "Authorization: Bearer tk_YOUR-TOKEN-HERE" \
         -H "Tags: computer,information_source,server_updates" \
         -H "X-Title: Updates available for Server 2!" \
         -d "There are $UPGRADES updates available. Please manually apply these as soon as possible." \
         https://ntfy.sh/YOUR-TOPIC-HERE
else
    # Debugging: Output a message when no upgrades are found
    echo "No upgrades found: No notification sent"
fi
