#! /bin/bash

set -euo pipefail

script_dir=$(dirname -- "$(readlink -e -- "${BASH_SOURCE}")")

swapvol='/mnt/swap'
swapfile='main'
grub_config='/boot/efi/EFI/fedora/grub.cfg'
stage2='set-up-swapfile-stage2.sh'

function usage {
  cat <<EOF
${BASH_SOURCE} SWAP_SIZE

Where SWAP_SIZE should be twice the system memory.
EOF
  exit 1
}

set +u
swap_size="${1}"
set -u

if [[ -z "${swap_size}" ]]; then
  usage
fi

cat <<EOF
This script will set up a swapfile that you can use for hibernation.

Note: We assume the following:
  - You have NOT already run this script!
  - You have a BTRFS subvolume at ${swapvol}
  - You have provided the CORRECT size of the system memory
  - Your BIOS is NOT configured to prevent waking from hibernation
EOF

echo 'Installing dependencies...'
sudo dnf install -y grub2-tools
echo '  Done.'

cd "${swapvol}"

echo 'Creating swapfile...'
sudo truncate -s 0 "${swapfile}"
sudo chattr +C "${swapfile}"
sudo btrfs property set "${swapfile}" compression none
sudo fallocate -l "${swap_size}" "${swapfile}"
sudo chmod 600 "${swapfile}"
sudo mkswap "${swapfile}"
echo '  Done.'


echo 'Enabling swapfile...'
sudo truncate -s 0 "${swapfile}"
fstab_entry="${swapvol}/${swapfile}                            none                    swap    defaults                                       0 0"
sudo swapon "${swapfile}"
sudo sh -c "echo '${fstab_entry}' >> /etc/fstab"
echo '  Done.'

cd -

echo 'Configuring system swappiness...'
"${script_dir}/copy-system-file.sh" '/etc/sysctl.d/99-swappiness.conf'
echo '  Done.'

echo 'Configuring GRUB for hibernation...'
device=$(grep "${swapvol}" /etc/mtab | sed -E 's/^([^[:space:]]+).*$/\1/')
offset=$(sudo filefrag -e "${swapvol}/${swapfile}" | grep '^\s*0:' | tr -d '.:' | awk '{print $4}')
grub_line="GRUB_CMDLINE_LINUX_DEFAULT=\"resume=${device} resume_offset=${offset}\""
sudo sh -c "echo '${grub_line}' >> /etc/default/grub"
echo '  Done.'

echo 'Configuring dracut for hibernation...'
"${script_dir}/copy-system-file.sh" '/etc/dracut.conf.d/resume.conf'
echo '  Done.'

echo 'Rebuilding initramfs...'
sudo dracut -f
echo '  Done.'

# Rebuild GRUB config
echo 'Rebuilding GRUB config...'
sudo grub2-mkconfig -o "${grub_config}"
echo '  Done.'

# Done (ish)
cat <<EOF
Configuration is complete you should be able to hibernate using the following command:
  sudo systemctl hibernate

Warning: If you have SELinux enabled you will probably need to run the
         ${stage2} script to hibernate your system for the first time.
         (Afterwards you can run a final script to enable standard
         hibernation.)
EOF
