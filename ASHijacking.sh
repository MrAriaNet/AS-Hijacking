#!/bin/bash

# Set your AS number , Example : AS57027
AS_NUMBER="YourASN"
# Fetch the prefixes from the URL and get the list of prefixes
PREFIXES=$(curl -s "https://stat.ripe.net/data/announced-prefixes/data.json?resource=$AS_NUMBER" | jq -r '.data.prefixes[].prefix')

# Read the allowed ranges from the ranges.txt file
ALLOWED_RANGES=$(cat ranges.txt)

# Loop through the prefixes and check if they are in the allowed ranges
for PREFIX in $PREFIXES; do
  if echo "$ALLOWED_RANGES" | grep -q "$PREFIX"; then
    # If the prefix is allowed, print in green
    echo -e "\033[0;32m$PREFIX is allowed\033[0m"
  else
    # If the prefix is not allowed, print in red and show the prefix
    echo -e "\033[0;31mWarning: $PREFIX is not an allowed range! AS $AS_NUMBER might be hijacked.\033[0m"
  fi
done
