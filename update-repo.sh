#!/bin/bash
set -e

cd "$(dirname "$0")"

# Create directory structure if needed
mkdir -p dists/stable/main/binary-amd64

# Create Packages file
cd dists/stable/main/binary-amd64
dpkg-scanpackages ../../../../pool/main > Packages
gzip -k -f Packages

# Create Release files
cd ../..
cat > Release <<EOF
Origin: Consair
Label: Consair
Suite: stable
Codename: stable
Version: 1.0
Architectures: amd64
Components: main
Description: Consair APT Repository
Date: $(date -Ru)
EOF

# Add checksums
apt-ftparchive release . >> Release

echo "Repository metadata updated!"
