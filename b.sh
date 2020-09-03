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
pm=( [0,0]='Archlinux' [0,1]='sudo pacman' [0,2]=' -Sy --noconfirm --needed' [0,3]='PAC'
pm=( [0,0]='Debian'    [0,1]='sudo apt'    [0,2]=' install -y'               [0,3]='APT'
pm=( [0,0]='Voidlinux' [0,1]='sudo xbps'   [0,2]='-install -Sy'              [0,3]='XBP'
pm=( [1,0]='AUR'       [1,1]='yay'          [1,2]=' -S --nodiffmenu --save'  [1,3]='AUR'
pm=( [2,0]='Flatpak'   [2,1]='sudo flatpak' [2,2]=' install'                 [2,3]='FLA'
pm=( [3,0]='Snapcraft' [3,1]='sudo snap'    [3,2]=' install'                 [3,3]='SNA'

# Functions
info=$(awk '{gsub("#.*$", "");print}' "$dir_dotfiles/install/packages")
info_aur=$(echo $info | awk "!/${pm[0,4]}:/")
info_flatpak=$(echo $info_aur | awk "!/FLA:/")
info_snap=$(echo $info_flatpak | awk "!/SNA:/")

[[ $options_pm == 'a' ]] && [[ $info_aur     == *AUR:* ]] && pm_add+="1 "
                            [[ $info_flatpak == *FLA:* ]] && pm_add+="2 "
[[ $options_pm == 'a' ]] && [[ $info_snap    == *SNA:* ]] && pm_add+="3 "
[[ $options_pm == 'd' ]] && [[ $info_snap    == *SNA:* ]] && pm_add+="3 "

for p in 0 $pm_add; do
	echo "Installing ${pm[$p,0]} Packages"

	${pm[$p,1]}${pm[$p,2]} \
		$(echo info \
		| awk -v FPAT="${pm[$p,3]}:[^\S]+" 'NF{ print $1 }' \
		| awk "{gsub(\"${pm[$p,3]}:\", \"\");print}")
done


exit



# Yes, this file has exactly 64 lines.
