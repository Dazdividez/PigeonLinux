cd linux-6.12.8 && \
make -j$(nproc) && \
cp arch/x86/boot/bzImage ../temp
