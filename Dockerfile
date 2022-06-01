FROM   ubuntu:jammy

ARG    DEBIAN_FRONTEND=noninteractive

RUN     apt-get update \
        && apt-get install -y \
        bison bc git dialog patch fdisk distro-info-data \
        dosfstools zip unzip qemu debootstrap qemu-user-static rsync xfsprogs \
        kmod cpio flex libssl-dev libncurses5-dev parted fakeroot swig kpartx \
        aria2 pv lsb-release xz-utils curl e2fsprogs btrfs-progs \
        crossbuild-essential-arm64 crossbuild-essential-armhf crossbuild-essential-armel \
        gcc-9-arm-linux-gnueabi gcc-10-arm-linux-gnueabi gcc-11-arm-linux-gnueabi \
        gcc-9-arm-linux-gnueabihf gcc-10-arm-linux-gnueabihf gcc-11-arm-linux-gnueabihf \
        gcc-9-aarch64-linux-gnu gcc-10-aarch64-linux-gnu gcc-11-aarch64-linux-gnu \
        gcc-9 gcc-10 gcc-11 gcc-12 debian-archive-keyring debian-keyring make libelf-dev \
        gcc-12-arm-linux-gnueabi gcc-12-arm-linux-gnueabihf gcc-12-aarch64-linux-gnu \
        && rm -rf /var/lib/apt/lists/*

WORKDIR /build

RUN   git clone https://github.com/pyavitz/rpi-img-builder \
   && git clone https://github.com/pyavitz/debian-image-builder

CMD ["/bin/bash"]
