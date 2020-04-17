# Start configuration added by Zim install {{{
#
# User configuration sourced by all invocations of the shell
#

# Define Zim location
: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim}
# }}} End configuration added by Zim install


export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.scripts/i3:$PATH"
export PATH="$HOME/.scripts/system:$PATH"


export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# set default applications
export TERM="alacritty"
export TERMINAL="alacritty"
export BROWSER="firefox-developer-edition"
export READER="zathura"
export EDITOR="emacs"
export FILE="thunar"

# use intel-media-driver for video acceleration
export LIBVA_DRIVER_NAME="iHD"
# export VDPAU_DRIVER="nvidia"

# use rofi as clipmenu frontend
export CM_LAUNCHER=rofi

# Modify the pager defaults: The -R option is needed to interpret ANSI colors
# correctly. The second option (-F) instructs less to exit immediately if the
# output size is smaller than the vertical size of the terminal.
export PAGER="less -RF"

# use UTF-8 charset for less
export LESSCHARSET=utf-8

# colorize man pages using bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# use z.lua as the command for fz
export FZ_HISTORY_CD_CMD="_zlua"

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
