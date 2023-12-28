if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi
autorandr -c


# Added by Toolbox App
export PATH="$PATH:/home/solo/.local/share/JetBrains/Toolbox/scripts"

