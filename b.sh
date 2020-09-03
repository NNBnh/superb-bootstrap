#!/bin/bash

# ██                  ██
# ██                  ██
# ██████ ▓▓▓▓⣷⣄ █████ ██████
# ██  ██ ▓▓▓▓▓▓ ██▇▇▇ ██  ██
# ██████ ▓▓  ▓▓ ▇▇▇██ ██  ██
#        ▓▓▓▓▓▓

# File:         b.sh
# Description:  Dotfiles manager that superB
# Author:       NNB
#               └─ https://github.com/NNBnh
# URL:          https://github.com/NNBnh/b.sh
# License:      GPLv3

#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.


# Value
dir_now=$PWD
declare -A pm=(
	[1,0]='AUR'       [1,1]='yay'          [1,2]=' -S --nodiffmenu --save' [1,3]='sudo pacman -S --noconfirm --needed yay || ins-yay'                                           [1,4]='AUR'
	[2,0]='Flatpak'   [2,1]='sudo flatpak' [2,2]=' install'                [2,3]='sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo' [2,4]='FLA'
	[3,0]='Snapcraft' [3,1]='sudo snap'    [3,2]=' install'                [3,3]=''                                                                                             [3,4]='SNA'
)

function prompt() {
	echo '''
  ██                  ██
  ██                  ██
  ██████ ▓▓▓▓⣷⣄ █████ ██████
  ██  ██ ▓▓▓▓▓▓ ██▇▇▇ ██  ██
  ██████ ▓▓  ▓▓ ▇▇▇██ ██  ██
         ▓▓▓▓▓▓

  Dotfiles manager that superB
'''
	read -s -p 'Press [↵ Enter]'

	echo '''
Enter your git repository address
  __ ______
  ╷  ╷
  │  └ Username
  │
  └ gh = github
    gl = gitlab
    bb = bitbucket
    ct = custom

(Leave all blank to use current working directory)
(Enter "+" to make new dotfiles directory)
'''
	read -p 'Datas address: ' -a options_repo
	case ${options_repo[1]} in
		'') repo="https://github.com/${options_repo[0]}/dots.git" ;;
		*)
			case ${options_repo[0]} in
				'gh') repo="https://github.com/${options_repo[1]}/dots.git"    ;;
				'gl') repo="https://gitlab.com/${options_repo[1]}/dots.git"    ;;
				'bb') repo="https://bitbucket.org/${options_repo[1]}/dots.git" ;;
				'ct') repo=$options_repo                                           ;;
				'+')  repo='+'                                                     ;;
				'')   repo=''                                                      ;;
			esac
		;;
	esac

	if [[ ! -z $options_repo ]]; then
		echo '''
Enter directory to store dotfiles
(Enter "." to use current working directory)
'''
		read -p 'Location: ' options_dir
		case $options_dir in
			'')  dir_dotfiles="$$HOME/dots"    ;;
			'.') dir_dotfiles=$dir_now             ;;
			*)   dir_dotfiles="$HOME/$options_dir" ;;
		esac
	else
		dir_dotfiles=$dir_now
	fi

	while :; do
		echo '''
Enter the distribution
  a = Archlinux base
  d = Debian base
  v = Voidlinux base
'''
		read -N 1 -p 'Distro: ' options_pm
		case $options_pm in
			'a') pm+=( [0,0]='Archlinux' [0,1]='sudo pacman' [0,2]=' -Sy --noconfirm --needed' [0,3]=' -Syu --noconfirm --needed' [0,4]='PAC' ) && break ;;
			'd') pm+=( [0,0]='Debian'    [0,1]='sudo apt'    [0,2]=' install -y'               [0,3]=' install -y'                [0,4]='APT' ) && break ;;
			'v') pm+=( [0,0]='Voidlinux' [0,1]='sudo xbps'   [0,2]='-install -Sy'              [0,3]='-install -Syu'              [0,4]='XBP' ) && break ;;
		esac
	done
}


