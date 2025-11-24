#!/bin/bash
set -e

# Build the debian package
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

# Clone the source if not present
if [ ! -d "consair" ]; then
    git clone https://github.com/tsmarsh/consair.git consair
fi

cd consair

# Copy debian directory
cp -r ../debian .

# Build the package
dpkg-buildpackage -us -uc -b

# Move the .deb to pool (create directory if needed)
mkdir -p "$SCRIPT_DIR/pool/main/c/consair/"
mv ../consair_*.deb "$SCRIPT_DIR/pool/main/c/consair/"

echo "Package built successfully!"
