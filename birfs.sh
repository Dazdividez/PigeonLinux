cd rootfs
sudo mknod dev/console c 5 1
sudo mknod dev/null c 1 3
sudo mknod dev/zero c 1 5
sudo mknod dev/random c 1 8
sudo mknod dev/urandom c 1 9
sudo mknod dev/tty c 5 0
sudo mknod dev/tty0 c 4 0
sudo mknod dev/tty1 c 4 1
sudo mknod dev/tty2 c 4 2
sudo mknod dev/ram0 b 1 0
sudo mknod dev/ram1 b 1 1
find . | cpio -o -H newc | gzip > ../temp/initramfs.cpio.gz
