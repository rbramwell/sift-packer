#!/bin/bash -eux

# Uninstall Ansible and remove PPA.
#apt-get -y remove --purge ansible
#apt-add-repository --remove ppa:ansible/ansible
# TODO: BUG AUTOREMOVE removes python-plaso?!
# apt-get autoremove
apt-get update

# Zero out the rest of the free space using dd, then delete the written file.
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# Add `sync` so Packer doesn't quit too early, before the large file is deleted.
sync
