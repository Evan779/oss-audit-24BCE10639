# Linux Systems Administration & Auditing Scripts

A collection of five Bash shell scripts developed as part of an Open Source Software Capstone Project. These scripts demonstrate core Linux system administration concepts including system profiling, package inspection, disk auditing, log analysis, and file generation.

## Prerequisites

- A Linux-based operating system (Ubuntu/Debian or RPM-based distro)
- Bash shell (`/bin/bash`)
- Standard Linux utilities: `hostnamectl`, `lscpu`, `ip`, `awk`, `grep`, `dpkg` or `rpm`

## Scripts Included

### 1. System Identity Profiler (`Script1.sh`)
Retrieves and displays essential information about the Linux machine's hardware and operating system.
- **Concepts:** System queries using `hostnamectl`, `lscpu`, `free`; network interface parsing using `ip`; terminal text formatting.

### 2. FOSS Package Inspector (`Script2.sh`)
Identifies the installed package manager (`dpkg` or `rpm`) and checks for the installation of free/open-source software packages such as VLC, Python, etc.
- **Concepts:** `case` statements, exit codes using `$?`, suppressing output using `/dev/null`.

### 3. Disk & Permission Auditor (`Script3.sh`)
Scans common Linux system directories and displays disk space, ownership, and permission strings in a clean, column-aligned table.
- **Concepts:** `for` loops, arrays, `printf`, `awk`, and `cut`.

### 4. Log File Analyzer (`Script4.sh`)
Reads system log files (e.g., `/var/log/dpkg.log`) line by line, counts keyword occurrences, and displays a statistical summary with percentages.
- **Concepts:** `while read`, positional parameters `$1`/`$2`, arithmetic evaluation, conditional logic.

### 5. Open Source Manifesto Generator (`Script5.sh`)
An interactive script that prompts the user for input, inserts responses into a multi-line template, and saves the result as a new `.txt` file.
- **Concepts:** `read`, command substitution, string manipulation using `tr`, output redirection using `>`.

## How to Run

1. Clone or download the scripts from this repository.
2. Make the script executable:
```bash
chmod +x script_name.sh
```
3. Run the script:
```bash
./script_name.sh
```

> **Note:** Script 4 requires two arguments — the log file path and the keyword to search for:
> ```bash
> ./Script4.sh /var/log/dpkg.log ERROR
> ```

## Author

Developed as part of an Open Source Software Capstone Project exploring VLC Media Player and Linux system administration.
