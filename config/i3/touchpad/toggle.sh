#!/bin/bash

ID=$(xinput | grep -i touchpad | cut -f 2 | cut -d = -f 2)

if xinput list-props "$ID" | grep "Device Enabled (.*):.*1" >/dev/null
then
  xinput disable "$ID"
  notify-send -u low -i mouse "Trackpad disabled"
else
  xinput enable "$ID"
  notify-send -u low -i mouse "Trackpad enabled"
fi