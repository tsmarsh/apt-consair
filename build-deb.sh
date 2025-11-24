#!/bin/bash
set -e

# Build the debian package
cd "$(dirname "$0")"

# Clone the source if not present
if [ ! -d "consair" ]; then
    git clone https://github.com/tsmarsh/consair.git consair
fi

cd consair

# Copy debian directory
cp -r ../debian .

# Build the package
dpkg-buildpackage -us -uc -b

# Move the .deb to pool
mv ../consair_*.deb ../pool/main/c/consair/

echo "Package built successfully!"
