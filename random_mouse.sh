#!/bin/bash
if test -z $1; then
	echo 'Error, no has introducido los segundos.'
	exit
fi
xRes=$(xrandr | fgrep '*' | cut -d" " -f4 | cut -d"x" -f1)
yRes=$(xrandr | fgrep '*' | cut -d" " -f4 | cut -d"x" -f2)
while (($SECONDS <= $1)); do
	randomX=$(( ($RANDOM % $xRes) + 1))
	randomY=$(( ($RANDOM % $yRes) + 1))
	$(xte "mousemove $randomX $randomY")
done
