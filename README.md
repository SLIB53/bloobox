# bloobox

![Rolling Release](https://github.com/SLIB53/bloobox/workflows/Rolling%20Release/badge.svg)

`bloobox` is a containerized development environment based on my personal usage.
Feel free to fork it so that you can make a development box that fits your
needs!

## Installed Tools

- bat
- fish
- git
- procps
- tree
- unzip
- which
- zip

## Usage

`bloobox` is maintained as a rolling release distribution for Docker. An image
is available on [GitHub Container Registry](https://github.com/users/SLIB53/packages/container/bloobox).
To use locally, see the [build](#build) section below.

Run a temporary bloobox container:

```sh
docker run --rm -it ghcr.io/slib53/bloobox
```

Run a temporary bloobox container for your current directory:

```sh
docker run --rm -it -v $PWD:/mnt/h$PWD -w /mnt/h$PWD ghcr.io/slib53/bloobox
```

### Build

**Please note** that the [Dockerfile](Dockerfile) might need to be built with
the `--no-cache` flag so that the latest dependencies are included in the build.

#### Building from GitHub

```sh
docker build --no-cache \
    --build-arg PEPPER_GIT_URL=https://github.com/SLIB53/pepper-fish-theme.git \
    --rm -t github.com/slib53/bloobox https://github.com/SLIB53/bloobox.git
```

Then, to run:

```sh
docker run --rm -it github.com/slib53/bloobox
```

#### Building locally

```sh
git clone https://github.com/SLIB53/bloobox.git
cd bloobox
docker build --no-cache \
    --build-arg PEPPER_GIT_URL=https://github.com/SLIB53/pepper-fish-theme.git \
    --rm -t local/bloobox .
```

Then, to run:

```sh
docker run --rm -it local/bloobox
```
