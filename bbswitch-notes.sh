# clone from github

# build
#    - make; (sudo) make load # or
#    - (sudo) make -f Makefile.dkms # if DKMS is available

# disable card on boot
#    - "bbswitch load_state=0" in /etc/modules, /etc/modules.conf, etc.
#    depending on your distribution
#    - ALSO for kmod users:
#       - "options bbswitch load_state=0" in /etc/modprobe.d/bbswitch.conf
#       - create /etc/modules-load.d/bbswitch.conf cantaining "bbswitch"
#       - update initial ramdisk (initrd) "update-initramfs -u" as root
