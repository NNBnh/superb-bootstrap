<h1 align="center"><i>SuperB Bootstrap</i></h1>
<p align="center">Bootstrap system that <i>SuperB</i>
<p align="center"><img src="https://img.shields.io/github/license/NNBnh/b.sh?labelColor=073551&color=4EAA25&style=for-the-badge" alt="License: GPL-3.0"> <img src="https://img.shields.io/github/last-commit/NNBnh/b.sh?labelColor=073551&color=4EAA25&style=for-the-badge">
<p align="center"><img src="https://img.shields.io/github/watchers/NNBnh/b.sh?labelColor=073551&color=4EAA25&style=flat-square"> <img src="https://img.shields.io/github/stars/NNBnh/b.sh?labelColor=073551&color=4EAA25&style=flat-square"> <img src="https://img.shields.io/github/forks/NNBnh/b.sh?labelColor=073551&color=4EAA25&style=flat-square"> <img src="https://img.shields.io/github/issues/NNBnh/b.sh?labelColor=073551&color=4EAA25&style=flat-square">

## About
**SuperB Bootstrap** is a *SuperB* bootstrap system.

### Features
- Super **portable**, work on almost any unix-like operating system.
- Super **low** [dependencies](#dependencies)
- Super **easy** to [setup](#setup-super-bootstrap) and [use](#usage)

## Contents
- [About](#about)
  - [Features](#features)
- [Contents](#contents)
- [Setup](#setup)
  - [Dependencies](#dependencies)
    - [To setup SuperB Bootstrap](#to-setup-superb-bootstrap)
    - [Installation process](#installation-process)
  - [Setup SuperB Bootstrap](#setup-superb-bootstrap)
- [Usage](#usage)

## Setup
### Dependencies
- One of these [operating system](https://github.com/NNBnh/bawkpack#supported-operating-system)
- `sh` to process

#### To setup SuperB Bootstrap
- `coreutils` will come with:
  - `mkdir` to create directory
  - `chmod` to make setup file executable

#### Installation process
- `git` or anything that can download dotfiles (optional)
- `bawkpack` to install packages list, it need:
  - `curl` or `wget` to get [`bawkpack`](https://github.com/NNBnh/bawkpack)
  - `awk` to read packages file ([`bawkpack`](https://github.com/NNBnh/bawkpack) dependencie)
- `stow` to link dotfiles

### Setup SuperB Bootstrap
First generate using [this template](https://github.com/NNBnh/superb-bootstrap/generate), or if you want to do it manually then create the dotfiles directory:

```sh
mkdir -p "$HOME/dotfiles/bootstrap"
mkdir -p "$HOME/dotfiles/home"
mkdir -p "$HOME/dotfiles/root"
mkdir -p "$HOME/dotfiles/extra"
echo '' >> "$HOME/dotfiles/bootstrap/packageslist"
echo '' >> "$HOME/dotfiles/bootstrap/setup"
```

You will have a directory structure that looks like this:

```
dotfiles/
├─ bootstrap/
│  ├─ packageslist  # Package-list
│  └─ setup         # Setup script
│
├─ home/            # Symlink to home (add any dotfiles like .config or .local that you what to bootstrap here)
├─ root/            # Symlink to root (same with this file but it will be symlink to '/' directory)
└─ extra/           # Not symlink (Other files that you want to backup but don't want to symlink)
```

Add packages to `packageslist` (learn more on [Bawkpack: Packages list](https://github.com/NNBnh/bawkpack#packages-list))

Add config scripts to `setup`, for example:

```sh
#!/bin/sh

#    ____    __
#   / __/__ / /___ _____
#  _\ \/ -_) __/ // / _ \
# /___/\__/\__/\_,_/ .__/
#                 /_/


# Install packages
    BAWKPACK_FILE='packageslist'
    read -p 'Enter your main packages manager: ' BAWKPACK_MAINPM
    curl -fsSL https://raw.githubusercontent.com/NNBnh/bawkpack/master/bawkpack | sh


# Before symlink
    # Create directories (to symlink files inside only, not the directory itself)
    mkdir $HOME/.local/bin
    mkdir $HOME/.config/godot
    mkdir $HOME/.config/retroarch
    mkdir $HOME/.config/git && echo '' >> $HOME/.config/git/config

    # Delete files that may conflict when symlink dotfiles
    rm .bashrc

# Symlink dotfiles
pwd="$PWD"
cd ..
stow -vt ~ home
sudo stow -vt / root
cd $pwd


# After symlink
    # Change default shell
    chsh -s "/usr/bin/fish"

    # Enable firewall
    sudo ufw enable


exit 0
```

###### Remember to make `setup` executable:

```sh
chmod +x "$HOME/dotfiles/bootstrap/setup"
```

Finally upload your dotfiles to a safe place.

## Usage
Just download your dotfiles, if you using `git`:

```sh
git clone https://github.com/yourname/dotfiles.git
```

Then execute the `setup` file:

```sh
./dotfiles/bootstrap/setup
```

Done!
