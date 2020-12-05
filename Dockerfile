FROM debian:buster-slim

ENV container docker
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive

ARG APT_OPTS="--no-install-recommends -o APT::Install-Suggests=0 -o Acquire::Languages=none"

RUN   apt-get update \
    && apt-get install  -y $APT_OPTS \
        ca-certificates \
        apt-transport-https \
        binfmt-support \
        qemu-user-static \
        qemu-system-x86 \
        dosfstools \
        rsync \
        wget \
        lsof \
        git \
        build-essential \
        bison \
        xz-utils \
        dirmngr \
        parted \
        systemd \
        systemd-sysv \
        debootstrap \
        kmod \
        dbus \
        udev \
        procps \
        nano \
        unzip \
        bc \
        sudo \
        dialog \
        patch \
        unzip \
        rsync \
        cpio \
        flex \
        libssl-dev \
        libncurses5-dev \
        fakeroot \
        swig \
        mc \
        aria2 \
        pv \
        toilet \
        figlet \
        crossbuild-essential-arm64 \
        crossbuild-essential-armel \
        distro-info-data \
        lsb-release \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/*.bin \
        /var/lib/dpkg/*-old /var/cache/debconf/*-old

RUN rm -f /lib/systemd/system/multi-user.target.wants/* \
            /etc/systemd/system/*.wants/* \
            /lib/systemd/system/local-fs.target.wants/* \
            /lib/systemd/system/sockets.target.wants/*udev* \
            /lib/systemd/system/sockets.target.wants/*initctl* \
            /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup* \
            /lib/systemd/system/systemd-update-utmp* && \
            mkdir build


WORKDIR /build

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/lib/systemd/systemd"]
