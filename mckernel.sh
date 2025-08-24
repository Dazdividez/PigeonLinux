cd linux-6.12.8

make menuconfig

# Критически важные настройки через scripts/config
./scripts/config -e BLK_DEV_RAM
./scripts/config -e BLK_DEV_INITRD
./scripts/config -e DEVTMPFS
./scripts/config -e DEVTMPFS_MOUNT
./scripts/config -e EXT2_FS
./scripts/config -e EXT4_FS
./scripts/config -e EXT4_USE_FOR_EXT2
./scripts/config -e TMPFS
./scripts/config -e RAMFS
./scripts/config -e INITRAMFS_SOURCE
./scripts/config --set-str INITRAMFS_SOURCE "../rootfs"

# Дополнительные важные опции
./scripts/config -e UNIX98_PTYS
./scripts/config -e LEGACY_PTYS
./scripts/config -e VT
./scripts/config -e VT_CONSOLE
./scripts/config -e SERIAL_8250
./scripts/config -e SERIAL_8250_CONSOLE
./scripts/config -e HW_RANDOM
./scripts/config -e EFI_PARTITION
./scripts/config -e MSDOS_PARTITION
./scripts/config -e ISO9660_FS
./scripts/config -e UDF_FS

