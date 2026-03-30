# Linux Systems Administration & Auditing Scripts


## Scripts Included

### 1. System Identity Profiler Script (`Script1.sh`)
This script retrieves and displays essential information about the Linux machine’s hardware and operating system.
* **Concepts:** System queries using `hostnamectl`, `lscpu`, `free`; network interface parsing using `ip`; terminal text formatting.

### 2. FOSS Package Inspector Script (`Script2.sh`)
This script identifies the installed package manager type on the Linux system, whether `dpkg` or `rpm`, and checks for the installation of various free/open-source software packages such as VLC media player, Python, etc.
* **Concepts:** Use of `case` statements, exit codes using `$?`, suppressing output to the screen using `/dev/null`.

### 3. Disk & Permission Auditor Script (`Script3.sh`)
This script scans common Linux system directories, creating a clean, column-aligned table displaying disk space, ownership, and permission strings.
* **Concepts:** Use of `for` loops, arrays, `printf`, and using `awk`, `cut` to extract text strings.

### 4. Log File Analyzer Script (`Script4.sh`)
This script reads system log files, such as `/var/log/dpkg.log`, line by line, to count specific keyword occurrences, displaying a mathematical calculation with percentages.
* **Concepts:** Use of `while read`, using `$1`, `$2`, arithmetic evaluation, conditional logic.

### 5. Open Source Manifesto Generator Script (`Script5.sh`)
This script is an interactive shell script that asks the user for standard input, dynamically inserts user variables into a multi-line string template, and writes the customized text to a new file.
* **Concepts:** Use of `read`, command substitution, string manipulation using `tr`, output redirection using `>`.

## How to Run
To use any of these scripts on your local Linux machine, you'll first need to make sure they're executable.

1. Download the scripts from this repository.
2. Change permissions to allow execution:
```bash
chmod +x script_name.sh
