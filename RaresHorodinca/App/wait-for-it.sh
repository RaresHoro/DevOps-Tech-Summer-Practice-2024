#!/usr/bin/env bash
# wait-for-it.sh

set -e

# Usage function
usage() {
    echo "Usage: $0 host:port [-t timeout] -- command args..."
    echo "   or: $0 -h|--help"
    echo
    echo "Wait for a service to be available before executing a command."
    echo
    echo "Arguments:"
    echo "  host:port     The host and port to wait for."
    echo "  -t timeout    Timeout in seconds before giving up. Default is 15 seconds."
    echo "  -- command    Command to execute after the service is available."
    echo "  -h|--help     Show this help message."
}

# Default timeout
TIMEOUT=15

# Parse arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -t|--timeout) TIMEOUT="$2"; shift ;;
        -h|--help) usage; exit 0 ;;
        *)
            if [[ -z "$HOST" ]]; then
                HOST="$1"
            elif [[ -z "$COMMAND" ]]; then
                COMMAND="$1"
            else
                COMMAND="$COMMAND $1"
            fi
            ;;
    esac
    shift
done

# Check for required arguments
if [[ -z "$HOST" || -z "$COMMAND" ]]; then
    echo "Error: Missing required arguments."
    usage
    exit 1
fi

# Function to check if the service is available
check_service() {
    nc -z "$HOST" >/dev/null 2>&1
}

# Wait for the service to be available
START_TIME=$(date +%s)
while ! check_service; do
    if [[ $(($(date +%s) - START_TIME)) -ge $TIMEOUT ]]; then
        echo "Timeout waiting for $HOST"
        exit 1
    fi
    echo "Waiting for $HOST..."
    sleep 1
done

echo "$HOST is available."
exec $COMMAND
