FROM ubuntu:focal

ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386


RUN   apt-get update \
   && apt-get install -y --no-install-recommends  \
      apt-transport-https \
      ca-certificates \
      build-essential \
      qemu-user-static \
      qemu \
      binfmt-support \
      systemd-container \
      coreutils \
      autoconf \
      automake \
      autotools-dev \
#      crossbuild-essential-arm64 \
#      crossbuild-essential-armel \
#      crossbuild-essential-armhf \
      gcc-aarch64-linux-gnu \
      libc6-dev-arm64-cross \
      gcc-arm-none-eabi \
      g++-8-arm-linux-gnueabihf \
      gawk \
      gcc-arm-linux-gnueabihf \
      cmake \
      git \
      patch \
      wget \
      dialog \
      dbus \
      jq \
      p7zip-full \
      zip \
      unzip \
      pkg-config \
      procps \
      udev \
      uuid-dev \
      uuid-runtime \
      fakeroot \
      parted \
      debootstrap \
      libncurses5-dev \
      flex \
      debian-keyring \
      debian-archive-keyring \
      debian-keyring \
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
      e2fsprogs \
      kpartx \
   && rm -rf /var/lib/apt/lists/*

WORKDIR /build

RUN   git clone https://github.com/pyavitz/rpi-img-builder \
   && git clone https://github.com/pyavitz/debian-image-builder \
   && git clone -b xfce https://github.com/pyavitz/rpi-img-builder xfce \
   && git clone -b armhf https://github.com/pyavitz/rpi-img-builder armhf \
   && wget -cq --show-progress https://raw.githubusercontent.com/pyavitz/arm-img-builder/main/Makefile \
   && mkdir -p docker \
   && wget -cq --show-progress -P docker https://raw.githubusercontent.com/pyavitz/arm-img-builder/main/docker/update \
   && wget -cq --show-progress -P docker https://raw.githubusercontent.com/pyavitz/arm-img-builder/main/docker/function

CMD  ["bash"]
