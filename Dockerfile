FROM ubuntu:20.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y  \
    ca-certificates \
    apt-transport-https \
    build-essential \
    bison \
    xz-utils \
    bc \
    git \
    sudo \
    dialog \
    patch \
    dosfstools \
    unzip \
    zip \
    qemu \
    debootstrap \
    qemu-user-static \
    rsync \
    nano \
    systemd \
    systemd-container \
    kmod \
    cpio \
    flex \
    libssl-dev \
    libncurses5-dev \
    parted \
    fakeroot \
    udev \
    swig \
    mc \
    aria2 \
    pv \
    toilet \
    rsync \
    figlet \
    crossbuild-essential-arm64 \
    crossbuild-essential-armel \
    crossbuild-essential-armhf \
    distro-info-data \
    lsb-release \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN rm -rf /tmp/* /var/tmp/* /var/cache/apt/*.bin \
    /var/lib/dpkg/*-old /var/cache/debconf/*-old

RUN rm -f /lib/systemd/system/multi-user.target.wants/* \
    /etc/systemd/system/*.wants/* \
    /lib/systemd/system/local-fs.target.wants/* \
    /lib/systemd/system/sockets.target.wants/*udev* \
    /lib/systemd/system/sockets.target.wants/*initctl* \
    /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup* \
    /lib/systemd/system/systemd-update-utmp* && \
    mkdir build

RUN git clone https://github.com/pyavitz/rpi-img-builder.git /build/rpi-img-builder

RUN git clone https://github.com/pyavitz/debian-image-builder.git /build/debian-image-builder

RUN git clone https://github.com/pyavitz/builddeb.git /build/kernelbuild

WORKDIR /build

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/lib/systemd/systemd"]
