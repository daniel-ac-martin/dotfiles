#! /bin/bash

set -euo pipefail

stage3='set-up-swapfile-stage3.sh'

echo 'Placing SELinux into permissive mode.'
sudo setenforce Permissive

echo 'Hibernating the system in 10 seconds...'
echo "When you have restored the system please run: ${stage3}"
sleep 10
sudo systemctl hibernate
