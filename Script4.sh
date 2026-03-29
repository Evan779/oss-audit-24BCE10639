#!/bin/bash
# Script 4: Log File Analyzer
# ---- Read command-line arguments ----
# $1 is the first argument: the path to the log file
LOG_FILE="$1"

# $2 is the optional second argument: keyword to search for (default: ERROR)
KEYWORD="${2:-ERROR}"

# Validate arguments
# Show usage instructions if no log file was provided
if [ -z "$LOG_FILE" ]; then
    echo "Usage: $0 <logfile> [keyword]"
    echo "Example: $0 /var/log/syslog ERROR"
    exit 1
fi

# Check the file exists and is readable
if [ ! -f "$LOG_FILE" ]; then
    echo "File '$LOG_FILE' not found."
    exit 1
fi

echo "  LOG FILE ANALYZER"
echo "File:    $LOG_FILE"
echo "Keyword: $KEYWORD"
#Initialise counters
TOTAL_LINES=0        # total lines read
MATCH_COUNT=0        # lines containing the keyword
FIRST_MATCH=""       # first line that matched,will be used for summary

# Read the file line by line with a while-read loop
# IFS= preserves leading/trailing whitespace; -r prevents backslash interpretation
while IFS= read -r LINE; do

    # Increment the total line counter for every line
    TOTAL_LINES=$((TOTAL_LINES + 1))

    # if-then: check whether the current line contains the keyword (case-insensitive)
    # The '*KEYWORD* glob pattern works inside [[ ]] with shopt -s nocasematch
    if echo "$LINE" | grep -qi "$KEYWORD"; then
        MATCH_COUNT=$((MATCH_COUNT + 1))

        # Save the very first matching line for display in the summary
        if [ $MATCH_COUNT -eq 1 ]; then
            FIRST_MATCH="$LINE"
        fi

        # Print each matching line with its match number
        echo "[$MATCH_COUNT] $LINE"
    fi

done < "$LOG_FILE"

# ---- Print the summary ----
echo "  SUMMARY"
echo "Total lines read  : $TOTAL_LINES"
echo "Lines with '$KEYWORD': $MATCH_COUNT"

# Calculate percentage only if there were lines to read
if [ $TOTAL_LINES -gt 0 ]; then
    PERCENT=$(awk "BEGIN { printf \"%.1f\", ($MATCH_COUNT / $TOTAL_LINES) * 100 }")
    echo "Match percentage  : ${PERCENT}%"
fi

if [ $MATCH_COUNT -gt 0 ]; then
    echo ""
    echo "First match: $FIRST_MATCH"
fi


