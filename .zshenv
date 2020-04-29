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

# locale configuration
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# set default applications
export TERM="alacritty"
export TERMINAL="alacritty"
export BROWSER="firefox-developer-edition"
export READER="zathura"
export EDITOR="emacsclient -n -a \"\""
export VISUAL="emacsclient -n -a \"\""
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

# use z.lua as the command for fz
export FZ_HISTORY_CD_CMD="_zlua"

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# colored man pages using bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT='-c'

# FZF environment variables
# Options to fzf command
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--cycle
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'
# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
