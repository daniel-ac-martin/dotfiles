#! /bin/bash

set -euo pipefail

echo 'Tweaking SELinux rules...'
sudo ausearch -c 'systemd-logind' --raw | audit2allow -M my-systemdlogind
sudo ausearch -c 'systemd-sleep' --raw | audit2allow -M my-systemdsleep
sudo semodule -X 300 -i my-systemdlogind.pp
sudo semodule -X 300 -i my-systemdsleep.pp
sudo rm -f my-systemd*.*
echo '  Done.'

echo 'Restoring SELinux enforcement.'
sudo setenforce Enforcing

echo 'You should now be able to hibernate your system at will.'
