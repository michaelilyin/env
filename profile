# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

LOC_HOME="HOME";
LOC_WORK="WORK";

if [ -n "`hostname -A | grep -i relex || ""`" ]; then
  LOCATION="$LOC_WORK";
else
  LOCATION="$LOC_HOME";
fi

CONNECTED_VGA=$(xrandr | grep " connected" | grep "VGA" | awk '{print$1}');
CONNECTED_HDMI=$(xrandr | grep " connected" | grep "HDMI" | awk '{print$1}');
CONNECTED_LVDS=$(xrandr | grep " connected" | grep "LVDS" | awk '{print$1}');

unset PRIMARY_SCREEN
unset SECONDARY_SCREEN

case "$LOCATION" in
  "$LOC_WORK")
    PRIMARY_SCREEN="$CONNECTED_VGA";
    if [ -n "$CONNECTED_HDMI" ]; then
      SECONDARY_SCREEN="$CONNECTED_HDMI";
    fi
  ;;
  "$LOC_HOME")
    if [ -n "$CONNECTED_HDMI" ]; then
      PRIMARY_SCREEN="$CONNECTED_HDMI";
    else
      PRIMARY_SCREEN="$CONNECTED_LVDS";
    fi
  ;;
esac

unset LOC_HOME
unset LOC_WORK
unset LOCATION
unset CONNECTED_LVDS
unset CONNECTED_HDMI
unset CONNECTED_VGA