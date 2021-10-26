#!/usr/bin/env bash

set -e

[ "$#" -lt 2 ] && echo "Missing args: $0 {VERSIONS} {VARIANTS}";

versions=( $1 )
variants=( $2 )

image_dir="$(pwd)/docker-images"

mkdir -p -v "${image_dir}"

for version in "${versions[@]}"; do
  for variant in "${variants[@]}"; do
    if [ -d "${version}/${variant}" ]; then
      (cd "${version}/${variant}"; make IMAGE_DIR="${image_dir}")
    fi
  done
done