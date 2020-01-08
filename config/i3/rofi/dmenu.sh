#!/usr/bin/env bash

source /etc/profile.d/apps-bin-path.sh && \
  rofi -matching fuzzy -modi drun -show drun \
      -location 1 -width 100 -lines 16 -line-margin 2 -line-padding 2 \
      -separator-style solid -columns 1 -bw 0 \
      -kb-row-select 'Tab' -kb-row-tab '' \
      -color-window '#1C1C1C, #1C1C1C, #1C1C1C' \
      -color-normal '#1C1C1C, #B3B3B3, #1C1C1C, #89A0A3, #1C1C1C' \
      -color-active '#1C1C1C, #89A0A3, #1C1C1C, #89A0A3, #1C1C1C' \
      -color-urgent '#FBA922, #2E4447, #FBA922, #2E4447, #FBA922'
