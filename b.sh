#!/bin/sh

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
packages=$(awk '{gsub("#.*$", "");print}' "${SUPERBOOTSTRAP_DIR-$PWD}/bootstrap/packages")
packages_aur=$(echo $info | awk "!/${pm[0,4]}:/")
packages_flatpak=$(echo $info_aur | awk "!/FLA:/")
packages_snap=$(echo $info_flatpak | awk "!/SNA:/")

[[   $options_pm == 'a' ]] && [[ $info_aur     == *AUR:* ]] && pm_list+='AUR '
                              [[ $info_flatpak == *FLA:* ]] && pm_list+='Flatpak '
[[ ! $options_pm == 'v' ]] && [[ $info_snap    == *SNA:* ]] && pm_list+='Snapcraft '


# Functions
for pm in $OS $pm_list; do
	case $pm in
		'Arch-linux') ; pm_launcher='sudo pacman -Sy --noconfirm --needed' ; pm_mark='PAC' ; pm_packages=$packages     ;;
		'Debian')     ; pm_launcher='sudo apt install -y'                  ; pm_mark='APT' ; pm_packages=$packages     ;;
		'Void-linux') ; pm_launcher='sudo xbps-install -Sy'                ; pm_mark='XBP' ; pm_packages=$packages     ;;
		'AUR')        ; pm_launcher='yay -S --nodiffmenu --save'           ; pm_mark='AUR' ; pm_packages=$info_aur     ;;
		'Flatpak')    ; pm_launcher='sudo flatpak install'                 ; pm_mark='FLA' ; pm_packages=$info_flatpak ;;
		'Snapcraft')  ; pm_launcher='sudo snap install'                    ; pm_mark='SNA' ; pm_packages=$info_snap    ;;
	esac

	echo "Installing $pm_name Packages"

	$pm_launcher $(echo $pm_packages \
		| awk -v FPAT="$pm_mark:[^\S]+" 'NF{ print $1 }' \
		| awk "{gsub(\"$pm_mark:\", \"\");print}")
done


exit


# Yes, this file has exactly 64 lines.
