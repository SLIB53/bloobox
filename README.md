# bloobox

![Rolling Release](https://github.com/SLIB53/bloobox/workflows/Rolling%20Release/badge.svg)

`bloobox` is a containerized development environment based on my personal usage. Feel free to fork it so that you can make a development box that fits your needs!

## Installed Tools

* fish
* git
* htop
* neovim
* node
* procps
* tree
* which

## Usage

`bloobox` is maintained as a rolling release distribution for Docker. An image is available on [GitHub Packages](https://github.com/SLIB53/bloobox/packages). To use locally, see the [build](#build) section below.

**Please note** that the [Dockerfile](Dockerfile) should be built with the `--no-cache` flag so that the latest dependencies are included in the build.

Run a temporary bloobox container:

``` sh
docker run --rm -it docker.pkg.github.com/slib53/bloobox/rolling
```

Run a temporary bloobox container for your current directory:

``` sh
docker run --rm -it -v $PWD:/mnt/h/$PWD -w /mnt/h/$PWD docker.pkg.github.com/slib53/bloobox/rolling
```

### Build

#### Building from GitHub

``` sh
docker build --no-cache --rm -t github.com/slib53/bloobox https://github.com/SLIB53/bloobox.git
```

Then, to run:

``` sh
docker run --rm -it github.com/slib53/bloobox
```

#### Building locally

``` sh
git clone https://github.com/SLIB53/bloobox.git
cd bloobox
docker build --no-cache --rm -t local/bloobox .
```

Then, to run:

``` sh
docker run --rm -it local/bloobox
```
