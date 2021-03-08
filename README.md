<p align="center"><img width="100%" src="https://user-images.githubusercontent.com/43980777/109499307-49ca3000-7ac7-11eb-9f66-3a2c8f5e90b4.png"></p>
<p align="center">OS bootstrap-system/dotfiles-manager framework that <i>SuperB</i></p>
<p align="center"><a rel="license" href="http://creativecommons.org/licenses/by/4.0"><img src="https://img.shields.io/badge/license-cc_by_4.0-%23FF5F56.svg?labelColor=2A2734&style=for-the-badge&logoColor=FFFFFF" alt="License: CC BY 4.0"></a> <a href="https://github.com/NNBnh/superb-bootstrap"><img src="https://img.shields.io/badge/version-1.5.5-%23FF5F56.svg?labelColor=2A2734&style=for-the-badge&logoColor=FFFFFF" alt="Version: 1.5.5"></a></p>
<p align="center"><a href="https://github.com/NNBnh/superb-bootstrap/watchers"><img src="https://img.shields.io/github/watchers/NNBnh/superb-bootstrap?labelColor=2A2734&color=FF5F56&style=flat-square"></a> <a href="https://github.com/NNBnh/superb-bootstrap/stargazers"><img src="https://img.shields.io/github/stars/NNBnh/superb-bootstrap?labelColor=2A2734&color=FF5F56&style=flat-square"></a> <a href="https://github.com/NNBnh/superb-bootstrap/network/members"><img src="https://img.shields.io/github/forks/NNBnh/superb-bootstrap?labelColor=2A2734&color=FF5F56&style=flat-square"></a> <a href="https://github.com/NNBnh/superb-bootstrap/issues"><img src="https://img.shields.io/github/issues/NNBnh/superb-bootstrap?labelColor=2A2734&color=FF5F56&style=flat-square"></a></p>

## About
**SuperB Bootstrap** is a *SuperB* OS bootstrap-system/dotfiles-manager framework that can be installed with just one command on a new Unix system installation.

