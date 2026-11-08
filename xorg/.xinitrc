#!/bin/sh
export XDG_CURRENT_DESKTOP=dwm
export XDG_SESSION_TYPE=x11
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
systemctl --user import-environment DISPLAY XAUTHORITY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE \
  XMODIFIERS GTK_IM_MODULE QT_IM_MODULE SDL_IM_MODULE
xrdb -merge ~/.Xresources
exec dwm
