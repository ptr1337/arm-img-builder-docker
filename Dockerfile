FROM  ubuntu:20.04

ENV container docker
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive

RUN     apt-get update \
     && apt-get install -y --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        build-essential \
        crossbuild-essential-arm64 \
        crossbuild-essential-armel \
        crossbuild-essential-armhf \
        gcc-arm-none-eabi \
        gcc-aarch64-linux-gnu \
        cmake \
        git \
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
  	debian-archive-keyring \
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
        apt-utils \
        python3 \
        python3-dev \
        python3-distutils \
	python \
        python-dev \
        lzop \
        zstd \
        curl \
        distro-info-data \
        lsb-release \
        dirmngr \
     && apt-get -qq clean  \
     && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /build

RUN     git clone https://github.com/pyavitz/rpi-img-builder \
     && git clone https://github.com/pyavitz/debian-image-builder \
     && git clone -b armhf https://github.com/pyavitz/rpi-img-builder.git armhf-rpi-img-builder \
     && git clone -b xfce https://github.com/pyavitz/rpi-img-builder.git xfce-rpi-img-builder \
     && wget -cq --show-progress https://raw.githubusercontent.com/pyavitz/arm-img-builder/main/Makefile \
     && mkdir -p docker \
     && wget -cq --show-progress -P docker https://raw.githubusercontent.com/pyavitz/arm-img-builder/main/docker/pull \
     && wget -cq --show-progress -P docker https://raw.githubusercontent.com/pyavitz/arm-img-builder/main/docker/update \
     && wget -cq --show-progress -P docker https://raw.githubusercontent.com/pyavitz/arm-img-builder/main/docker/function

CMD     ["/bin/bash"]
