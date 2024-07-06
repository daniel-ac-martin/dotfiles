#! /bin/bash

set -euo pipefail

script_dir=$(dirname -- "$(readlink -e -- "${BASH_SOURCE}")")

cat <<EOF
This script will set up a tmpfs on /tmp

Note: We assume the following:
  - You have NOT already run this script!
  - The current contents of /tmp can be deleted!
EOF

fstab_entry="tmpfs                                     /tmp                    tmpfs   defaults,noatime,nosuid,nodev,noexec,mode=1777 0 0"
sudo sh -c "echo '${fstab_entry}' >> /etc/fstab"
cd '/tmp'
sudo rm -rf -- ..?* .[!.]* *
cd -
sudo mount '/tmp'
