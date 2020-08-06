<p align="center"><img width="50%" src="logo.png" alt="B.sh">
<p align="center">Dotfiles manager that <i>SuperB</i>
<p align="center"><img src="https://img.shields.io/github/license/NNBnh/b.sh?style=for-the-badge" alt="License: GPL-3.0"> <img src="https://img.shields.io/github/languages/top/NNBnh/b.sh?style=for-the-badge" alt="Shell: 100%"> <img src="https://img.shields.io/github/last-commit/NNBnh/b.sh?style=for-the-badge">
<p align="center"><img src="https://img.shields.io/github/watchers/NNBnh/b.sh?style=flat-square"> <img src="https://img.shields.io/github/stars/NNBnh/b.sh?style=flat-square"> <img src="https://img.shields.io/github/forks/NNBnh/b.sh?style=flat-square"> <img src="https://img.shields.io/github/issues/NNBnh/B.sh?style=flat-square">

## About
**B.sh** is a *SuperB* dotfiles manager written in `sh`.

###### NOTE: B.sh pronounce as B-dot-sh.

### Features
- Super **minimum** with only [**256** lines of `sh`](b.sh#L256).
- Super [**low dependencies**](#dependencies):
- Super **easy** to use:

```
Dotfiles/
├─ .git/
├─ install/
│  ├─ info   # This file stores package-list and installation settings
│  ├─ before # This script file ran before dotfiles were linked
│  └─ after  # This script file ran after dotfiles were linked
│
├─ home/     # Everything in here will be linked to home directory (~)
├─ root/     # Everything in here will be linked to root directory (/)
└─ other/    # You can store anything here that you don't want it to linked
```

## Contents
- [About](#about)
  - [Features](#features)
- [Contents](#contents)
- [Setup](#setup)
  - [Dependencies](#dependencies)
    - [To start b.sh](#to-start-bsh)
    - [Installation process](#installation-process)
- [Usage](#usage)

## Setup
### Dependencies
#### To start b.sh
- One of these linux distributions:
  - Archlinux's base
  - Debian's base
  - Voidlinux's base
- `sh` to process
- `curl` or `wget` to take the script

#### Installation process
- `git` to download from git's repository
- `stow` to install dotfiles
- `awk` to read installation file

## Usage
Type this command to the terminal:

```sh
curl -fsSL https://raw.githubusercontent.com/NNBnh/b.sh/master/b.sh | sh
```

If you want to use `wget`:

```sh
wget -qO - https://raw.githubusercontent.com/NNBnh/b.sh/master/b.sh | sh
```
