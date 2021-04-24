<p align="center"><img width="100%" src="https://user-images.githubusercontent.com/43980777/109499307-49ca3000-7ac7-11eb-9f66-3a2c8f5e90b4.png"></p>
<p align="center">OS bootstrap-system/dotfiles-manager framework that <i>SuperB</i></p>
<p align="center"><a href="https://github.com/NNBnh/superb-bootstrap/blob/main/LICENSE"><img src="https://img.shields.io/github/license/NNBnh/superb-bootstrap?labelColor=2A2734&color=FF5F56&style=for-the-badge" alt="License: GPL-3.0"></a> <img src="https://img.shields.io/github/last-commit/NNBnh/superb-bootstrap?labelColor=2A2734&color=FF5F56&style=for-the-badge"></p>
<p align="center"><a href="https://github.com/NNBnh/superb-bootstrap/watchers"><img src="https://img.shields.io/github/watchers/NNBnh/superb-bootstrap?labelColor=2A2734&color=FF5F56&style=flat-square"></a> <a href="https://github.com/NNBnh/superb-bootstrap/stargazers"><img src="https://img.shields.io/github/stars/NNBnh/superb-bootstrap?labelColor=2A2734&color=FF5F56&style=flat-square"></a> <a href="https://github.com/NNBnh/superb-bootstrap/network/members"><img src="https://img.shields.io/github/forks/NNBnh/superb-bootstrap?labelColor=2A2734&color=FF5F56&style=flat-square"></a> <a href="https://github.com/NNBnh/superb-bootstrap/issues"><img src="https://img.shields.io/github/issues/NNBnh/superb-bootstrap?labelColor=2A2734&color=FF5F56&style=flat-square"></a></p>

## 💡 About
**SuperB Bootstrap** is a *SuperB* OS bootstrap-system/dotfiles-manager framework that can be installed with just one command on a new `*NIX` system installation.

