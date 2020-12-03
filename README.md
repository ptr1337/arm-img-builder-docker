# arm-image-builder-docker

For easy building of the arm-images we have created a docker image without installing anything on its host system.
You have the possibility to build the docker image yourself or download it from dockerhub.
The prebuilt docker images are available for the following architectures:
* amd64
* arm64
* armv7

Here you find the image on the docker-hub:

[pttrr/arm-img-builder](https://hub.docker.com/repository/docker/pttrr/arm-img-builder)

## Installing docker and docker-compose

Docker and docker-compose are for following operating systems available:

* Linux (all distros)
* Mac
* Windows

You will find how to install docker and docker-compose for your operating system here:

https://docs.docker.com/get-docker/

## Running arm-img-builder

### First clone the Github repo with the following command:

`git clone https://github.com/ptTrR/arm-image-builder-docker.git && cd arm-img-builder-docker`

### Pulling and start the image from docker-hub:

`docker-compose pull && docker-compose up -d`

### building and start the docker container:
Change in the docker-compose.yml:
```
#    build: .  #uncomment for building
    image: pttrr/arm-img-builder:devel
#    image: arm-img-builder
```
to:
```
    build: .  #uncomment for building
  #  image: pttrr/arm-img-builder:devel
    image: arm-img-builder
```
Then run:

`docker-compose up -d --build`

### Exec into the container:

`docker exec -it arm-img-builder bash`

The container is automatically downloading all his three repos from pyavitz who is providing the building files for:

* rpi-img-builder is located at /build/rpi-img-builder
* debian-image-builder is located at /build/debian-img-builder
* Native-Kernel-Compiler is located at /build/kernelbuild

If you started with the pulled image from docker-hub, its possible that the repos are not up-to-date, so just update them with:

`git pull`

## Example for building

After you got the container successfully running and exec into that you can run following commands:

### Pulling latest Changes from Github
```
cd /build/rpi-img-builder/
git pull
```

### Menu-Interface
```
make config     # Create user data file (Foundation Kernel)
make mlconfig   # Create user data file (Mainline Kernel)
make menu       # Open menu interface
make dialogrc   # Set builder theme (optional)
```

### Building the kernel
```
make kernel       #Pi4
make rpi3-kernel  #Pi3
make rpi-kernel   #Pi0
```
### Building the rootfs
```
make rootfs  (arm64)
make rootsv6 (armel)
```
### Building the bootable image
```
make image        #Pi4
make rpi3-image   #Pi3
make rpi-image    #Pi0
```
### Copying the image from the container to your host

```
docker cp arm-img-builder:/build/path/to/image .
```

## Support

For more infos watch at our [Wiki](https://wiki.arm-image-builder.xyz/) or Github.

Should you come across any bugs, feel free to either open an issue on GitHub or talk with us directly by joining our channel on Freenode; [`#debianarm-port`](irc://irc.freenode.net/#debianarm-port)
