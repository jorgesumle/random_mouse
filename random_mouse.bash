#!/bin/bash
# random_mouse es un programa para interfaz de línea de órdenes que mueve el ratón de forma aleatoria.
# Copyright (C) 2016 Jorge Maldonado Ventura

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

readonly POS_NUM_REGEX='^[0-9]+([.][0-9]+)?$'
if ! [[ $1 =~ $POS_NUM_REGEX ]]; then
	echo 'Debes especificar los segundos con un número.'
	exit 1
fi
xRes=$(xrandr | fgrep '*' | cut -d" " -f4 | cut -d"x" -f1)
yRes=$(xrandr | fgrep '*' | cut -d" " -f4 | cut -d"x" -f2)
while (($SECONDS <= $1)); do
	randomX=$(( ($RANDOM % $xRes) + 1))
	randomY=$(( ($RANDOM % $yRes) + 1))
	$(xte "mousemove $randomX $randomY")
done
