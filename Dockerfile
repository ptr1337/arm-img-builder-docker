FROM ubuntu:20.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive  apt-get install -y --no-install-recommends \
        build-essential \
        crossbuild-essential-arm64 \
        crossbuild-essential-armel \
        gcc-arm-none-eabi \
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
        qemu \
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
        lzop \
        python \
        python-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build

RUN git clone https://github.com/pyavitz/rpi-img-builder \
    && git clone https://github.com/pyavitz/debian-image-builder

CMD ["/bin/bash"]
