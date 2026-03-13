#!/usr/bin/env bash

# Exit on error, undefined variables, and pipe failures
set -euo pipefail

# Create a secure temporary log file
LOG_FILE=$(mktemp /tmp/server_health.XXXXXX)
readonly LOG_FILE

# Function to log informational messages
log_info() {
    echo "[INFO] $(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

# Function to log error messages to stderr and the log file
log_error() {
    echo "[ERROR] $(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE" >&2
}

# Cleanup function to remove the log file on exit
cleanup() {
    echo -e "\n[CLEANUP] Removing temporary log file: $LOG_FILE"
    rm -f "$LOG_FILE"
}

# Set trap to ensure cleanup runs on exit or interruption
trap cleanup EXIT INT TERM

# Function to perform health checks on a remote server via SSH
check_server() {
    local server="$1"
    local user="$2"

    log_info "--- Starting Health Check: $server ---"
    
    # -n prevents ssh from consuming stdin; 5s timeout for unresponsive hosts
    ssh -n -q -o ConnectTimeout=5 "${user}@${server}" << 'EOF'
        echo "1. System Uptime:"
        uptime
        
        echo "2. Disk Usage (Root/):"
        df -h / | awk 'NR==2 {print "   Used: " $5 " (" $3 "/" $2 ")"}'
        
        echo "3. Memory Usage:"
        free -m | awk 'NR==2 {printf "   Used: %sMB / Total: %sMB (%.2f%%)\n", $3, $2, ($3/$2)*100}'
        
        echo "4. Security Check (Failed Logins):"
        if [ -f /var/log/auth.log ]; then
            echo "   Failed attempts: $(grep -c "Failed password" /var/log/auth.log || echo 0)"
        else
            echo "   Log file /var/log/auth.log not found."
        fi
EOF
    log_info "--- Finished Health Check: $server ---"
}

# Function to display help/usage information
print_usage() {
    echo "Usage: $0 -f <server_list_file> -u <ssh_user>"
    echo "  -f: Path to file containing server IPs/Hostnames (one per line)."
    echo "  -u: The remote SSH username."
    echo "  -h: Display this help message."
}

# Main script logic
main() {
    local server_file=""
    local remote_user=""

    # Parse command line arguments
    while getopts "f:u:h" opt; do
        case "$opt" in
            f) server_file="$OPTARG" ;;
            u) remote_user="$OPTARG" ;;
            h) print_usage; exit 0 ;;
            *) print_usage; exit 1 ;;
        esac
    done

    # Validate that required arguments are provided
    if [[ -z "${server_file:-}" || -z "${remote_user:-}" ]]; then
        log_error "Missing required arguments."
        print_usage
        exit 1
    fi

    # Check if the server list file exists
    if [[ ! -f "$server_file" ]]; then
        log_error "Server list file not found: $server_file"
        exit 1
    fi

    # Read server file into an array, skipping comments and empty lines
    declare -a servers=()
    while IFS= read -r line || [[ -n "$line" ]]; do
        [[ -z "$line" || "$line" =~ ^# ]] && continue
        servers+=("$line")
    done < "$server_file"

    # Ensure the list is not empty
    if [[ ${#servers[@]} -eq 0 ]]; then
        log_error "The server file is empty or contains only comments."
        exit 1
    fi

    log_info "Configuration valid. Checking ${#servers[@]} servers..."

    # Loop through each server in the array
    for server_host in "${servers[@]}"; do
        check_server "$server_host" "$remote_user"
    done

    log_info "Script execution finished successfully."
}

# Execute the main function with all passed arguments
main "$@"
