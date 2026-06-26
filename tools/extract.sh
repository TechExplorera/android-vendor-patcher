#!/bin/bash

set -e

IMG="$1"

if [ -z "$IMG" ]; then
  echo "Usage: extract.sh vendor.img"
  exit 1
fi

echo "[*] Preparing workspace..."

mkdir -p work

cp "$IMG" work/vendor.img

cd work

echo "[*] Converting sparse -> raw..."
simg2img vendor.img vendor_raw.img

echo "[+] Done. Ready to mount vendor_raw.img"