#!/usr/bin/env bash

source /common.sh

# Building binaries for the specified platforms
# The `build` Makefile target is required
declare -a goarchs
goarchs=(${goarchs[@]:-linux\/amd64})
for goarch in "${goarchs[@]}"
do
  goos=${goarch%%/*}
  arch=${goarch##*/}

  if [[ "${arch}" =~ ^armv.*$ ]]; then
    goarm=${arch##*v}
    arch="arm"

    echo "# ${goos}-${arch}v${goarm}"
    prefix=".build/${goos}-${arch}v${goarm}"
    mkdir -p "${prefix}"
    GOARM=${goarm} GOOS=${goos} GOARCH=${arch} make PREFIX="${prefix}" build
  else
    echo "# ${goos}-${arch}"
    prefix=".build/${goos}-${arch}"
    mkdir -p "${prefix}"
    GOOS=${goos} GOARCH=${arch} make PREFIX="${prefix}" build
  fi
done

exit 0