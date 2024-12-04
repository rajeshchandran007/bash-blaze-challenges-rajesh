#!/bin/bash

# Part 1: File and Directory Exploration
echo "Welcome to the Interactive File and Directory Explorer!"

read -p "Enter the Directory Path: " dir_path

while true; 
 do
    # List all files and directories in the path
    echo -e "\nDirectories:\n"
    ls -l $dir_path | grep "^d" | awk '{print $NF}'

    # List all files in the path
    echo -e "\nFiles:\n"
    ls -l $dir_path | grep "^-" | awk '{print $NF}'

    # Part 2: Character Counting
    echo -e "\n(Inorder to Exit, Press Enter without any text)\n"
    read -p "Enter a line of text: " input

    # Exit if the user enters an empty string
    if [ -z "$input" ]; then
        echo "Exiting the Interactive Explorer"
        exit 0
    fi

    # Calculate and print the character count for the input line
    char_count=$(echo -n "$input" | wc -c)
    echo "Character Count: $char_count"
 done
