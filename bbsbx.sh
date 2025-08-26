cd busybox-1.35.0 && \
sed -i 's/.*CONFIG_STATIC.*/CONFIG_STATIC=y/' .config && \
sed -i 's/.*CONFIG_FEATURE_INSTALLER.*/CONFIG_FEATURE_INSTALLER=y/' .config && \
make -j$(nproc) && \
make install && \
cp -av _install/* ../rootfs
