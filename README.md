# clean docker  environment

A clean docker virtual environment

## Getting Started

### Prerequisities

This project requires [Vagrant](https://www.vagrantup.com/) to run.

### Usage

Using it with the defaults is simple:

```bash
vagrant up dev
```

Configuration options are provided via environment variables:

```bash
VAGRANT_BOX=<The vagrant box> \
VAGRANT_MEMORY=<Size of the memory> \
VAGRANT_HTTP_PROXY=<HTTP proxy> \
VAGRANT_HTTPS_PROXY=<HTTPS proxy> \
VAGRANT_NO_PROXY=<Hosts which should not be proxied> \
VAGRANT_APT_HTTP_PROXY=<Aptitude HTTP proxy> \
VAGRANT_APT_HTTPS_PROXY=<Aptitude HTTPS proxy> \
vagrant up dev
```
Currently only the *ubuntu/wily64* box is supported.

## License

This project is licensed under the MIT License - see the
[LICENSE.md](LICENSE.md) file for details
