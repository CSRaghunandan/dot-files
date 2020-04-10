# Define zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# load the aliases file
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

export PATH="/home/csraghunandan/.pyenv/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.scripts/i3:$PATH"
export PATH="$HOME/.scripts/system:$PATH"


export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# opam configuration
# test -r /home/csraghunandan/.opam/opam-init/init.sh && . /home/csraghunandan/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# use alacritty as the default terminal
export TERM="alacritty"
export TERMINAL="alacritty"
export BROWSER="firefox-developer-edition"
export READER="zathura"
export EDITOR="emacs"

export XDG_CONFIG_HOME="/home/csraghunandan"
# use eless as a pager for linux
# export PAGER="eless"

# initialize fasd
eval "$(fasd --init auto)"

# initialize antibody
source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

function vterm_printf(){
    if [ -n "$TMUX" ]; then
        # tell tmux to pass the escape sequences through
        # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}

if [ -n "$INSIDE_EMACS" ]; then
    # set emacs TERM variable to eterm-color so that colors are rendered correctly
    TERM="eterm-color"

    vterm_prompt_end() {
        vterm_printf "51;A$(whoami)@$(hostname):$(pwd)";
    }
    PROMPT=$PROMPT'%{$(vterm_prompt_end)%}'
fi

if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
    alias clear='vterm_printf "51;Evterm-clear-scrollback";tput clear'
fi


# Change umask to make directory sharing easier
umask 0002

# use intel-media-driver for video acceleration
export LIBVA_DRIVER_NAME="iHD"
# export VDPAU_DRIVER="nvidia"


fortune ; echo

source /home/csraghunandan/broot/launcher/bash/br
