#!/bin/bash
# vendor/official/handler.sh

DEVICE_SCRIPT="$1"

if [ ! -f "$DEVICE_SCRIPT" ]; then
    echo "Device script not found: $DEVICE_SCRIPT"
    exit 1
fi

source "$DEVICE_SCRIPT"

# Force remove repos for reclone
for path in "${FORCE_REMOVE[@]}"; do
    if [ -d "$path" ]; then
        echo "Removing old $path..."
        rm -rf "$path"
    fi
done

# Clone/update repos
for path in "${!DEVICE_REPOS[@]}"; do
    entry="${DEVICE_REPOS[$path]}"
    url=$(echo "$entry" | awk '{print $1}')
    branch=$(echo "$entry" | awk '{print $2}')

    if [ ! -d "$path/.git" ]; then
        echo "Cloning $path..."
        mkdir -p "$(dirname "$path")"
        if [ -n "$branch" ]; then
            echo " -> Using branch: $branch"
            git clone -b "$branch" "$url" "$path"
        else
            echo " -> Using remote default branch"
            git clone "$url" "$path"
        fi
    else
        echo "Updating $path..."
        pushd "$path" >/dev/null

        # Fetch updates for specified branch
        if [ -n "$branch" ]; then
            git fetch origin "$branch"
            git pull --rebase origin "$branch"
        else
         # follows whatever branch is already tracked
            git fetch origin
            git pull --rebase  
        fi

        popd >/dev/null
    fi
done
