mkdir -p isodir/boot/grub && \
cp temp/bzImage isodir/boot/ && \
cp temp/initramfs.cpio.gz isodir/boot/ && \
cat grub.cfg > isodir/boot/grub/grub.cfg
