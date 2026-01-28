#!/usr/bin/env bash
set -e

UPSTREAM=https://gitlab.com/Linaro/arm64-laptops/linux.git
BRANCH=qcom-laptops

if [ ! -d linux ]; then
  git clone --branch $BRANCH --depth=1 $UPSTREAM linux
else
  cd linux
  git fetch origin
  git reset --hard origin/$BRANCH
fi
