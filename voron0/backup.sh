#!/usr/bin/bash

REMOTE="biqu@voron0:/home/biqu/printer_data/config/"
LOCAL="/home/vorlov/3DPrinting/voron0/config"
LOCAL_VORON0="/home/vorlov/3DPrinting/voron0"

echo "Collecting updates from voron0 printer"
rsync -avz "$REMOTE" "$LOCAL"

cd "$LOCAL_VORON0"

if [[ -n $(git status --porcelain) ]]; then
    echo "Preparing commit..."
    git add .
    git commit -m "backup $(date '+%Y-%m-%d %H:%M:%S')"
    
    echo "Pushing to remote GitHub repository..."
    git push
else
    echo "No changes to backup."
fi
