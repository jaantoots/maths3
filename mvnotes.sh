#!/bin/bash

# Move scanned notes from Downloads to course directory
for dir in $(dirname "$0")/*; do
    if [ -d "$dir" ]; then
        course=$(basename "$dir")
        for file in ~/Downloads/*; do
            if [ -f "$file" ] \
                   && [[ $(basename "$file") =~ $course[0-9][0-9].pdf ]]; then
                echo "$(basename "$file"):" \
                     "$(identify "$file" | grep -c "$(basename "$file")")"
                mv -iv "$file" "$dir"
            fi
        done
    fi
done
