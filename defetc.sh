cd rootfs

# /etc/inittab
cat > etc/inittab << 'EOF'
::sysinit:/etc/init.d/rcS
::respawn:/bin/sh
::ctrlaltdel:/sbin/reboot
::shutdown:/bin/umount -a -r
tty1::respawn:/bin/sh
tty2::respawn:/bin/sh
tty3::respawn:/bin/sh
tty4::respawn:/bin/sh
EOF

# /etc/init.d/rcS
mkdir -p etc/init.d
cat > etc/init.d/rcS << 'EOF'
#!/bin/sh

echo "Mounting filesystems..."
mount -t proc proc /proc
mount -t sysfs sysfs /sys
mount -t devtmpfs devtmpfs /dev
mount -t tmpfs tmpfs /tmp

echo "Setting up devices..."
mdev -s

echo "Setting hostname..."
hostname custom-linux

echo "Starting system..."
exec /bin/sh
EOF
chmod +x etc/init.d/rcS

# /etc/fstab
cat > etc/fstab << 'EOF'
proc /proc proc defaults 0 0
sysfs /sys sysfs defaults 0 0
devtmpfs /dev devtmpfs defaults 0 0
tmpfs /tmp tmpfs defaults 0 0
EOF

# /etc/passwd
cat > etc/passwd << 'EOF'
root:x:0:0:root:/root:/bin/sh
EOF

# /etc/group
cat > etc/group << 'EOF'
root:x:0:
EOF

# /etc/profile
cat > etc/profile << 'EOF'
export PATH=/bin:/sbin:/usr/bin:/usr/sbin
export PS1='\u@\h:\w\$ '
export USER=root
export HOME=/root
EOF
