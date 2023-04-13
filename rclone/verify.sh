#!/bin/bash

echo "Verifying"
rclone cryptcheck ~/Archive/Archive/ crypt:Archive
rclone cryptcheck ~/Archive/Photos/ crypt:Photos
echo "Finished."


