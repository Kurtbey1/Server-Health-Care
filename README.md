# 🛸 FleetSentinel: Enterprise Server Health Suite
> **Defensive, Automated, and Robust. Monitor your infrastructure like a Pro.**

[![Security: Strict Mode](https://img.shields.io/badge/Security-Strict_Mode-red.svg?style=for-the-badge)](https://github.com/Kurtbey1/Server-Health-Care)
[![Shell: Bash](https://img.shields.io/badge/Shell-Bash_5.0+-4EAA25.svg?style=for-the-badge)](https://www.gnu.org/software/bash/)
[![Uptime: 99.9%](https://img.shields.io/badge/Reliability-Proven-blue.svg?style=for-the-badge)](https://github.com/Kurtbey1/Server-Health-Care)

```text
    __  ___      __     __    __  __               
   /  |/  /___  / /_   / /   / / / /____  ____ ___ 
  / /|_/ / __ \/ __ \ / /   / /_/ / __  \/ __ `__ \
 / /  / / /_/ / /_/ // /___/ __  / /_/ / / / / / / /
/_/  /_/\____/_.___//_____/_/ /_/\____/_/ /_/ /_/ / 
        THE SENTINEL OF YOUR INFRASTRUCTURE
```

🛡️ Why FleetSentinel?
Standard monitoring tools are often heavy and hard to configure. FleetSentinel is a lightweight, zero-dependency Bash engine that gives you raw, honest diagnostics through secure SSH tunnels.

🔴 Critical Defensive Layers (Safety First)
```Diff
- 1. EXIT ON ERROR: Uses 'set -euo pipefail'. If a command fails, the script dies safely.
- 2. ZERO CLUTTER: The 'trap' mechanism wipes all temporary logs even if you kill the process.
- 3. NON-BLOCKING: Built-in 'ConnectTimeout' ensures a dead server doesn't freeze your audit.
- 4. SECURE AUTH: Designed specifically for SSH-Key environments.
```

| Metric | Intelligence Gathered | Alert Threshold |
| :--- | :--- | :---: |
| **System Uptime** | Precise days/hours/minutes | 🟢 |
| **Disk Integrity** | Root (/) partition usage analysis | 🟠 > 80% |
| **RAM Utilization** | Live calculation of Used vs Total (MB) | 🔴 > 90% |
| **Security Audit** | Bruteforce detection via `/var/log/auth.log` | 💀 |

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
