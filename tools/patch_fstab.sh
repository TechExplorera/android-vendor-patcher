#!/bin/bash

TARGET="$1"

echo "[*] Searching vendor/etc..."

# Buscar SOLO fstab reales del vendor
FSTABS=$(find "$TARGET/vendor/etc" -type f -name "fstab*" 2>/dev/null)

if [ -z "$FSTABS" ]; then
  echo "[!] No vendor fstab found"
  exit 1
fi

for FSTAB in $FSTABS; do
  echo "[*] Patching: $FSTAB"

  # SOLO eliminar encryption (mínimo seguro)
  sed -i 's/fileencryption=[^, ]*//g' "$FSTAB"
  sed -i 's/metadata_encryption=[^, ]*//g' "$FSTAB"
  sed -i 's|keydirectory=/metadata/vold/metadata_encryption||g' "$FSTAB"
done

echo "[+] Done"