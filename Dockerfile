FROM    ubuntu:20.04

RUN     apt-get update \
     && DEBIAN_FRONTEND=noninteractive  apt-get install -y --no-install-recommends \
        apt-transport-https \
        build-essential \
        crossbuild-essential-arm64 \
        crossbuild-essential-armel \
        gcc-arm-none-eabi \
        gcc-aarch64-linux-gnu \
        cmake \
        git \ 
        ca-certificates \
        patch \
        wget \
        qemu \ 
        qemu-user-static \
        binfmt-support \
        dialog \
        dbus \
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
        sudo \
        u-boot-tools \
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
        curl \
        distro-info-data \
        lsb-release \
        dirmngr \
     && rm -rf /var/lib/apt/lists/*

WORKDIR /build

RUN     git clone https://github.com/pyavitz/rpi-img-builder \
     && git clone https://github.com/pyavitz/debian-image-builder
     && wget -cq --show-progress https://raw.githubusercontent.com/pyavitz/arm-img-builder/main/Makefile \
     && mkdir -p docker \
     && wget -cq --show-progress -P docker https://raw.githubusercontent.com/pyavitz/arm-img-builder/main/docker/pull \
     && wget -cq --show-progress -P docker https://raw.githubusercontent.com/pyavitz/arm-img-builder/main/docker/update \
     && wget -cq --show-progress -P docker https://raw.githubusercontent.com/pyavitz/arm-img-builder/main/docker/function

CMD     ["/bin/bash"]
