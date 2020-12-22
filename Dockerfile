FROM ubuntu:20.04

ARG     DEBIAN_FRONTEND=noninteractive
RUN     apt-get update \
        && apt-get install -y --no-install-recommends \
        build-essential \
        crossbuild-essential-arm64 \
        crossbuild-essential-armel \
        gcc-arm-none-eabi \
        gcc-aarch64-linux-gnu \
        cmake \
        git \
        ca-certificates \
        apt-transport-https \
        curl \
        distro-info-data \
        lsb-release \
        patch \
        wget \
        binfmt-support \
        dialog \
        dbus \
        qemu \
        qemu-system-x86 \
        qemu-user-static \
        zip \
        unzip \
        procps \
        udev \
        fakeroot \
        parted \
        debootstrap \
        libncurses5-dev \
        flex \
        nano \
        kmod \
        libssl-dev \
        rsync \
        cpio \
        aria2 \
        pv \
        bc \
        bison \
        swig \
        dosfstools \
        toilet \
        figlet \
        xz-utils \
        lz4 \
        lsof \
        device-tree-compiler \
        libfdt-dev \
        python3-distutils \
        python3-dev \
        lzop \
        python \
        python-dev \
        dirmngr \
        && rm -rf /var/lib/apt/lists/*
 
WORKDIR /build
 
RUN     git clone https://github.com/pyavitz/rpi-img-builder \
        && git clone https://github.com/pyavitz/debian-image-builder \
        && wget -cq --show-progress https://raw.githubusercontent.com/pyavitz/arm-img-builder/main/Makefile \
        && mkdir -p docker \
        && wget -cq --show-progress -P docker https://raw.githubusercontent.com/pyavitz/arm-img-builder/main/docker/setup \
        && wget -cq --show-progress -P docker https://raw.githubusercontent.com/pyavitz/arm-img-builder/main/docker/pull \
        && wget -cq --show-progress -P docker https://raw.githubusercontent.com/pyavitz/arm-img-builder/main/docker/function
CMD     ["/bin/bash"]
