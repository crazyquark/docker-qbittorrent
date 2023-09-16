#!/bin/bash

echo 'Patching dockerfile...'
rm -f Dockerfile.armhf
cp Dockerfile.aarch64 Dockerfile.armhf

sed -i 's/ghcr.io\/linuxserver\/baseimage-alpine:arm64v8-edge/crazyquark\/baseimage-alpine:armhf-edge/g' Dockerfile.armhf
diff Dockerfile.aarch64 Dockerfile.armhf

echo 'Building image & pushing'
docker build -f Dockerfile.armhf -t crazyquark/qbittorrent:armhf .
docker push crazyquark/qbittorrent:armhf