### ✨ Features
- Super **portable**, work on almost any `*NIX` operating system, you don't need to install anything before the installation process
  - Don't know anything about [`git`](https://git-scm.com)? Dont't worry, SBB dotfiles can be host via [Nextcloud](https://nextcloud.com), [Google drive](https://www.google.com/drive) or [Dropbox](https://www.dropbox.com)...
- Super **organized** [file structure](#-file-structure) to config and share
- Super **easy** to [setup](#-setup) and [install](#-installation):
  - You can even install your dotfiles with **just one command** from a new `*NIX` system installation
- Super **flexible** with one config, you can bootstrap **cross-platform**. Supported package managers are:
  - Main packages manager:
    - [APT](https://wiki.debian.org/Apt)
    - [Mports](https://www.midnightbsd.org/mports)
    - [OpenBSD PKG](https://www.openbsd.org/faq/faq15.html)
    - [Pacman](https://wiki.archlinux.org/index.php/Pacman)
    - [Portage](https://wiki.gentoo.org/wiki/Portage)
    - [PKG IN](http://www.pkgsrc.org)
    - [PKG NG](https://github.com/freebsd/pkg)
    - [Slack PKG](https://slackpkg.org)
    - [Termux PKG](https://wiki.termux.com/wiki/Package_Management)
    - [XBPS](https://docs.voidlinux.org/xbps/index.html)
    - [Zypper](https://en.opensuse.org/Portal:Zypper)
  - Additional packages manager:
    - [AUR](https://wiki.archlinux.org/index.php/Arch_User_Repository)
    - [Flatpak](https://flatpak.org)
    - [Homebrew](https://docs.brew.sh)
    - [MacPorts](https://www.macports.org)
    - [MAS](https://github.com/mas-cli/mas)
    - [SBO](https://sbopkg.org)
    - [Snap](https://snapcraft.io)
  - Language packages manager:
    - [Basher](https://github.com/basherpm/basher)
    - [BPKG](https://github.com/bpkg/bpkg)
    - [NPM](https://www.npmjs.com)
    - [PIP](https://pypi.org)
    - [Yarn](https://yarnpkg.com)

## 🚀 Setup
First generate using [**this template**](https://github.com/NNBnh/superb-bootstrap-template/generate), or if you want, you can setup manually:

### 🔧 Manually
If you manage your dotfiles with [`git`](https://git-scm.com), run the following commands:

```sh
mkdir -p ~/dotfiles/home ~/dotfiles/root ~/dotfiles/extra

curl -fsSL https://raw.githubusercontent.com/NNBnh/superb-bootstrap-template/main/packageslist --create-dirs --output ~/dotfiles/packageslist
curl -fsSL https://raw.githubusercontent.com/NNBnh/superb-bootstrap-template/main/setup --create-dirs --output ~/dotfiles/setup

cd ~/dotfiles

git submodule add https://github.com/NNBnh/superb-bootstrap.git ./extra/sbb
git submodule add https://github.com/NNBnh/bsymlink.git ./extra/bsymlink
```

if not, run the following commands:

```sh
mkdir -p ~/dotfiles/home ~/dotfiles/root ~/dotfiles/extra

curl -fsSL https://raw.githubusercontent.com/NNBnh/superb-bootstrap-template/main/packageslist --create-dirs --output ~/dotfiles/packageslist
curl -fsSL https://raw.githubusercontent.com/NNBnh/superb-bootstrap-template/main/setup --create-dirs --output ~/dotfiles/setup

curl -fsSL https://raw.githubusercontent.com/NNBnh/superb-bootstrap/master/sbb --create-dirs --output ~/dotfiles/extra/sbb/sbb
curl -fsSL https://raw.githubusercontent.com/NNBnh/bsymlink/main/bin/bsymlink --create-dirs --output ~/dotfiles/extra/bsymlink/bin/bsymlink
```

> *Note: if you don't use Git, you have to manually update SBB and Bsymlink by running the last two commands.*

### 📁 File structure
The file structure will looks like this:

```console
dotfiles/
├─ home/              # Symlink to home (add anything like .config/ or .local/ that you what to bootstrap here)
├─ root/              # Symlink to root (same with this directory but it will be symlink to '/' directory)
├─ extra/             # Other files that you want to backup or store but don't want to symlink
│  ├─ sbb/...         # This contain the script file to bootstrap
│  └─ bsymlink/...    # This contain the symlink tool
├─ packageslist       # Packages list
└─ setup              # Setup script
```

### ⚙️  Customization
Next, customizing your your dotfiles:
- Move everything you want to backup in `home/` and `root/`
- Add packages to `packageslist` (see [example](https://github.com/NNBnh/superb-bootstrap-template/blob/main/packageslist))
- Config the `setup` scripts (see [example](https://github.com/NNBnh/superb-bootstrap-template/blob/main/setup))

> *Remember to make `setup` executable:*
>
> ```sh
> chmod +x ~/dotfiles/setup
> ```

Finally store or upload your dotfiles to a safe place.

## 📥 Installation
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

## 💌 Credits
Special thanks to:
- [**Xfzv**](https://github.com/xfzv) for [many bug reports](https://github.com/NNBnh/superb-bootstrap/issues/3) and [suggestions](https://github.com/NNBnh/superb-bootstrap/issues/4)
- [**Obyyx**](https://github.com/obyyx) for [fixing paru's flags](https://github.com/NNBnh/superb-bootstrap/pull/10)
- [**LoricAndre**](https://github.com/LoricAndre) for [the great design suggestion](https://github.com/NNBnh/superb-bootstrap/issues/24) and [make Paru upgrade AUR packages on bootstrap](https://github.com/NNBnh/superb-bootstrap/pull/20)
- [**Simon Weiss**](https://github.com/weiss-d) for [most of bugs fix, improvement to 1.7.3](https://github.com/NNBnh/superb-bootstrap/releases/tag/1.7.3), and more...
- [**Package managers supported**](https://github.com/NNBnh/superb-bootstrap/issues/5):
  - [**Xfzv**](https://github.com/xfzv) for Portage and Zypper supported
  - [**Kraileth**](https://www.reddit.com/user/kraileth) for [PKG NG supported](https://www.reddit.com/r/BSD/comments/lzo4nt/help_wanted_bss_os_bootstrapsystemdotfilesmanager/gq4dwu6?utm_source=share&utm_medium=web2x&context=3)
  - [**Miko**](https://github.com/mikoxyz) for [OpenBSD PKG](https://github.com/NNBnh/superb-bootstrap/pull/11) and [PKG IN](https://github.com/NNBnh/superb-bootstrap/pull/12) supported
  - [**Justin**](https://github.com/arcadellama) for Slack PKG supported
  - [**Laffer1**](https://www.reddit.com/user/laffer1) for [Mports supported](https://www.reddit.com/r/BSD/comments/lzo4nt/help_wanted_bss_os_bootstrapsystemdotfilesmanager/gq8gxa1?utm_source=share&utm_medium=web2x&context=3)
  - [**Andrea Velásquez**](https://github.com/a4vg) for MacPorts and MAS supported
  - [**LoricAndre**](https://github.com/LoricAndre) for [PIP and NPM supported](https://github.com/NNBnh/superb-bootstrap/pull/18)
- [**Carbon**](https://carbon.now.sh) from [@carbon_app](https://twitter.com/carbon_app) to create the banner

<br><br><br><br>

---

> <h1 align="center">Made with ❤️ by <a href="https://github.com/NNBnh"><i>NNB</i></a></h1>
>
> <p align="center"><a href="https://www.buymeacoffee.com/nnbnh"><img src="https://img.shields.io/badge/buy_me_a_coffee%20-%23F7CA88.svg?logo=buy-me-a-coffee&logoColor=333333&style=for-the-badge" alt="Buy Me a Coffee"><a></p>
