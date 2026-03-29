# Linux Systems Administration & Auditing Scripts

## Overview
This repository contains a suite of Bash scripts developed as part of a Linux Systems Administration Capstone Project. The scripts are designed to automate system profiling, audit file permissions, analyze system logs, and demonstrate core shell scripting concepts within an Ubuntu/Debian environment.

## 🛠️ Scripts Included

### 1. System Identity Profiler (`system_identity.sh`)
Extracts and displays the core hardware and operating system identity of the Linux machine.
* **Concepts:** System queries (`hostnamectl`, `lscpu`, `free`), network interface parsing (`ip`), and terminal text formatting.

### 2. FOSS Package Inspector (`Script2.sh`)
A utility to detect the active package manager (`dpkg` or `rpm`) and verify the installation status of specified open-source software (e.g., VLC, Python).
* **Concepts:** `case` statements, exit codes (`$?`), and command output suppression (`/dev/null`).

### 3. Disk & Permission Auditor (`Script3.sh`)
Scans common Linux directories and generates a cleanly formatted, column-aligned audit table detailing directory sizes, ownership, and permission strings.
* **Concepts:** `for` loops, arrays, `printf` formatting, and pipeline text extraction using `awk` and `cut`.

### 4. Log File Analyzer (`Script4.sh`)
Parses system logs (like `/var/log/dpkg.log` or `syslog`) line-by-line to count specific keywords, outputting a mathematical summary and match percentages.
* **Concepts:** `while read` loops, command-line arguments (`$1`, `$2`), arithmetic evaluation, and conditional logic.

### 5. Open Source Manifesto Generator (`Script5.sh`)
An interactive script that prompts the user for standard input, dynamically injects the variables into a multi-line string template, and outputs a personalized text file.
* **Concepts:** `read` prompts, command substitution, string manipulation (`tr`), and output redirection (`>`).

##  How to Run

To run any of these scripts on your local Linux machine, you must first ensure they have execute permissions.

1. Clone the repository or download the scripts.
2. Grant execute permissions:
   ```bash
   chmod +x script_name.sh
