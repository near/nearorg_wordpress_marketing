#!/bin/bash

# Check if correct number of arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <directory> <search_string> <replacement_string>"
    exit 1
fi

directory="$1"
search_string="$2"
replacement_string="$3"

# Check if directory exists
if [ ! -d "$directory" ]; then
    echo "Error: Directory '$directory' not found."
    exit 1
fi

# Perform search and replace recursively
echo "Searching for '$search_string' and replacing with '$replacement_string' in files under '$directory'..."

# Use find command to search for files recursively in the directory
find "$directory" -type f -print0 | while IFS= read -r -d '' file; do
    # Perform the search and replace using sed
    #sed -i 's/'$search_string'/'$replacement_string'/g' "$file"
    # Note: the above sed command works on unix/linux, but not on MacOS
    # To run this script locally on a mac, comment out the above and use the line below
    sed -i '' 's/'$search_string'/'$replacement_string'/g' "$file"
    echo "Modified: $file"
done

echo "Search and replace complete."
