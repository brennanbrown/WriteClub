#!/bin/bash

# Script to find text files containing "Kenneth" and move them to a Kenneth folder

# Create the Kenneth folder if it doesn't exist
mkdir -p "Kenneth"

# Counter for files moved
count=0

# Find and process text files
echo "Searching for text files containing 'Kenneth'..."

# Loop through common text file extensions
for ext in txt md markdown text log; do
    for file in *.$ext; do
        # Check if the file exists (in case no files match the pattern)
        if [ -f "$file" ]; then
            # Search for "Kenneth" in the file (case-insensitive)
            if grep -qi "kenneth" "$file"; then
                echo "Found 'Kenneth' in: $file"
                mv "$file" "Kenneth/"
                ((count++))
            fi
        fi
    done
done

# Also check files without extensions that might be text
for file in *; do
    # Skip directories and the Kenneth folder we just created
    if [ -f "$file" ] && [ "$file" != "Kenneth" ]; then
        # Check if it's a text file using the file command
        if file "$file" | grep -qi "text"; then
            # Check if the filename doesn't already have an extension we checked
            if [[ ! "$file" =~ \.(txt|md|markdown|text|log)$ ]]; then
                if grep -qi "kenneth" "$file"; then
                    echo "Found 'Kenneth' in: $file"
                    mv "$file" "Kenneth/"
                    ((count++))
                fi
            fi
        fi
    fi
done

# Report results
if [ $count -eq 0 ]; then
    echo "No text files containing 'Kenneth' were found."
    # Remove the empty Kenneth folder if no files were moved
    rmdir "Kenneth" 2>/dev/null
else
    echo "Moved $count file(s) containing 'Kenneth' to the Kenneth folder."
fi