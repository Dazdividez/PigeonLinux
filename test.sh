#!/bin/bash
# Скрипт настройки ядра для framebuffer

KERNEL_DIR="linux-6.12.8"
cd "$KERNEL_DIR" || exit 1

# Функция для установки опций
set_config() {
    ./scripts/config --file .config "$1" "$2"
}

echo "Настройка ядра для framebuffer поддержки..."

# Включаем framebuffer и консоль
set_config --enable CONFIG_FB
set_config --enable CONFIG_FB_DEVICE
set_config --enable CONFIG_FRAMEBUFFER_CONSOLE
set_config --enable CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
set_config --enable CONFIG_FONT_8x16
set_config --enable CONFIG_FONT_8x8

# VESA framebuffer (самый совместимый)
set_config --enable CONFIG_FB_VESA
set_config --enable CONFIG_FB_BOOT_VESA_SUPPORT

# Simple framebuffer
set_config --enable CONFIG_SIMPLEFB
set_config --enable CONFIG_FB_SIMPLE

# EFI framebuffer для UEFI систем
set_config --enable CONFIG_FB_EFI

# DRM framebuffer (для современных систем)
set_config --enable CONFIG_DRM_FBDEV_EMULATION
set_config --enable CONFIG_DRM_LOAD_EDID_FIRMWARE

# Поддержка разных форматов
set_config --enable CONFIG_FB_CMDLINE
set_config --enable CONFIG_FB_MODE_HELPERS

# Консоль
set_config --enable CONFIG_VT
set_config --enable CONFIG_VT_CONSOLE
set_config --enable CONFIG_VT_HW_CONSOLE_BINDING

# Поддержка шрифтов
set_config --enable CONFIG_FONT_SUPPORT
set_config --enable CONFIG_FONT_8x16
set_config --enable CONFIG_FONT_8x8

# Поддержка ядром initramfs
set_config --enable CONFIG_BLK_DEV_INITRD

echo "Проверка изменений..."
./scripts/config --file .config --state CONFIG_FB_VESA
./scripts/config --file .config --state CONFIG_FRAMEBUFFER_CONSOLE

echo "Настройка завершена!"
echo "Теперь соберите ядро: make -j\$(nproc)"
