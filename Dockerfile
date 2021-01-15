FROM debian:buster


RUN set -ex \
    && dpkg --add-architecture arm64                           \
    && apt-get update                                          \
    && apt-get install -y --no-install-recommends              \
        autoconf                                               \
        automake                                               \
        autotools-dev                                          \
        bc                                                     \
        binfmt-support                                         \
        binutils-multiarch                                     \
        binutils-multiarch-dev                                 \
        build-essential                                        \
        cdbs                                                   \
        cmake                                                  \
        crossbuild-essential-arm64                             \
        curl                                                   \
        devscripts                                             \
        equivs                                                 \
        fakeroot                                               \
        libtool                                                \
        llvm                                                   \
        meson                                                  \
        multistrap                                             \
        qemu                                                   \
        qemu-user-static                                       \
    && apt-get install -y libc6:arm64 libstdc++6:arm64         \
    && apt-get clean                                           \
    && rm -rf /tmp/* /var/tmp/*





# Create symlinks for triple and set default CROSS_TRIPLE

ENV CROSS_TRIPLE=aarch64-linux-gnu

RUN mkdir -p /usr/x86_64-linux-gnu;                                                             \
    for bin in /usr/bin/${CROSS_TRIPLE}-*; do                                                   \
      if [ ! -f /usr/${CROSS_TRIPLE}/bin/$(basename $bin | sed "s/${CROSS_TRIPLE}-//") ]; then  \
        ln -s $bin /usr/${CROSS_TRIPLE}/bin/$(basename $bin | sed "s/${CROSS_TRIPLE}-//");      \
      fi;                                                                                       \
    done;                                                                                       \
    for bin in /usr/bin/${CROSS_TRIPLE}-*; do                                                   \
      if [ ! -f /usr/${CROSS_TRIPLE}/bin/cc ]; then                                             \
        ln -s gcc /usr/${CROSS_TRIPLE}/bin/cc;                                                  \
      fi;                                                                                       \
    done

WORKDIR /build

RUN     git clone https://github.com/pyavitz/rpi-img-builder \
     && git clone https://github.com/pyavitz/debian-image-builder \
     && git clone -b armhf https://github.com/pyavitz/rpi-img-builder.git armhf-rpi-img-builder \
     && wget -cq --show-progress https://raw.githubusercontent.com/pyavitz/arm-img-builder/main/Makefile \
     && mkdir -p docker \
     && wget -cq --show-progress -P docker https://raw.githubusercontent.com/pyavitz/arm-img-builder/main/docker/pull \
     && wget -cq --show-progress -P docker https://raw.githubusercontent.com/pyavitz/arm-img-builder/main/docker/update \
     && wget -cq --show-progress -P docker https://raw.githubusercontent.com/pyavitz/arm-img-builder/main/docker/function

CMD     ["/bin/bash"]
