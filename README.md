<h1 align="center"><i>SuperB Bootstrap</i></h1>
<p align="center">Bootstrap system that <i>SuperB</i></p>
<p align="center"><img src="https://img.shields.io/github/license/NNBnh/superb-bootstrap?labelColor=073551&color=4EAA25&style=for-the-badge" alt="License: GPL-3.0"> <img src="https://img.shields.io/badge/version-1.3-%234EAA25.svg?labelColor=073551&style=for-the-badge&logoColor=FFFFFF" alt="Version: 1.3"></p>
<p align="center"><img src="https://img.shields.io/github/watchers/NNBnh/superb-bootstrap?labelColor=073551&color=4EAA25&style=flat-square"> <img src="https://img.shields.io/github/stars/NNBnh/superb-bootstrap?labelColor=073551&color=4EAA25&style=flat-square"> <img src="https://img.shields.io/github/forks/NNBnh/superb-bootstrap?labelColor=073551&color=4EAA25&style=flat-square"> <img src="https://img.shields.io/github/issues/NNBnh/superb-bootstrap?labelColor=073551&color=4EAA25&style=flat-square"></p>

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
- `git` or anything that can download and upload dotfiles (optional)

### Setup SuperB Bootstrap
First generate using [this template](https://github.com/NNBnh/superb-bootstrap/generate), or if you want to do it manually then create the dotfiles directory:

```sh
mkdir -p "$HOME/dotfiles/home"
mkdir -p "$HOME/dotfiles/root"
mkdir -p "$HOME/dotfiles/extra"

: >> "$HOME/dotfiles/packageslist"
: >> "$HOME/dotfiles/setup"

curl -fsSL https://raw.githubusercontent.com/NNBnh/superb-bootstrap/master/extra/bawkpack --create-dirs --output "$HOME/dotfiles/extra/bawkpack"
curl -fsSL https://raw.githubusercontent.com/NNBnh/bsymlink/main/bsymlink --create-dirs --output "$HOME/dotfiles/extra/bsymlink"
chmod +x "$HOME/dotfiles/extra/"*
```

You will have a directory structure that looks like this:

```
dotfiles/
├─ home/           # Symlink to home (add any dotfiles like .config or .local that you what to bootstrap here)
├─ root/           # Symlink to root (same with this file but it will be symlink to '/' directory)
├─ extra/          # Not symlink (Other files that you want to backup but don't want to symlink)
│ ├─ bawkpack      # Packages list installer
│ └─ bsymlink      # Batch symlink tool
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

<br><br><br><br>

---

> <h1 align="center">Made with :heart: by <a href="https://github.com/NNBnh"><i>NNB</i></a></h1>
>
> <p align="center"><a href="https://www.buymeacoffee.com/nnbnh"><img src="https://img.shields.io/badge/buy_me_a_coffee%20-%23F7CA88.svg?logo=buy-me-a-coffee&logoColor=333333&style=for-the-badge" alt="Buy Me a Coffee"></p>

---

> <p align="center"><b>Copyright © 2021 by <a href="https://github.com/NNBnh">NNB</a></b></p>
> <p align="center"><a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.</p>
