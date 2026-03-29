#!/bin/bash
# Script 1: System Identity Report
# Author: U Evan Steve | Course: Open Source Software
# Variables
STUDENT_NAME="U Evan Steve"
SOFTWARE_CHOICE="VLC"
# Distribution name and kernel version
# uname -r returns the kernel release string
KERNEL=$(uname -r)
# lsb_release -ds gives distro description
# If lsb_release is unavailable, fall back to /etc/os-release
if command -v lsb_release &>/dev/null; then
    DISTRO=$(lsb_release -ds)
else
    DISTRO=$(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')
fi
echo -e "\nOperating System:  $DISTRO"
echo -e "Kernel Version:    $KERNEL"
# Current user and home directory
# $USER is a built-in shell variable for the logged-in user
# $HOME is the user's home directory path
echo -e "\nLogged-in User:    $USER"
echo -e "Home Directory:    $HOME"

# System uptime and current date/time
# uptime -p returns a human-readable uptime string
UPTIME=$(uptime -p)

# date with a format string produces a readable timestamp
DATETIME=$(date "+%A, %d %B %Y  %H:%M:%S")

echo -e "\nSystem Uptime:  $UPTIME"
echo -e "Current Date/Time: $DATETIME"

# Open-source license covering the OS
# Most Linux distributions are covered by the GNU GPL and related licences
echo -e "\nOpen-Source License:"
echo "  The Linux kernel and most components of this operating system are"
echo "  distributed under the GNU General Public License version 2 (GPLv2)"
echo "  or later. This licence gives you the freedom to run, study, share,"
echo "  and modify the software."
