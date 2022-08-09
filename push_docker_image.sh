#!/usr/bin/env bash -x

VERSION="1.0.0"
docker build --no-cache -t urook/java-message-sender:${VERSION} -t urook/java-message-sender:latest .
docker push urook/java-message-sender:${VERSION}
docker push urook/java-message-sender:latest