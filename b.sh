#!/bin/sh

# ██                    ██
# ██                    ██
# ██████  ▓▓▓▓⣷⣄  █████ ██████
# ██  ██  ▓▓▓▓▓▓  ██▇▇▇ ██  ██
# ██████  ▓▓  ▓▓  ▇▇▇██ ██  ██
#         ▓▓▓▓▓▓

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


dir_now="${PWD}"
declare -A pm
pm=(
	[1,0]='AUR'       [1,1]='yay'     [1,2]=' -S --nodiffmenu --save' [1,3]='sudo pacman -S --noconfirm --needed yay || ins-yay'                                           [1,4]='AUR'
	[2,0]='Flatpak'   [2,1]='flatpak' [2,2]=' install'                [2,3]='sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo' [2,4]='FLA'
	[3,0]='Snapcraft' [3,1]='snap'    [3,2]=' install'                [3,3]=''                                                                                             [3,4]='SNA'
)

# Functions
	# Ddependencies
	function ins-dependencies() {
		print 'Installing dependencies'

		sudo ${pm[0,1]}${pm[0,3]} git stow awk
	}

	function ins-packages() {
		if [[ -f "${dir_dotfiles}/install/info" ]]; then
			info=$(awk '{gsub("#.*$", "");print}' "${dir_dotfiles}/install/info")

			[[ "${options_pm}" == 'a' ]] && [[ "${info}" == *AUR:* ]] && pm_add+="1 "
			                                [[ "${info}" == *FLA:* ]] && pm_add+="2 " && dependencies[0]+="flatpak "
			[[ "${options_pm}" == 'a' ]] && [[ "${info}" == *SNA:* ]] && pm_add+="3 " && pm[3,3]='sudo pacman -S --noconfirm --needed snapd || ins-snap'
			[[ "${options_pm}" == 'd' ]] && [[ "${info}" == *SNA:* ]] && pm_add+="3 " && dependencies[0]+="snapd "

			for p in "0 ${pm_add}"
			do
				print "Installing ${pm[$p,0]} Packages"

				${pm[$p,4]}

				sudo ${pm[$p,1]}${pm[$p,2]} ${dependencies[$p]} \
					$(print "${info}" \
					| awk -v FPAT="${pm[$p,3]}:[^\S]+" 'NF{ print $1 }' \
					| awk "{gsub(\"${pm[$p,3]}:\", \"\");print}")
			done
		fi
	}

		# YAY
		function ins-yay() {
			print 'Installing YAY'

			git clone https://aur.archlinux.org/yay.git "${HOME}/yay" \
				&& cd "${HOME}/yay" \
				&& makepkg -si
		}

		# Snap
		function ins-snap() {
			print 'Installing Snap'

			git clone https://aur.archlinux.org/snapd.git "${HOME}/snap" \
				&& cd "${HOME}/snap" \
				&& makepkg -si \
				&& sudo systemctl enable --now snapd.socket \
				&& sudo ln -s /var/lib/snapd/snap /snap
		}

	# Dotfiles
		# Download dotfiles
		function dl-dotfiles() {
			if [[ ${repo} = '+' ]]
				print 'Make dotfiles directory'

				mkdir -p ${dir_dotfiles}/Dotfiles/{install,home,root,other}

				exit
			elif [[ -z ${repo} ]]
				print 'Download dotfiles'

				git clone ${repo} "${dir_dotfiles}" && dotfiles='exist'
			fi
		}

		# Install dotfiles
		function ins-dotfiles() {
			print 'Installing dotfiles'

			cd "${dir_dotfiles}"

			for dir_stow in 'home' 'root'
			do
				[[ -d "${dir_dotfiles}/${dir_stow}" ]] \
					&& sudo stow -vt ~ ${dir_stow} \
					|| print "${dir_dotfiles}/${dir_stow} directory does not exist"
			done

			cd "${dir_now}"
		}

	# Before
	function exec-before() {
		print 'Executing before installation'

		[[ -f "${dir_dotfiles}/install/before" ]] \
			&& sudo "${dir_dotfiles}/install/before" \
			|| print "${dir_dotfiles}/install/before file does not exist"
	}

	# After
	function exec-after() {
		print 'Executing after installation'

		[[ -f "${dir_dotfiles}/install/after" ]] \
			&& sudo "${dir_dotfiles}/install/after" \
			|| print "${dir_dotfiles}/install/after file does not exist"
	}

	# Prompt
	function prompt() {
		print '\n' \
		      '██                    ██\n' \
		      '██                    ██\n' \
		      '██████  ▓▓▓▓⣷⣄  █████ ██████\n' \
		      '██  ██  ▓▓▓▓▓▓  ██▇▇▇ ██  ██\n' \
		      '██████  ▓▓  ▓▓  ▇▇▇██ ██  ██\n' \
		      '        ▓▓▓▓▓▓\n' \
		      '\n' \
		      'Dotfiles manager that superB\n'
		read -s -p ' Press [↵ Enter]'

		print '\n' \
		      'Enter your git repository address\n' \
		      '  __ ______                      \n' \
		      '  ╷  ╷                           \n' \
		      '  │  └ Username                  \n' \
		      '  │                              \n' \
		      '  └ gh = github                  \n' \
		      '    gl = gitlab                  \n' \
		      '    bb = bitbucket               \n' \
		      '    ct = custom                  \n' \
		      '\n' \
		      '(Leave all blank to use current working directory)\n' \
		      "(Enter '+' to make new dotfiles directory)        \n"
		read -p ' Datas address: ' -a options_repo
		case ${options_repo[1]} in
			'') repo="https://github.com/${options_repo[0]}/Dotfiles.git" ;;
			*)
				case ${options_repo[0]} in
					'gh') repo="https://github.com/${options_repo[1]}/Dotfiles.git"    ;;
					'gl') repo="https://gitlab.com/${options_repo[1]}/Dotfiles.git"    ;;
					'bb') repo="https://bitbucket.org/${options_repo[1]}/Dotfiles.git" ;;
					'ct') repo="${options_repo}"                                       ;;
					'+')  repo='+'                                                     ;;
					'')   repo=''                                                      ;;
				esac
			;;
		esac

		if [[ ! -z "${options_repo}" ]]; then
			print '\n' \
			      'Enter directory to store dotfiles           \n' \
			      "(Enter '.' to use current working directory)\n"
			read -p ' Location: ' options_dir
			case ${options_dir} in
				'')  dir_dotfiles="${$HOME}/Dotfiles"      ;;
				'.') dir_dotfiles="${dir_now}"             ;;
				*)   dir_dotfiles="${HOME}/${options_dir}" ;;
			esac
		else
			dir_dotfiles="${dir_now}"
		fi

		while [[ -z '' ]]
		do
			print '\n' \
			      'Enter the distribution \n' \
			      "  a = Archlinux's base \n" \
			      "  d = Debian's base \n" \
			      "  v = Voidlinux's base \n"
			read -N 1 -p ' Distro: ' options_pm
			case ${options_pm} in
				'a') pm+=( [0,0]='Archlinux' [0,1]='pacman' [0,2]=' -Sy --noconfirm --needed' [0,3]=' -Syu --noconfirm --needed' [0,4]='PAC' ) && break ;;
				'd') pm+=( [0,0]='Debian'    [0,1]='apt'    [0,2]=' install -y'               [0,3]=' install -y'                [0,4]='APT' ) && break ;;
				'v') pm+=( [0,0]='Voidlinux' [0,1]='xbps'   [0,2]='-install -Sy'              [0,3]='-install -Syu'              [0,4]='XBP' ) && break ;;
			esac
		done
	}


# Installation
for stage in 'prompt ins-dependencies dl-dotfiles ins-packages exec-before ins-dotfiles exec-after'
do
	${stage}
done


exit

#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
