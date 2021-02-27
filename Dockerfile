FROM ubuntu:focal

ENV DEBIAN_FRONTEND noninteractive

RUN set -x \
   && apt-get update && apt-get install -y --no-install-recommends  \
      apt-transport-https \
      ca-certificates \
      build-essential \
      qemu \
      qemu-user-static \
      binfmt-support \
      coreutils \
      autoconf \
      automake \
      autotools-dev \
      crossbuild-essential-arm64 \
      crossbuild-essential-armel \
      crossbuild-essential-armhf \
      gcc-arm-none-eabi \
      cmake \
      git \
      patch \
      wget \
      dialog \
      dbus \
      p7zip-full \
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
      file \
      libcap2-bin \
      xz-utils \
      lz4 \
      lsof \
      device-tree-compiler \
      libfdt-dev \
      apt-utils \
      python3-dev \
      python3-distutils \
      lzop \
      zstd \
      curl \
      distro-info-data \
      fdisk \
      lsb-release \
      dirmngr \
      python \
      python-dev \
      btrfs-progs \
   && rm -rf /var/lib/apt/lists/*

WORKDIR /build

RUN   git clone https://github.com/pyavitz/rpi-img-builder \
   && git clone https://github.com/pyavitz/debian-image-builder \
   && wget -cq --show-progress https://raw.githubusercontent.com/pyavitz/arm-img-builder/main/Makefile \
   && mkdir -p docker \
   && wget -cq --show-progress -P docker https://raw.githubusercontent.com/pyavitz/arm-img-builder/main/docker/update \
   && wget -cq --show-progress -P docker https://raw.githubusercontent.com/pyavitz/arm-img-builder/main/docker/function

CMD  ["/bin/bash"]
