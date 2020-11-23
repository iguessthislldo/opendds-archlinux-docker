# opendds-archlinux-docker

Docker images **just** for building the Arch User Repository OpenDDS packages:
[`opendds`](https://aur.archlinux.org/packages/opendds/) and
[`opendds-git`](https://aur.archlinux.org/packages/opendds-git/)

To build `opendds-git` locally run:

```
docker build . --file=Dockerfile
```

To build `opendds` run:

```
docker build . --file Dockerfile --build-arg AUR_PACKAGE=opendds
```
