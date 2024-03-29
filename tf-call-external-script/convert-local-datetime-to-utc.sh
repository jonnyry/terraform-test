#!/bin/bash

#
# Convert a datetime in local time to UTC 
#
# Param (on stdin):
#
# { 
#   "datetime_in_local_time": "2024-03-27T11:00:00" 
#   "timezone": "Europe/London"
# }
#
# Response:
#
# { "datetime_in_utc": "2024-03-27T11:00:00" }
#


# read stdin
read -r SCRIPT_PARAMS

# unpack the run_time parameter
DATETIME_LOCAL_INPUT=$(echo "$SCRIPT_PARAMS" | jq -r '.datetime_in_local_time')
TIMEZONE=$(echo "$SCRIPT_PARAMS" | jq -r '.timezone')

DATETIME_LOCAL=$(TZ="$TIMEZONE" date --date "$DATETIME_LOCAL_INPUT")
DATETIME_UTC=$(date --utc --date "$DATETIME_LOCAL" +"%Y-%m-%dT%H:%M:%SZ")

# send response
echo "{ \"datetime_in_utc\": \"$DATETIME_UTC\" }"

