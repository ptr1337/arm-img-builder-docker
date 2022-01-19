FROM   ubuntu:jammy

ARG    DEBIAN_FRONTEND=noninteractive

RUN     apt-get update \
        && apt-get install -y \
        build-essential bison bc git dialog patch dosfstools sudo \
        zip unzip qemu debootstrap qemu-user-static rsync kmod cpio flex \
        libssl-dev libncurses5-dev parted fakeroot swig aria2 pv toilet figlet \
        distro-info-data lsb-release xz-utils curl e2fsprogs btrfs-progs kpartx \
        debian-archive-keyring crossbuild-essential-armel crossbuild-essential-armhf \
        gcc-9-arm-linux-gnueabi gcc-10-arm-linux-gnueabi gcc-11-arm-linux-gnueabi \
        gcc-9-arm-linux-gnueabihf gcc-10-arm-linux-gnueabihf gcc-11-arm-linux-gnueabihf \
        gcc-9 gcc-10 gcc-11 debian-keyring make libelf-dev xfsprogs fdisk \
        && rm -rf /var/lib/apt/lists/*

WORKDIR /build

RUN   git clone https://github.com/pyavitz/rpi-img-builder \
   && git clone https://github.com/pyavitz/debian-image-builder \
   && wget -cq --show-progress https://raw.githubusercontent.com/pyavitz/arm-img-builder/build/Makefile \
   && mkdir -p docker \
   && wget -cq --show-progress -P docker https://raw.githubusercontent.com/pyavitz/arm-img-builder/build/docker/update \
   && wget -cq --show-progress -P docker https://raw.githubusercontent.com/pyavitz/arm-img-builder/build/docker/function

CMD ["/bin/bash"]
