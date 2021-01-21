FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && \
    apt-get -y install --no-install-recommends \
      apt-transport-https \
      ca-certificates \
      build-essential \
      qemu-user-static \
      binfmt-support \
      zerofree \
      bsdtar \
      quilt \
      coreutils \
      autoconf \
      automake \
      autotools-dev \
      crossbuild-essential-arm64 \
      crossbuild-essential-armel \
      crossbuild-essential-armhf \
      grep \
      cmake \
      xxd \
      git \
      patch \
      wget \
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
      python-dev \
      lzop \
      zstd \
      curl \
      fdisk \
      distro-info-data \
      lsb-release \
      dirmngr \
   && rm -rf /var/lib/apt/lists/*

WORKDIR /build

RUN   git clone https://github.com/pyavitz/rpi-img-builder \
   && git clone https://github.com/pyavitz/debian-image-builder \
   && git clone -b armhf https://github.com/pyavitz/rpi-img-builder.git armhf-rpi-img-builder \
   && git clone -b xfce https://github.com/pyavitz/rpi-img-builder.git xfce-rpi-img-builder \
   && wget -cq --show-progress https://raw.githubusercontent.com/pyavitz/arm-img-builder/main/Makefile \
   && mkdir -p docker \
   && wget -cq --show-progress -P docker https://raw.githubusercontent.com/pyavitz/arm-img-builder/main/docker/pull \
   && wget -cq --show-progress -P docker https://raw.githubusercontent.com/pyavitz/arm-img-builder/main/docker/update \
   && wget -cq --show-progress -P docker https://raw.githubusercontent.com/pyavitz/arm-img-builder/main/docker/function

CMD  ["/bin/bash"]
