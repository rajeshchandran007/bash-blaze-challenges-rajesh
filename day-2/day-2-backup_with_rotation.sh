#!/bin/bash

# Function to display usage information and available options
function display_usage {
    echo "Usage: $0 /path/to/source_directory"
}

# Check if a valid directory path is provided as a command-line argument
if [ $# -eq 0 ] || [ ! -d "$1" ]; then
    echo "Error: Please provide a directory path."
    display_usage $0
    exit 1
fi

# Directory path of the source directory to be backed up
source_dir="$1"

# Function to create a timestamped backup folder
function create_backup_folder {
    local timestamp=$(date '+%Y-%m-%d_%H-%M-%S') 
    local backup_folder="${source_dir}/backup_${timestamp}"

# Create the backup folder with the timestamped name
    mkdir -p "$backup_folder"
    echo -e "\nBackup folder created successfully: $backup_folder\n"
}

# Function to perform the rotation and keep only the last 3 backups
function perform_rotation {
#  List down the backup folders
    local folders=$(ls -ld $source_dir/*/ | grep backup_)
    echo -e "\nlist of folders:\n"
    ls -ld $source_dir/*/ | grep backup_

# Count the total number of folders
    local folder_count=$(echo "$folders" | wc -l)
    echo -e "\nfolders count: "$folder_count

# Calculate how many folders to delete
    folders_count_to_delete=$((folder_count - 3))

if [ "$folders_count_to_delete" -gt 0 ]; then
  echo -e "\nKeeping the latest 3 folders. Deleting the below list:\n"

  # Identify folders to delete (everything except the latest 3)
  folders_to_delete=$(ls -ld $source_dir/*/ | grep backup_ | head -n "$folders_count_to_delete")

  # Delete the identified folders
  echo "$folders_to_delete"
  echo "$folders_to_delete" | xargs rm -rf
  echo -e "\nDeleted Successfully\n"
  echo -e "\nFinal List:\n"
  ls -ld $source_dir/*/ | grep backup_
else
  echo "\nThere are 3 or fewer folders. No folders deleted.\n"
fi
}

# Main script logic
create_backup_folder
perform_rotation
