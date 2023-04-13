#!/bin/bash

echo "Starting sync of Photos."
rclone sync ~/Archive/Photos/ crypt:Photos
echo "Finished."


