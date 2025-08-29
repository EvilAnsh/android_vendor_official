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
    url="${DEVICE_REPOS[$path]}"
    if [ ! -d "$path/.git" ]; then
        echo "Cloning $path..."
        mkdir -p "$(dirname "$path")"
        git clone "$url" "$path"
    else
        echo "Updating $path..."
        pushd "$path" >/dev/null
        git fetch origin
        LOCAL_HEAD=$(git rev-parse HEAD)
        REMOTE_HEAD=$(git rev-parse @{u} 2>/dev/null || echo "")
        if [ "$LOCAL_HEAD" != "$REMOTE_HEAD" ] && [ -n "$REMOTE_HEAD" ]; then
            git pull --rebase
        fi
        popd >/dev/null
    fi
done
