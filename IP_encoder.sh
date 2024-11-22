#!/bin/bash

# Function to encode IP address
encode_ip() {
    local ip_address="$1"  # Input IP address
    local offsets=()       # Array to store the encoded values

    # Iterate through each character in the IP address
    for (( i=0; i<${#ip_address}; i++ )); do
        char="${ip_address:i:1}"
        
        if [[ "$char" =~ [0-9] ]]; then
            # If it's a digit, add it to the offsets
            offsets+=("$char")
        elif [[ "$char" == "." ]]; then
            # If it's a dot, add 7 to the offsets
            offsets+=("7")
        fi
    done

    # Print the result as a comma-separated list
    echo "${offsets[@]}" | tr ' ' ','
}

# Prompt the user for an IP address
read -p "Enter an IP address to encode: " ip

# Validate the IP address format
if [[ "$ip" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
    # Encode and display the result
    encoded_offsets=$(encode_ip "$ip")
    echo "Encoded Offsets for $ip: $encoded_offsets"
else
    echo "Invalid IP address format. Please try again."
fi
