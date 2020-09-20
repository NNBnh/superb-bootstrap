<h1 align="center"><i>Super Bootstrap</i></h1>
<p align="center">Bootstrap that <i>SuperB</i>
<p align="center"><img src="https://img.shields.io/github/license/NNBnh/b.sh?labelColor=073551&color=4EAA25&style=for-the-badge" alt="License: GPL-3.0"> <img src="https://img.shields.io/github/languages/top/NNBnh/b.sh?logo=gnu-bash&labelColor=073551&color=4EAA25&logoColor=FFFFFF&style=for-the-badge" alt="Shell: 100%"> <img src="https://img.shields.io/badge/curl%20-%23073551.svg?style=for-the-badge&logo=curl&logoColor=FFFFFF" alt="Curl"> <img src="https://img.shields.io/github/last-commit/NNBnh/b.sh?labelColor=073551&color=4EAA25&style=for-the-badge">
<p align="center"><img src="https://img.shields.io/github/watchers/NNBnh/b.sh?labelColor=073551&color=4EAA25&style=flat-square"> <img src="https://img.shields.io/github/stars/NNBnh/b.sh?labelColor=073551&color=4EAA25&style=flat-square"> <img src="https://img.shields.io/github/forks/NNBnh/b.sh?labelColor=073551&color=4EAA25&style=flat-square"> <img src="https://img.shields.io/github/issues/NNBnh/b.sh?labelColor=073551&color=4EAA25&style=flat-square">

## About
**Super Bootstrap** is a *SuperB* bootstrap system written in [`pure sh`](https://github.com/dylanaraps/pure-sh-bible).

### Features
- Super **minimum** with exactly [**64** lines of `sh`](superbootstrap#L64).
- Super **low** [dependencies](#dependencies)
- Super **easy** to [setup](#setup-super-bootstrap) and [use](#usage)

## Contents
- [About](#about)
  - [Features](#features)
- [Contents](#contents)
- [Setup](#setup)
  - [Dependencies](#dependencies)
    - [To setup Super Bootstrap](#to-setup-super-bootstrap)
    - [To start Super Bootstrap](#to-start-super-bootstrap)
    - [Installation process](#installation-process)
  - [Setup Super Bootstrap](#setup-superbootstrap)
- [Usage](#usage)

## Setup
### Dependencies
- One of these linux distributions:
  - Archlinux's base
  - Debian's base
  - Voidlinux's base
- `sh` to process

#### To setup Super Bootstrap
- `coreutils` (`mkdir`) to create directory

#### To start Super Bootstrap
- `git` or anything that can download dotfiles
- `curl` or `wget` to use [`bawkpack`](https://github.com/NNBnh/bawkpack)
- `awk` to read packages file ([`bawkpack`](https://github.com/NNBnh/bawkpack) dependencie)

#### Installation process
- `stow` to link dotfiles

### Setup Super Bootstrap
First create the dotfiles directory:

```sh
mkdir -p "$HOME/dots/bootstrap"
mkdir -p "$HOME/dots/home"
mkdir -p "$HOME/dots/root"
mkdir -p "$HOME/dots/other"
mkdir -p "$HOME/dots/wiki"
echo '' >> "$HOME/dots/bootstrap/packageslist"
echo '#!/bin/sh' >> "$HOME/dots/bootstrap/setup"
```

You will have a directory structure that looks like this:

```
dots/
├─ bootstrap/
│  ├─ packageslist  # Package-list
│  └─ setup         # Setup script
│
├─ home/            # Symlink to home (add any dotfiles like .config or .local that you what to bootstrap here)
├─ root/            # Symlink to root (same with this file but it will be symlink to '/' directory)
├─ other/           # Not symlink (Other file that you want to backup but don't want to symlink)
└─ wiki/            # Info of dotfiles (Wiki about your rice, blog...)
```

Add packages to `packageslist`:

```
### Lable (use '#' to comments)
  APT:kakoune                  PAC:kakoune                  XBP:kakoune                # Comments...
  APT:neofetch                 PAC:neofetch                 XBP:neofetch               # Comments...
  FLA:org.godotengine.Godot    AUR:godot-bin                XBP:godot                  # Comments...
  SNA:blender                  PAC:blender                  XBP:blender                # Comments...
# SNA:retroarch                PAC:retroarch                XBP:retroarch              # Comment out a package
                               AUR:vimv-git               # XBP:vimv                   # Comment out a package only in XBPS
```

Add config scripts to `setup`:

```sh
#!/bin/sh


# Before symlink
    # Create directories (to only symlink files inside, not the directory)
    mkdir $HOME/.local/bin
    mkdir $HOME/.config/godot
    mkdir $HOME/.config/retroarch
    mkdir $HOME/.config/git && echo '' >> $HOME/.config/git/config


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

Finally upload your dotfiles.

## Usage
First download your dotfiles.

Then type this command to the terminal:

```sh
curl -fsSL https://raw.githubusercontent.com/NNBnh/bawkpack/master/bawkpack | sh
```

If you want to use `wget`:

```sh
wget -qO - https://raw.githubusercontent.com/NNBnh/bawkpack/master/bawkpack | sh
```
