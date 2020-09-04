#!/bin/sh

#    ___  ___           __
#   / _ )/ _ \___ _____/ /_____ ____ ____ ___
#  / _  / ___/ _ `/ __/  '_/ _ `/ _ `/ -_|_-<
# /____/_/   \_,_/\__/_/\_\\_,_/\_, /\__/___/
#                              /___/

# File:         bpackage.sh
# Description:  Packages bootstrap that superB
# Author:       NNB
#               └─ https://github.com/NNBnh
# URL:          https://github.com/NNBnh/bpackages
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
SUPERBOOTSTRAP_OS=Void-linux

# Functions
for pm in $SUPERBOOTSTRAP_OS AUR Flatpak Snapcraft; do
	[ -z $packages ] && packages=$(awk '{gsub("#.*$", "");print}' "${SUPERBOOTSTRAP_DIR-$PWD}/bootstrap/packages")
	packages=$(echo $packages | awk "!/$pm_mark:/")

	case $pm in
		'Arch-linux') pm_launcher='sudo pacman -Sy --noconfirm --needed' ; pm_mark='PAC' ;;
		'Debian')     pm_launcher='sudo apt install -y'                  ; pm_mark='APT' ;;
		'Void-linux') pm_launcher='sudo xbps-install -Sy'                ; pm_mark='XBP' ;;
		'AUR')        pm_launcher='yay -S --nodiffmenu --save'           ; pm_mark='AUR' ;;
		'Flatpak')    pm_launcher='sudo flatpak install'                 ; pm_mark='FLA' ;;
		'Snapcraft')  pm_launcher='sudo snap install'                    ; pm_mark='SNA' ;;
		*)            echo "Error, $SUPERBOOTSTRAP_OS OS not found"      ; exit          ;;
	esac
	
	packages_raw=$(echo $packages | awk -v FPAT="$pm_mark:[^ ]+" 'NF{ print $1 }' | awk "{gsub(\"$pm_mark:\", \"\");print}")

	if [ -z $packages_raw ]; then
		echo "Installing $pm Packages"

		$pm_launcher $packages_raw
	fi
done


exit
