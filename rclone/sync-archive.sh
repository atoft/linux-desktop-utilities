#!/bin/bash

echo "Starting sync of Archive."
rclone sync ~/Archive/Archive/ crypt:Archive
echo "Finished."


