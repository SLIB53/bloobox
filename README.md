# bloobox

[![Rolling Release](https://github.com/SLIB53/bloobox/actions/workflows/rolling-release.yaml/badge.svg)](https://github.com/SLIB53/bloobox/actions/workflows/rolling-release.yaml)

`bloobox` is a containerized development environment based on my personal usage.
Feel free to fork it so that you can make a development box that fits your
needs!

## Installed Tools

- fish
- git
- unzip

## Usage

`bloobox` is maintained as a rolling release distribution for Docker. An [image](https://github.com/SLIB53/bloobox/pkgs/container/bloobox)
is available as a package on GitHub Container Registry.
To use locally, see the [build](#build) section below.

Run a temporary bloobox container:

```sh
docker run --rm -it ghcr.io/slib53/bloobox
```

Run a temporary bloobox container for your current directory:

```sh
docker run --rm -it -v $PWD:/mnt/h$PWD -w /mnt/h$PWD ghcr.io/slib53/bloobox
```

### Build & Run

**Please note** that the [Dockerfile](Dockerfile) might need to be built with
the `--no-cache` flag so that the latest dependencies are included in the build.

#### Building from GitHub

```sh
docker build --no-cache --rm -t github.com/slib53/bloobox https://github.com/SLIB53/bloobox.git#main
```

Then, to run:

```sh
docker run --rm -it github.com/slib53/bloobox
```

#### Building locally

Clone the repository:

```sh
git clone https://github.com/SLIB53/bloobox.git
cd bloobox
```

Now build the image:

```sh
docker build --no-cache --rm -t local/bloobox .
```

Then, to run:

```sh
docker run --rm -it local/bloobox
```

### Installers

#### Terraform

To install Terraform, run the following command:

```sh
fish ~/scripts/install_terraform.fish
```

#### AWS CLI

To install the AWS CLI, run the following command:

```sh
fish ~/scripts/install_awscli.fish
```

#### Extras

To install extras, run the following command:

```sh
fish ~/scripts/install_extras.fish
```
