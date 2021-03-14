<img src="https://socialify.git.ci/ptTrR/arm-img-builder-docker/image?description=1&descriptionEditable=Build%20customized%20arm%20images%20with%20docker&font=Bitter&forks=1&issues=1&logo=https%3A%2F%2Fwww.docker.com%2Fsites%2Fdefault%2Ffiles%2Fd8%2F2019-07%2Fvertical-logo-monochromatic.png&owner=1&pattern=Charlie%20Brown&pulls=1&stargazers=1&theme=Dark" alt="arm-img-builder-docker" width="640" height="320" />

## Docker arm image builder

For easily build your image we have created a docker image. The only thing you need to install is docker and docker-compose.
You have the possibility to build the docker image yourself or download the image from docker hub.
The prebuilt docker images are available for the following architectures:

* amd64
* arm64

Here you find the image on the docker-hub:

[pttrr/arm-img-builder](https://hub.docker.com/r/pttrr/arm-img-builder)

We will provide two different tags: 

> amd64 --> for cross compiling on amd64 
> arm64 --> for native compiling or cross compiling on arm64

### Installing docker and docker-compose

Docker and docker-compose are for following operating systems available:

* Linux (all distros)
* Mac
* Windows

You will find how to install docker and docker-compose for your operating system here:

https://docs.docker.com/get-docker/

### Install docker at raspberry or other arm devices

The official instruction for installing docker-compose on arm devices isnt working sometimes. 

You can follow this guide for the installation:
https://dev.to/rohansawant/installing-docker-and-docker-compose-on-the-raspberry-pi-in-5-simple-steps-3mgl

### Torubleshooting if building the image is failing
If you got some problems at using for compiling the image or the docker container you should install the following on your host system:

```
sudo apt install qemu-user-static binfmt-support #debian/ubuntu

sudo pacman -S qemu-arch-extra #arch(aur must be maybe enabled)

if there are still problems run the follwing command:

docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
```
## Usage

### Clone my repo

```
git clone https://github.com/ptr1337/arm-img-builder-docker
```
or create the docker-compose.yml:

```
version: '3.6'
services:

  arm-img-builder:
#    build: .  #uncomment for building 
    image: pttrr/arm-img-builder:amd64 #crosscompiling on x64
#    image: pttrr/arm-img-builder:arm64 #native or crosscompiling on a arm64
    privileged: true
    container_name: arm-img-builder
    stdin_open: true
    tty: true
#    restart: always
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:ro
      - /dev:/dev
      - ./:/images
```
#### Change the image tag to your needs. 

**:amd64 is for cross compiling on x86_64 Machine
:arm64 for compiling on a arm64 machine **

### Pulling and start the container

```
docker-compose pull && docker-compose up -d
```
If your container is successfully started you have to exec into it:
```
docker exec -it arm-img-builder bash
```
### Docker-Addon

We also created a "docker-helper" which is aimed for guys which not using docker that often or never used it. 
Just check this link:

https://wiki.arm-image-builder.xyz/en/docker-addon

### Supported Builder

* [rpi-img-builder](https://github.com/pyavitz/rpi-img-builder) is located at /build/rpi-img-builder
* [debian-image-builder](https://github.com/pyavitz/debian-image-builder) is located at /build/debian-img-builder

## Usage inside the container

Just run in the /build dir following commands (mostly they should do the commands if enterying the container but for going sure):

```
make update # Updating scripts and the makefile
```
Then enter in your wanted builder directory and follow the commands which you will find here:

[raspberry-image-builder](https://wiki.arm-image-builder.xyz/en/Raspberry)
[debian-image-builder](https://wiki.arm-image-builder.xyz/en/Debian)

## Moving image to the host system
When your image built, you just have to move your to the /image directory, for example:
```
mv *.img.xz /images
```

Then you will find the image where you started the docker-compose. 

## Maintenance and Troubleshooting

### Cleanup

For clearing up your directory and built cache in the container you can use the following commands:

```
make cleanup
make purge
make purge-all
```
### Clearing the complete docker system

1. Stop your running container with `docker stop arm-img-builder` 
2. Then run `docker system prune -a --volumes`

## Support

For more information watch at our [Wiki](https://wiki.arm-image-builder.xyz/) or [GitHub](https://github.com/pyavitz).

Should you come across any bugs, feel free to either open an issue on GitHub or talk with us directly by joining our channel on Freenode; [`#debianarm-port`](irc://irc.freenode.net/#debianarm-port)
