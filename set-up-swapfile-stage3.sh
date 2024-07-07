#! /bin/bash

set -euo pipefail

script_dir=$(dirname -- "$(readlink -e -- "${BASH_SOURCE}")")

echo 'Tweaking SELinux rules...'
sudo ausearch -c 'systemd-logind' --raw | audit2allow -M my-systemdlogind
sudo ausearch -c 'systemd-sleep' --raw | audit2allow -M my-systemdsleep
sudo semodule -X 300 -i my-systemdlogind.pp
sudo semodule -X 300 -i my-systemdsleep.pp
sudo rm -f my-systemd*.*
echo '  Done.'

echo 'Restoring SELinux enforcement.'
sudo setenforce Enforcing

echo 'Configuting auto-hibernate.'
"${script_dir}/copy-system-file.sh" /etc/systemd/logind.conf
"${script_dir}/copy-system-file.sh" /etc/systemd/sleep.conf

echo 'You should now be able to hibernate your system at will.'
