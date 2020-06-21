<h1 align="center"><b><i>B.sh</i></b></h1>
<p align="center">Dotfiles manager that <i>SuperB</i></p>


<!-- <p align="center"> -->
<!--     <img src="image/logo.png"> -->
<!-- </p> -->


## About
**B.sh** is a command-line tool written in `sh` to download and manager dotfiles. <br>

### Features
* Super **minimum** with only [**256** line of `sh`](b.sh).
* Super [**low Dependencies**](#dependencies):
* Super **Easy** to use:
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
* [About](#about)
  * [Features](#features)
* [Contents](#contents)
* [Setup](#setup)
  * [Dependencies](#dependencies)
    * [To start b.sh](#to-start-bsh)
    * [Installation process](#installation-process)
* [Usage](#usage)

## Setup
### Dependencies
#### To start b.sh
* One of this linux system:
  * Archlinux's base
  * Debian's base
  * Voidlinux's base
* `sh` to process
* `curl` or `wget` to take the script

#### Installation process
* `git` to download from git's repository
* `stow` to install dotfiles
* `awk` to read installation file

## Usage
Type this command to the terminal:
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/NNBnh/b.sh/master/b.sh)"
```
If you want to use `wget`:
```sh
sh -c "$(wget -qO - https://raw.githubusercontent.com/NNBnh/b.sh/master/b.sh)"
```
