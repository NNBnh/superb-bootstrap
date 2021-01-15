<h1 align="center"><i>SuperB Bootstrap</i></h1>
<p align="center">Bootstrap system that <i>SuperB</i></p>
<p align="center"><img src="https://img.shields.io/github/license/NNBnh/b.sh?labelColor=073551&color=4EAA25&style=for-the-badge" alt="License: GPL-3.0"> <img src="https://img.shields.io/badge/version:-1.1-%234EAA25.svg?labelColor=073551&style=for-the-badge&logoColor=FFFFFF" alt="Version: 1.1"> <img src="https://img.shields.io/github/last-commit/NNBnh/b.sh?labelColor=073551&color=4EAA25&style=for-the-badge"></p>
<p align="center"><img src="https://img.shields.io/github/watchers/NNBnh/b.sh?labelColor=073551&color=4EAA25&style=flat-square"> <img src="https://img.shields.io/github/stars/NNBnh/b.sh?labelColor=073551&color=4EAA25&style=flat-square"> <img src="https://img.shields.io/github/forks/NNBnh/b.sh?labelColor=073551&color=4EAA25&style=flat-square"> <img src="https://img.shields.io/github/issues/NNBnh/b.sh?labelColor=073551&color=4EAA25&style=flat-square"></p>

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
  - [Setup SuperB Bootstrap](#setup-superb-bootstrap)
- [Usage](#usage)

## Setup
### Dependencies
- One of these [operating system](https://github.com/NNBnh/bawkpack#supported-operating-system)
- `sh` to process
- `git` or anything that can download dotfiles (optional)
- `curl` or `wget` to update [`bawkpack`](https://github.com/NNBnh/bawkpack) if needed (optional)
- `stow` to symlink dotfiles

### Setup SuperB Bootstrap
First generate using [this template](https://github.com/NNBnh/superb-bootstrap/generate), or if you want to do it manually then create the dotfiles directory:

```sh
mkdir -p "$HOME/dotfiles/home"
mkdir -p "$HOME/dotfiles/root"
mkdir -p "$HOME/dotfiles/extra"

: >> "$HOME/dotfiles/packageslist"
: >> "$HOME/dotfiles/setup"

curl -fsSL https://raw.githubusercontent.com/NNBnh/superb-bootstrap/master/extra/bawkpack --create-dirs --output "$HOME/dotfiles/extra/bawkpack"
chmod +x "$HOME/dotfiles/extra/bawkpack"
```

You will have a directory structure that looks like this:

```
dotfiles/
├─ home/           # Symlink to home (add any dotfiles like .config or .local that you what to bootstrap here)
├─ root/           # Symlink to root (same with this file but it will be symlink to '/' directory)
├─ extra/          # Not symlink (Other files that you want to backup but don't want to symlink)
│ └─ bawkpack      # Packages list installer
│
├─ packageslist    # Package list
└─ setup           # Setup script
```

Add packages to `packageslist` (learn more on [Bawkpack: Packages list](https://github.com/NNBnh/bawkpack#packages-list))

Add config scripts to `setup`, see [example](https://github.com/NNBnh/superb-bootstrap/blob/master/setup)

###### Remember to make `setup` executable:

```sh
chmod +x "$HOME/dotfiles/setup"
```

Finally upload your dotfiles to a safe place.

## Usage
Just download your dotfiles, if you using `git`:

```sh
git clone https://github.com/yourname/dotfiles.git
```

`cd` to `dotfiles`:

```sh
cd dotfiles
```

###### You have to `cd` to `dotfiles` in order to make `stow` work

Then execute the `setup` file:

```sh
./setup
```

Done!

> <h1 align="center">Made with ❤️ by <a href="https://github.com/NNBnh"><i>NNB</i></a></h1>
>
> <p align="center"><a href="https://www.buymeacoffee.com/nnbnh"><img src="https://img.shields.io/badge/buy_me_a_coffee%20-%23F7CA88.svg?logo=buy-me-a-coffee&logoColor=333333&style=for-the-badge" alt="Buy Me a Snack (Buy Me a Coffee)"></p>
