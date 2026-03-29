#!/bin/bash
# Script 5: The Open Source Manifesto Generator

# Alias concept
# In an interactive shell you could define: alias today=date "+%d %B %Y
# and then call today to get the formatted date. Inside a non-interactive
# script, aliases are disabled by default, so we use a function instead —
# the underlying concept (giving a command a shorter, memorable name) is identical.
today() { date "+%d %B %Y"; }
echo "  OPEN SOURCE MANIFESTO GENERATOR"
echo "Answer three short questions and your personalised open-source"
echo "philosophy statement will be written to a text file."


# Question 1: user's name
read -rp "1. What is your name? " USER_NAME

# Question 2: favourite FOSS project
read -rp "2. What is your favourite open-source project? (example - VLC, Linux, Firefox) " FOSS_PROJECT

# Question 3: core open-source value
read -rp "3. What open-source value matters most to you? (example - /freedom, transparency, collaboration) " OS_VALUE

# Compose the manifesto using string concatenation
# Each variable is embedded directly inside the double-quoted string
MANIFESTO="Open Source Manifesto
Generated on: $(today)
Author: $USER_NAME

I, $USER_NAME, believe that open-source software is one of the most
important movements in the history of computing.

My favourite open-source project is $FOSS_PROJECT. It embodies the
principles of community-driven development and demonstrates that
software built in the open can rival — and often surpass — proprietary
alternatives.

Above all, I value $OS_VALUE in software. When source code is freely
available, users are not just consumers; they become collaborators,
auditors, and innovators. $OS_VALUE ensures that technology serves
people rather than controlling them.

I commit to supporting open-source software, contributing where I can,
and sharing the knowledge I gain so that others may build upon it.

-- $USER_NAME, $(today)"

# Writing the manifesto to a .txt file using > (redirect)
# The filename is derived from the user's name with spaces replaced by underscores
SAFE_NAME=$(echo "$USER_NAME" | tr ' ' '_')
OUTPUT_FILE="${SAFE_NAME}_manifesto.txt"

echo "$MANIFESTO" > "$OUTPUT_FILE"

# Output
echo "  Your manifesto has been saved to: $OUTPUT_FILE"
cat "$OUTPUT_FILE"
