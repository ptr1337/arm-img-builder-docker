FROM   ubuntu:hirsute

ARG    DEBIAN_FRONTEND=noninteractive

RUN     apt-get update \
        && apt-get install -y \
        systemd \
        systemd-sysv \
        systemd-container \
	      debian-keyring \
	      debian-archive-keyring \
	      perl \
	      libelf-dev \
        ca-certificates \
        apt-transport-https \
        binfmt-support \
        dosfstools \
        rsync \
        wget \
        lsof \
        build-essential \
        bison \
        parted \
        debootstrap \
        kmod \
        dbus \
        udev \
        procps \
        nano \
        zip \
        unzip \
        git \
        bc \
        curl \
        dialog \
        patch \
        rsync \
        cpio \
        flex \
        libssl-dev \
        libncurses5-dev \
        fakeroot \
        swig \
        distro-info-data \
        lsb-release \
        python \
        python3 \
        lz4 \
        lzop \
	      e2fsprogs \
	      fdisk \
        && rm -rf /var/lib/apt/lists/*

WORKDIR /build

RUN   git clone https://github.com/pyavitz/rpi-img-builder \
   && git clone https://github.com/pyavitz/debian-image-builder \
   && wget -cq --show-progress https://raw.githubusercontent.com/pyavitz/arm-img-builder/build/Makefile \
   && mkdir -p docker \
   && wget -cq --show-progress -P docker https://raw.githubusercontent.com/pyavitz/arm-img-builder/build/docker/update \
   && wget -cq --show-progress -P docker https://raw.githubusercontent.com/pyavitz/arm-img-builder/build/docker/function

CMD     ["/bin/bash"]
