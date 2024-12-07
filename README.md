# Smart Health Log

Simple script for logging the smart health of your drives.

Set it up with a root cron entry to make it easy to check when drives failed. Notification support coming soon. 

## Features

- Checks the SMART health status for multiple drives.
- Logs the health check results with timestamps.
- Lists failed drives, if any, in the output log and terminal.

## Prerequisites

1. **smartmontools** must be installed. Install it using your package manager.
2. This script requires root privileges to run smartctl commands

## Usage

1. Clone or download the script
2. Change ownership of the script to root `sudo chown root:root log_smart_health.sh`
3. Change privileges of script so it can be ran as root user `sudo chmod 700 log_smart_health.sh`
4. Open cron as root, `sudo crontab -e`
5. Add the crontab entry, for example `0 0 * * * /bin/bash /<location-of-script>/log_smart_health.sh`

## Configuration

 - Modify the `drives` array to include the device names of the drives you want to check.
   - `drives=("sda" "sdb" "sdc" "sdd")`
 - The script writes logs to a file named smart_health_log.txt in the current directory. You can change the filename and save location by updating the output_file variable:
   - `output_file="/<location-of-log>/your_custom_filename.txt"`
  
## Output

 - Terminal Output:
   - Displays the SMART health check status for each drive.
   - Indicates which drives passed or failed.
   - `Checking SMART health for /dev/sda...
      /dev/sda: SMART Health Check PASSED.
      Checking SMART health for /dev/sdb...
      /dev/sdb: SMART Health Check FAILED.
      The following drives failed: sdb`
 - Log File:
   - Appends a timestamped message indicating the health status of all checked drives.
   - `2024-12-06 10:30:00 - The following drives failed: sdb`
  
## Disclaimer

Use this script at your own risk. Always back up your data before diagnosing or testing storage devices.
  
