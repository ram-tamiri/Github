#!/bin/bash

# Basic shell script for user creation in Linux

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root or use sudo."
    exit 1
fi

# Prompt for the username
read -p "Enter the username to create: " username

# Check if the user already exists
if id "$username" &>/dev/null; then
    echo "User '$username' already exists."
    exit 1
fi

# Create the user
useradd -m "$username"

# Check if the user was created successfully
if [ $? -eq 0 ]; then
    echo "User '$username' has been created successfully."
else
    echo "Failed to create user '$username'."
    exit 1
fi

# Set a password for the user
passwd "$username"

# Confirm completion
echo "User '$username' is ready to use."

echo "Script completed."
# End of script
# Save this script as stash.sh and run it with sudo or as root.
# Example: sudo bash stash.sh
# Make sure to give execute permission: chmod +x stash.sh
# Always review and understand scripts before executing them, especially with elevated privileges.Í