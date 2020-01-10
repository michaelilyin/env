#!/usr/bin/env bash

source /etc/profile.d/apps-bin-path.sh && \
  rofi -matching fuzzy -modi drun -show drun \
      -location 1 -width 100 -lines 16 -line-margin 2 -line-padding 2 \
      -separator-style solid -columns 1 -bw 0 \
      -kb-row-select 'Tab' -kb-row-tab '' \
      -color-window '#1C1C1C, #1C1C1C, #1C1C1C' \
      -color-normal '#1C1C1C, #DCDCDC, #1C1C1C, #607D8B, #1C1C1C' \
      -color-active '#1C1C1C, #607D8B, #1C1C1C, #607D8B, #1C1C1C' \
      -color-urgent '#FFC107, #212121, #FFC107, #212121, #FFC107'
