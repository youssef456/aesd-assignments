#!/bin/bash

# Check for the correct number of arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <directory> <search_string>"
    exit 1
fi

directory="$1"
search_string="$2"

if [ ! -d "$directory" ]; then
    echo "Error: '$directory' is not a valid directory."
    exit 1
fi

# Use grep to search for the string in files and count matching lines
match_count=$(grep -r "$search_string" "$directory" | wc -l)

# Count the number of files in the directory and subdirectories
file_count=$(find "$directory" -type f | wc -l)

echo "The number of files are $file_count and the number of matching lines are $match_count"

