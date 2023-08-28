# NodeBB Docker

Repository to repack NodeBB for Docker since the official one seems to be outdated.

## Build

```
sh prepare.sh
podman image build -t nodebb .
```

## Registry

We use ghcr to store the images. You can pull the image with:

```
podman pull ghcr.io/fabricatorsltd/nodebb:latest
```