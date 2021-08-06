FROM ubuntu:focal

ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386

RUN   apt-get update \
   && apt-get install -y --no-install-recommends \
      apt-transport-https \
      ca-certificates \
      build-essential \
      gcc-10 \
      gcc-8 \
      qemu-user-static \
      binfmt-support \
      systemd-container \
      coreutils \
      autoconf \
      automake \
      autotools-dev \
      gcc-10-aarch64-linux-gnu \
      g++-10-aarch64-linux-gnu \
      gcc-9-aarch64-linux-gnu \
      g++-9-aarch64-linux-gnu \
      gcc-8-aarch64-linux-gnu \
      g++-8-aarch64-linux-gnu \
      gcc-arm-none-eabi \
      gcc-8-arm-linux-gnueabihf \
      g++-8-arm-linux-gnueabihf \
      gcc-9-arm-linux-gnueabihf \
      g++-9-arm-linux-gnueabihf \
      gcc-10-arm-linux-gnueabihf \
      g++-10-arm-linux-gnueabihf \
      libc6-dev-arm64-cross \
      libc6-dev-armhf-cross \
      libc6-dev-armel-cross \
      clang-12 \
      lld \
      lld-12 \
      clang \
      llvm \
      llvm-runtime \
      gawk \
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
      xfsprogs \
      kpartx \
      u-boot-tools \
  &&  rm -rf /var/lib/apt/lists/*

WORKDIR /build

RUN   git clone https://github.com/pyavitz/rpi-img-builder \
   && git clone https://github.com/pyavitz/debian-image-builder \
   && git clone -b armhf https://github.com/pyavitz/rpi-img-builder armhf \
   && wget -cq --show-progress https://raw.githubusercontent.com/pyavitz/arm-img-builder/main/Makefile \
   && mkdir -p docker \
   && wget -cq --show-progress -P docker https://raw.githubusercontent.com/pyavitz/arm-img-builder/main/docker/update \
   && wget -cq --show-progress -P docker https://raw.githubusercontent.com/pyavitz/arm-img-builder/main/docker/function

CMD  ["/bin/bash"]
