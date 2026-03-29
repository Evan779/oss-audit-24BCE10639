#!/bin/bash
# Script 2: FOSS Package Inspector
PACKAGE="vlc"

echo "  FOSS Package Inspector: $PACKAGE"

# Detect the package manager available on this system
# command -v checks whether a command exists without running it
if command -v dpkg &>/dev/null; then
    PKG_MANAGER="dpkg"
elif command -v rpm &>/dev/null; then
    PKG_MANAGER="rpm"
else
    echo "No supported package manager found "
    exit 1
fi

echo -e "\nPackage manager detected: $PKG_MANAGER"

# Check whether the package is installed
if [ "$PKG_MANAGER" = "dpkg" ]; then
    # dpkg -l | grep searches the installed package list; grep -q suppresses output
    dpkg -l | grep -q "^ii.*${PACKAGE}"
    INSTALLED=$?
elif [ "$PKG_MANAGER" = "rpm" ]; then
    rpm -q "$PACKAGE" &>/dev/null
    INSTALLED=$?
fi

# Branch on install status
if [ $INSTALLED -eq 0 ]; then
    echo -e "\nStatus: INSTALLED "

    # Retrieve the version
    if [ "$PKG_MANAGER" = "dpkg" ]; then
        # dpkg -l lists packages; awk extracts the version
        VERSION=$(dpkg -l "$PACKAGE" 2>/dev/null | grep "^ii" | awk '{print $3}')
    else
        VERSION=$(rpm -qi "$PACKAGE" 2>/dev/null | grep "^Version" | awk '{print $3}')
    fi

    echo "Version: $VERSION"

else
    echo -e "\nStatus: NOT INSTALLED "
    echo "Tip: Install with  'sudo apt install vlc'  or  'sudo dnf install vlc'"
fi

# Case statement: To print a description based on package name
# The case statement matches the package name to a known FOSS application
echo ""
case "$PACKAGE" in
    vlc)
        echo "Description: VLC Media Player"
        echo "  VLC is a free and open-source, cross-platform multimedia player"
        echo "  released under the GNU General Public Licence (GPL) version 2."
        echo "  It plays most audio and video formats without needing extra codecs,"
        echo "  and can also stream media over a network."
        echo "  Project site: https://www.videolan.org/vlc/"
        ;;
    python)
        echo "Description: Python Programming Language"
        echo "  A high-level, interpreted programming language known for its readability."
        echo "  It is widely used for web development, software engineering, and machine learning."
        ;;
    firefox)
        echo "Description: Mozilla Firefox"
        echo "  A free and open-source web browser developed by the Mozilla Foundation."
        ;;
    *)
        echo "Description: No description available for package '$PACKAGE'."
        ;;
esac
