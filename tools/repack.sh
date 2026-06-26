#!/bin/bash

set -e

echo "[*] Repacking vendor.img..."

cd work

if [ ! -f vendor_raw.img ]; then
  echo "[!] vendor_raw.img not found"
  exit 1
fi

echo "[*] Converting raw -> sparse..."
img2simg vendor_raw.img vendor_patched.img

mkdir -p ../output
cp vendor_patched.img ../output/

echo "[+] Output saved to output/vendor_patched.img"