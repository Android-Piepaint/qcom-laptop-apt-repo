#!/usr/bin/env bash
set -e

REPO_DIR=apt-repo
DIST=stable
ARCH=arm64

git config user.name "kernel-ci"
git config user.email "kernel-ci@users.noreply.github.com"

rm -rf $REPO_DIR
mkdir -p $REPO_DIR/pool/main
mkdir -p $REPO_DIR/dists/$DIST/main/binary-$ARCH

cp out/*.deb $REPO_DIR/pool/main/

dpkg-scanpackages -a $ARCH pool > \
  $REPO_DIR/dists/$DIST/main/binary-$ARCH/Packages

gzip -k -f $REPO_DIR/dists/$DIST/main/binary-$ARCH/Packages

cat > $REPO_DIR/dists/$DIST/Release <<EOF
Origin: Qualcomm ARM64 Kernel
Label: Qualcomm ARM64 Kernel
Suite: stable
Codename: stable
Architectures: arm64
Components: main
Description: Linux kernel for Qualcomm ARM64 laptops
EOF

git checkout --orphan gh-pages
git rm -rf .
mv $REPO_DIR/* .
git add .
git commit -m "Update APT repository"
git push -f origin gh-pages
