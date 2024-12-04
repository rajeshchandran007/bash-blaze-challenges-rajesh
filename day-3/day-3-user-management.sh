#!/bin/bash

#-----FUNCTIONS-----#
function create_user {
 echo "--function--"
 read -p "Enter the username: " username

    # Check if the username already exists
    if id "$username" &>/dev/null; then
        echo "Error: The username '$username' already exists. Please choose a different username."
    else
        read -p "Enter the password for $username: " password

        # Create the user account
        sudo useradd -m -p "$password" "$username"
        echo "User account '$username' created successfully."
    fi
}
function delete_user {
 echo "--function--"
 read -p "Enter the username to delete: " username

    # Check if the username exists
    if id "$username" &>/dev/null; then
        sudo userdel -r "$username"  # -r flag removes the user's home directory
        echo "User name '$username' deleted successfully."
    else
        echo "Error: The username '$username' does not exist. Please enter a valid username."
    fi
}
function reset_password {
 echo "--function--"
 read -p "Enter the username to reset password: " username

    # Check if the username exists
    if id "$username" &>/dev/null; then
      
        read -p "Enter the new password for $username: " password

        # Set the new password
        echo "$username:$password" | sudo chpasswd
        echo "Password for user '$username' reset successfully."
    else
        echo "Error: The username '$username' does not exist. Please enter a valid username."
    fi
}
function list_users {
 echo "--function--"
 cat /etc/passwd | awk -F: '{ print "- " $1 " (UID: " $3 ")" }'
}
function display_usage {
 echo "Usage: $0 [OPTIONS]"
 echo "Options:"
 echo "  -c, --create     Create a new user account."
 echo "  -d, --delete     Delete an existing user account."
 echo "  -r, --reset      Reset password for an existing user account."
 echo "  -l, --list       List all user accounts on the system."
 echo "  -h, --help       Display this help and exit."
}

# Verify Command-line argument.
if [ $# -gt 0 ]; then
    case "$1" in
        -c|--create)
            create_user
            ;;
        -d|--delete)
            delete_user
            ;;
        -r|--reset)
            reset_password
            ;;
        -l|--list)
            list_users
            ;;
        -h|--help)
            display_usage
            ;;
        *)
            echo "Error: Invalid option '$1'. Use '--help' to see available options."
            exit 1
            ;;
    esac
else
    display_usage
fi
