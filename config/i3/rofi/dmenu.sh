#!/usr/bin/env bash

source /etc/profile.d/apps-bin-path.sh &&
  rofi -matching fuzzy -modi drun -show drun -location 1 -width 100 -lines 16 -line-margin 2 -line-padding 2 -separator-style solid -columns 1 -bw 0 -kb-row-select 'Tab' -kb-row-tab '' -color-window '#000000, #000000, #000000' -color-normal '#000000, #b3e774, #000000, #b3e774, #000000' -color-active '#000000, #b3e774, #000000, #b3e774, #000000' -color-urgent '#000000, #b3e774, #000000, #b3e774, #000000'
