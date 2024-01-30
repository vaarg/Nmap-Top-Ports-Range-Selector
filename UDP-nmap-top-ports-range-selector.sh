#!/bin/bash

# Usage/help
usage() {
    echo "Usage: $0 [OPTION]"
    echo "Options:"
    echo "  -t, --top [NUMBER]       Display the top NUMBER of ports, separated by commas."
    echo "  -r, --range [START-END]  Display ports in the range START to END, separated by commas."
    exit 1
}

# nmap-services file
file="/usr/share/nmap/nmap-services"

# If you don't have Nmap lol
if [[ ! -f "$file" ]]; then
    echo "nmap-services file not found."
    exit 1
fi

# Process arguments
if [[ $# -eq 0 ]]; then
    usage
fi

while [[ $# -gt 0 ]]; do
    case $1 in
        -t|--top)
            TOP=$2
            shift # past argument
            shift # past value
            ;;
        -r|--range)
            RANGE=$2
            shift # past argument
            shift # past value
            ;;
        *)
            usage
            ;;
    esac
done

# Extract, sort, and format the UDP port numbers by frequency
format_output() {
    # Replace newlines with commas
    tr '\n' ',' | sed 's/,$/\n/'
}

if [[ ! -z "$TOP" ]]; then
    awk '/udp/ {print $2 " " $3}' "$file" | sort -rnk2 | cut -d'/' -f1 | head -n "$TOP" | format_output
elif [[ ! -z "$RANGE" ]]; then
    START=$(cut -d'-' -f1 <<< "$RANGE")
    END=$(cut -d'-' -f2 <<< "$RANGE")
    awk '/udp/ {print $2 " " $3}' "$file" | sort -rnk2 | cut -d'/' -f1 | sed -n "$START,$END"p | format_output
else
    usage
fi
