#!/bin/bash

echo "Starting test"
cd /var/lib/backup
mkdir /var/lib/data
echo "starting backup"
duplicity --no-encryption --allow-source-mismatch --full-if-older-than 7D . $1
echo "starting cleanup"
duplicity remove-all-but-n-full 3 --force --no-encryption --allow-source-mismatch $1  
duplicity cleanup --force --no-encryption $1
tail -f /dev/null
