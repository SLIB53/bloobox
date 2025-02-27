# bloobox

[![Release](https://github.com/SLIB53/bloobox/actions/workflows/release.yaml/badge.svg)](https://github.com/SLIB53/bloobox/actions/workflows/release.yaml)

`bloobox` is a containerized environment based on my personal usage.
Feel free to fork it so that you can make a container that fits your
needs!

## Base Packages

- bat
- eza
- fish
- git
- openssh-server
- procps
- which


## Usage

`bloobox` is maintained as a rolling release distribution for Podman. An [image](https://github.com/SLIB53/bloobox/pkgs/container/bloobox)
is available as a package on GitHub Container Registry.
To use locally, see the [build](#build) section below.

Run a temporary bloobox container:

```sh
podman run --rm -it ghcr.io/slib53/bloobox
```

Run a temporary bloobox container for your current directory:

```sh
podman run --rm -it -v $PWD:/mnt/h$PWD -w /mnt/h$PWD ghcr.io/slib53/bloobox
```

Run a bloobox container running systemd and OpenSSH server:

```sh
podman run --rm -it --detach --user root --entrypoint '/sbin/init' -p 10022:22 bloobox # connect with 'ssh -p 10022 bloo@localhost', default password 'bloo'
```


### Build & Run

**Please note** that the [Containerfile](Containerfile) might need to be built with
the `--no-cache` flag so that the latest dependencies are included in the build.

#### Building from GitHub

```sh
podman build --squash --rm -t github.com/slib53/bloobox https://github.com/SLIB53/bloobox.git
```

Then, to run:

```sh
podman run --rm -it github.com/slib53/bloobox
```


#### Building locally

Clone the repository:

```sh
git clone https://github.com/SLIB53/bloobox.git
cd bloobox
```

Now build the image:

```sh
podman build --squash --rm -t bloobox .
```

Then, to run:

```sh
podman run --rm -it localhost/bloobox
```
