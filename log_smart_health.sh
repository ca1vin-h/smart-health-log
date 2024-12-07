#!/bin/bash

# Drives to check
drives=("sda" "sdb" "sdc" "sdd")

# Output file
output_file="smart_health_log.txt"

# Get the current timestamp
timestamp=$(date +"%Y-%m-%d %H:%M:%S")

# Initialize variables
failed_drives=()
all_passed=true

# Check each drive
for drive in "${drives[@]}"; do
    echo "Checking SMART health for /dev/$drive..."
    # Run smartctl health check
    output=$(sudo smartctl -H /dev/$drive 2>&1)
    
    # Check the result
    if echo "$output" | grep -q "PASSED"; then
        echo "/dev/$drive: SMART Health Check PASSED."
    else
        echo "/dev/$drive: SMART Health Check FAILED."
        failed_drives+=("$drive")
        all_passed=false
    fi
done

# Write results to the output file
if $all_passed; then
    echo "$timestamp - All drives passed." >> "$output_file"
    echo "All drives passed."
else
    echo "$timestamp - The following drives failed: ${failed_drives[*]}" >> "$output_file"
    echo "The following drives failed: ${failed_drives[*]}"
fi
