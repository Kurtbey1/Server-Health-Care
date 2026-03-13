# 🛸 FleetSentinel: Enterprise Server Health Suite
> **Defensive, Automated, and Robust. Monitor your infrastructure like a Pro.**
<p align="center">
  <a href="https://github.com/Kurtbey1/Server-Health-Care">
    <img src="https://img.shields.io/badge/FLEET%20SENTINEL-INFRASTRUCTURE%20MONITOR-red?style=for-the-badge&labelColor=black&logo=target" width="100%" />
  </a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Security-STRICT_MODE-black?style=for-the-badge&logo=shred&logoColor=red" />
  <img src="https://img.shields.io/badge/System-LINUX-red?style=for-the-badge&logo=linux&logoColor=black" />
  <img src="https://img.shields.io/badge/Core-BASH-black?style=for-the-badge&logo=gnu-bash&logoColor=red" />
</p>

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
## ⚙️ Command Line Arguments

| Argument | Description |
| :---: | :--- |
| `-f` | **Path** to the file containing server list (one per line). |
| `-u` | **SSH Username** for remote access. |
| `-h` | Display help and usage information. |


🏗️ Future Roadmap
[ ] Add Parallel execution (Background jobs) for faster scanning of large clusters.

[ ] Implement Slack/Discord webhook notifications for high disk usage.

[ ] Export results to JSON format for dashboard integration.

<p align="center">Developed with 🔥 by <strong>Abdelrahman</strong></p>