### Features
- Super **portable**, work on almost any Unix and Unix-like operating system, it can even install dotfiles locally
  - Don't know anything about [`git`](https://git-scm.com)? Dont't worry, SBB dotfiles can be host via [Nextcloud](https://nextcloud.com), [Google drive](https://www.google.com/drive) or [Dropbox](https://www.dropbox.com)...
- Super **minimum** [dependencies](#dependencies), you don't need to install anything before the installation process
- Super **organized** [file structure](#setup) to config and share
- Super **easy** to [setup](#setup) and [install](#usage):
  - Similar to [Stow method](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html), it's managing your dotfiles by storing them in a subdirectory (`dotfiles/home/`, `dotfiles/root/`) and symlinking them to their original location
  - You can even install your dotfiles with **just one command** from a new Unix system installation
- Super **flexible** with one config, you can bootstrap **cross-platform**. Supported package managers are:
  - [APT](https://wiki.debian.org/Apt)
  - [Mports](https://www.midnightbsd.org/mports)
  - [OpenBSD PKG](https://www.openbsd.org/faq/faq15.html)
  - [Pacman](https://wiki.archlinux.org/index.php/Pacman)
  - [Portage](https://wiki.gentoo.org/wiki/Portage)
  - [PKG NG](https://github.com/freebsd/pkg)
  - [Slack PKG](https://slackpkg.org)
  - [XBPS](https://docs.voidlinux.org/xbps/index.html)
  - [Zypper](https://en.opensuse.org/Portal:Zypper)
  - [AUR](https://wiki.archlinux.org/index.php/Arch_User_Repository)
  - [Flatpak](https://flatpak.org)
  - [Homebrew](https://docs.brew.sh)
  - [SBO](https://sbopkg.org)
  - [Snap](https://snapcraft.io)

## Contents
- [About](#about)
  - [Features](#features)
- [Contents](#contents)
- [Dependencies](#dependencies)
- [Setup](#setup)
- [Install](#install)
- [Credits](#credits)

## Dependencies
- `sh` to process

## Setup
First generate using [this template](https://github.com/NNBnh/superb-bootstrap/generate), or if you want to do it manually then create the dotfiles directory:

```sh
mkdir -p "$HOME/dotfiles/home" "$HOME/dotfiles/root" "$HOME/dotfiles/extra"

curl -fsSL 'https://raw.githubusercontent.com/NNBnh/superb-bootstrap/master/packageslist' --create-dirs --output "$HOME/dotfiles/packageslist"
curl -fsSL 'https://raw.githubusercontent.com/NNBnh/superb-bootstrap/master/setup'        --create-dirs --output "$HOME/dotfiles/setup"
```

You will have a file structure that looks like this:

```console
dotfiles/
├─ home/           # Symlink to home (add anything like .config/ or .local/ that you what to bootstrap here)
├─ root/           # Symlink to root (same with this directory but it will be symlink to '/' directory)
├─ extra/          # Not symlink (Other files that you want to backup but don't want to symlink)
├─ packageslist    # Packages list
└─ setup           # Setup script
```

Add packages to `packageslist`, see [example](https://github.com/NNBnh/superb-bootstrap/blob/master/packageslist)

Add config scripts to `setup`, see [example](https://github.com/NNBnh/superb-bootstrap/blob/master/setup)

###### Remember to make `setup` executable:

```sh
chmod +x "$HOME/dotfiles/setup"
```

Finally upload your dotfiles to a safe place.

## Install
To install your dotfiles, put the dotfiles to the desired location then execute `setup` file.

For example if you store your dotfiles on [Github](https://github.com), first download it:

```sh
git clone https://github.com/yourname/dotfiles.git
```

`cd` to `dotfiles`:

```sh
cd dotfiles
```

Then execute the `setup` file:

```sh
./setup
```

You can install your dotfiles with just one command:

```sh
git clone https://github.com/yourname/dotfiles.git && ./dotfiles/setup
```

## Credits
Special thanks to:
- [**Xfzv**](https://github.com/xfzv) for [many bug reports](https://github.com/NNBnh/superb-bootstrap/issues/3) and [suggestions](https://github.com/NNBnh/superb-bootstrap/issues/4)
- [**Obyyx**](https://github.com/obyyx) for [fixing paru's flags](https://github.com/NNBnh/superb-bootstrap/pull/10)
- [**Package managers supported**]:
  - Portage and Zypper supported by [Xfzv](https://github.com/xfzv)
  - [PKG NG](https://www.reddit.com/r/BSD/comments/lzo4nt/help_wanted_bss_os_bootstrapsystemdotfilesmanager/gq4dwu6?utm_source=share&utm_medium=web2x&context=3) supported by [Kraileth](https://www.reddit.com/user/kraileth)
  - [OpenBSD PKG](https://github.com/NNBnh/superb-bootstrap/pull/11) supported by [Miko](https://github.com/mikoxyz)
  - Slack PKG supported by [Justin](https://github.com/arcadellama)
- [**Carbon**](https://carbon.now.sh) from [@carbon_app](https://twitter.com/carbon_app) to create the banner

<br><br><br><br>

---

> <h1 align="center">Made with ❤️ by <a href="https://github.com/NNBnh"><i>NNB</i></a></h1>
>
> <p align="center"><a href="https://www.buymeacoffee.com/nnbnh"><img src="https://img.shields.io/badge/buy_me_a_coffee%20-%23F7CA88.svg?logo=buy-me-a-coffee&logoColor=333333&style=for-the-badge" alt="Buy Me a Coffee"><a></p>

---

> <p align="center"><b>Copyright © 2020-2021 by <a href="https://github.com/NNBnh">NNB</a></b></p>
> <p align="center"><a rel="license" href="http://creativecommons.org/licenses/by/4.0"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0">Creative Commons Attribution 4.0 International License</a>.</p>
