#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <directory_or_file_path> <writestr>"
    exit 1
fi

path="$1"
writestr="$2"

# Remove any trailing slash if present
path=${path%/}

# Create the directory path if it doesn't exist
mkdir -p "$(dirname "$path")"

# Write the specified string to the file
echo "$writestr" > "$path"

if [ $? -ne 0 ]; then
    echo "Error: Could not write to $path."
    exit 1
fi

echo "Content written to $path."
exit 0

