#🛰️ Remote Server Health Suite
A professional, defensive Bash script for monitoring fleet health. This tool automates the process of checking system vitals across multiple remote servers using secure SSH tunneling.

🛠️ Key Architectural Features
Strict Error Handling: Uses set -euo pipefail to ensure the script terminates safely on any command failure or undefined variable.

Log Lifecycle Management: Implements a self-cleaning mechanism using trap to handle temporary log files, ensuring no clutter is left on the host system.

Non-Intrusive SSH: Designed with -n and ConnectTimeout to handle unresponsive hosts without hanging the main process.

Security Insight: Scans remote /var/log/auth.log for failed password attempts to detect potential brute-force attacks.

📊 Diagnostics Covered
The script fetches and calculates the following for each remote machine:

System Uptime: How long the server has been running.

Disk Integrity: Current usage percentage of the Root (/) partition.

Memory Optimization: Precise calculation of used vs. total memory (percentage based).

Security Audit: Count of failed login attempts.

🚀 Installation & Usage
1. Requirements
SSH Key-based authentication (to run without password prompts).

Remote user should have read access to system logs.

2. Setup

```bash
# Clone the repository
git clone https://github.com/Kurtbey1/Server-Health-Care.git

# Navigate to directory
cd Server-Health-Care

# Make the script executable
chmod +x health_check.sh
```

3. Execution
Create a servers.txt file with your server IPs/Hostnames:
```Plaintext
192.168.1.100
production.myserver.com
```

Run the check:
```bash
./health_check.sh -f servers.txt -u username
```
⚙️ Command Line Arguments 
Argument Description -f Path to the file containing server list.-u SSH Username for remote access.-h Display help and usage information.
🏗️ Future Roadmap
[ ] Add Parallel execution (Background jobs) for faster scanning of large clusters.

[ ] Implement Slack/Discord webhook notifications for high disk usage.

[ ] Export results to JSON format for dashboard integration.

<p align="center">Developed with 🔥 by <strong>Abdelrahman</strong></p>
