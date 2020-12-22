FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
RUN     apt-get update \
    &&  apt-get install -y --no-install-recommends \
        build-essential \
        gcc-aarch64-linux-gnu \
        g++-aarch64-linux-gnu \
        gcc-arm-linux-gnueabihf \
        g++-arm-linux-gnueabihf \
        ccache \
        cmake \
        git \
        ca-certificates \
        apt-transport-https \
        curl \
        distro-info-data \
        lsb-release \
        build-essential \
        patch \
        wget \
        binfmt-support \
        dialog \
        dbus \
        qemu-user-static \
        zip \
        unzip \
        procps \
        udev \
        fakeroot \
        parted \
        debian-archive-keyring \
        debian-keyring \
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
        pkg-config \
        xz-utils \
        lz4 \
        u-boot-tools \
        lsof \
        device-tree-compiler \
        libfdt-dev \
        python-distutils \
        lzop \
        python \
        python-dev \
        && rm -rf /var/lib/apt/lists/*
WORKDIR /build
RUN    git clone https://github.com/pyavitz/rpi-img-builder \
    && git clone https://github.com/pyavitz/debian-image-builder
CMD ["/bin/bash"]
