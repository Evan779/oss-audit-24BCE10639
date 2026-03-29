#!/bin/bash
# Script 3: Disk and Permission Auditor

echo "  DISK AND PERMISSION AUDITOR"

printf "\n%-30s %-12s %-12s %s\n" "Directory" "Size" "Owner" "Permissions"
# List of directories to audit
# These are common Linux directories/
DIRS=(
    /etc
    /var/log
    /home
    /usr
    /tmp
    /opt
)

# Loop through each directory

for DIR in "${DIRS[@]}"; do

    # Check that the directory actually exists before inspecting it
    if [ -d "$DIR" ]; then

        # 'du -sh' returns a human-readable size for the directory (-s = summary, -h = human)
        # 'cut -f1' keeps only the size field before the tab
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # 'ls -ld' lists directory metadata
        # awk '{print $3}' extracts the owner
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')

        # awk '{print $1}' extracts the permissions string
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')

        # printf aligns output into neat columns
        printf "%-30s %-12s %-12s %s\n" "$DIR" "$SIZE" "$OWNER" "$PERMS"

    else
        # If the directory is missing, note it rather than silently skipping
        printf "%-30s %-12s\n" "$DIR" "[NOT FOUND]"
    fi

done

echo ""
echo "Audit complete."