# Functions
	# Dependencies
	function ins-dependencies() {
		echo 'Installing dependencies'

		${pm[0,1]}${pm[0,3]} git stow awk
	}

	# Packages
	function ins-packages() {
		if [[ -f "$dir_dotfiles/install/info" ]]; then
			info=$(awk '{gsub("#.*$", "");print}' "$dir_dotfiles/install/info")
			info_aur=$(echo $info | awk "!/${pm[0,4]}:/")
			info_flatpak=$(echo $info_aur | awk "!/FLA:/")
			info_snap=$(echo $info_flatpak | awk "!/SNA:/")

			[[ $options_pm == 'a' ]] && [[ $info_aur     == *AUR:* ]] && pm_add+="1 "
			                            [[ $info_flatpak == *FLA:* ]] && pm_add+="2 " && dependencies[0]+="flatpak "
			[[ $options_pm == 'a' ]] && [[ $info_snap    == *SNA:* ]] && pm_add+="3 " && pm[3,3]='sudo pacman -S --noconfirm --needed snapd || ins-snap'
			[[ $options_pm == 'd' ]] && [[ $info_snap    == *SNA:* ]] && pm_add+="3 " && dependencies[0]+="snapd "

			for p in 0 $pm_add; do
				echo "Installing ${pm[$p,0]} Packages"

				${pm[$p,4]}

				${pm[$p,1]}${pm[$p,2]} ${dependencies[$p]} \
					$(echo info \
					| awk -v FPAT="${pm[$p,3]}:[^\S]+" 'NF{ print $1 }' \
					| awk "{gsub(\"${pm[$p,3]}:\", \"\");print}")
			done
		fi
	}

		# YAY
		function ins-yay() {
			echo 'Installing YAY'

			git clone https://aur.archlinux.org/yay.git "$HOME/yay" \
				&& cd "$HOME/yay" \
				&& makepkg -si
		}

		# Snap
		function ins-snap() {
			echo 'Installing Snap'

			git clone https://aur.archlinux.org/snapd.git "$HOME/snap" \
				&& cd "$HOME/snap" \
				&& makepkg -si \
				&& sudo systemctl enable --now snapd.socket \
				&& sudo ln -s /var/lib/snapd/snap /snap
		}

	# Dotfiles
		# Download dotfiles
		function dl-dotfiles() {
			if [[ $repo = '+' ]]; then
				echo 'Make dotfiles directory'

				mkdir -p $dir_dotfiles/{install,home,root,other}
				echo '
# This file stores package-list and installation settings.
#
# Packages-lists:              │  Exemple:
#   syntax: ___:______         │    # This is a comment
#           ╷   ╷              │
#           │   └ package      │    # Terminal stuff
#           │                  │    PAC:alacritty APT:alacritty XBP:alacritty
#           └ PAC = archlinux  │
#             APT = Debian     │        # Cool tool
#             XBP = voidlinux  │        PAC:figlet APT:figlet XBP:figlet
#             AUR = aur        │
#             FLA = flatpak    │    # Game maker
#             SNA = Snapcraft  │    AUR:godot FLA:org.godotengine.Godot XBP:godot
#                              │
#
' > "$dir_dotfiles/install/info"
				echo '#!/bin/sh

# This script file ran before dotfiles were linked
' > "$dir_dotfiles/install/before"
				echo '#!/bin/sh

# This script file ran after dotfiles were linked
' > "$dir_dotfiles/install/after"
				chmod +x {before,after}
			elif [[ -z $repo ]]; then
				echo 'Download dotfiles'

				git clone $repo $dir_dotfiles && dotfiles='exist'
			fi
		}

		# Install dotfiles
		function ins-dotfiles() {
			echo 'Installing dotfiles'

			cd $dir_dotfiles

			for dir_stow in 'home' 'root'; do
				if [[ -d "$dir_dotfiles/$dir_stow" ]]; then
					[[ $dir_stow == 'root' ]] && stow_root='sudo'
					while :; do
						$stow_root stow -vt ~ $dir_stow && break
						echo 'Please remove all conflict file then press [Ctrl+d]'
						$SHELL
					done
				else
					echo "$dir_dotfiles/$dir_stow directory does not exist"
				fi
			done

			cd $dir_now
		}

	# Before
	function exec-before() {
		echo 'Executing before installation'

		[[ -f "$dir_dotfiles/install/before" ]] \
			&& "$dir_dotfiles/install/before" \
			|| echo "$dir_dotfiles/install/before file does not exist"
	}

	# After
	function exec-after() {
		echo 'Executing after installation'

		[[ -f "$dir_dotfiles/install/after" ]] \
			&& "$dir_dotfiles/install/after" \
			|| echo "$dir_dotfiles/install/after file does not exist"
	}


# Installation
for stage in 'prompt ins-dependencies dl-dotfiles ins-packages exec-before ins-dotfiles exec-after'; do
	$stage
done


exit

# Yes, this file has exactly 256 lines.
