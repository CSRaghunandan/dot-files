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
export PATH="$HOME/.cabal/bin:$PATH"
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
export FILE="nautilus"

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

## FZF environment variables
# Nord theme for fzf
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#e5e9f0,hl:#81a1c1
    --color=fg+:#e5e9f0,hl+:#81a1c1,bg+:#434C5E
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--select-1 --exit-0"

# set paths for go
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

# path for ripgrep config
export RIPGREP_CONFIG_PATH=$HOME/.config/ripgrep/config

# path for bat config file
export BAT_CONFIG_PATH=$HOME/.config/bat/config

# set the qt theme config
# export QT_QPA_PLATFORMTHEME=gtk2
export QT_STYLE_OVERRIDE=kvantum

# Sets the terminfo variables of the termcap compatibility application interface.
# Provides colored output for the "man" command.
#
# Escape Sequences Comparision Table
# ==================================
# termcap  terminfo  function
# -------  --------  --------
# ks       smkx      Send commands via keypad
# ke       rmkx      Send digits via keypad
# vb       flash     Emit visual bell
# mb       blink     Start blink
# md       bold      Start bold
# me       sgr0      Turn off bold, blink and underline
# so       smso      Start standout (reverse video)
# se       rmso      Stop standout
# us       smul      Start underline
# ue       rmul      Stop underline
# +--- Blink ---+
export LESS_TERMCAP_mb=$'\e[01;34m'

# +--- Keywords ---+
export LESS_TERMCAP_md=$'\e[01;34m'

# +--- Mode Stop ---+
export LESS_TERMCAP_me=$'\e[0m'

# +--- Standout-Mode (Info Box) ---+
export LESS_TERMCAP_so=$'\e[01;30m'
export LESS_TERMCAP_se=$'\e[0m'

# +--- Constants ---+
export LESS_TERMCAP_us=$'\e[01;34m'
export LESS_TERMCAP_ue=$'\e[0m'
export MANPAGER='less -s -M +Gg'

# colored sudo prompt
export SUDO_PROMPT=$(printf "\e[34msudo\e[0m \e[36m%%u\e[0m@\e[34m%%h\e[m: ")

# +--------+
# + Colors +
# +--------+
# Set the terminfo capabilitiy substrings for the color environment variable interpreted by the "termcap" compatibility
# application interface.
#
#   "sl"
#     Whole selected lines. Default is empty.
#   "cx"
#     Whole context lines. Default is empty.
#   "rv"
#     Boolean value that reverses (swaps) the meanings of the "sl" and "cx" capabilities. Default is "false".
#   "mt"
#     Matching non-empty text in any matching line.
#   "ms"
#     Matching non-empty text in a selected line.
#   "mc"
#     Matching non-empty text in a context line.
#   "fn"
#     File names prefixing any content line.
#   "ln"
#     Line numbers prefixing any content line.
#   "bn"
#     Byte offsets prefixing any content line.
#   "se"
#     Separators that are inserted between
#       - selected line fields (':')
#       - context line fields ('-')
#       - groups of adjacent lines when nonzero context is specified ("--")
#   "ne"
#     Boolean value that prevents clearing to the end of line using erase in line (EL) to Right ("\33[K") each time a
#     colorized item ends.
export GREP_COLORS="fn=34:mt=01;34:ln=01;30:se=30"
