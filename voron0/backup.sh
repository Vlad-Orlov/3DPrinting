#!/usr/bin/bash

echo "Collecting updates from voron0 printer"
scp -r biqu@voron0:/home/biqu/printer_data/config /home/vorlov/3DPrinting/voron0

echo "Preparing commit..."
git commit -am "backup $(date)"

echo "Pushing to remote GitHub repository..."
git push
