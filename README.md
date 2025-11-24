# Consair APT Repository

This repository hosts the APT packages for Consair, a Lisp interpreter written in Rust.

## Installation

Add the repository to your system:

```bash
# Add the repository
echo "deb [trusted=yes] https://tsmarsh.github.io/apt-consair stable main" | sudo tee /etc/apt/sources.list.d/consair.list

# Update package list
sudo apt update

# Install consair
sudo apt install consair
```

## Usage

After installation, run:

```bash
cons
```

## Building Locally

To build the package locally:

```bash
./build-deb.sh
./update-repo.sh
```

## Repository Structure

- `debian/` - Debian package control files
- `pool/main/c/consair/` - Compiled .deb packages
- `dists/stable/main/binary-amd64/` - Repository metadata
- `.github/workflows/` - GitHub Actions for automated builds
