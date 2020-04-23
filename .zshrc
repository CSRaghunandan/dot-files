# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
setopt CORRECT

# Customize spelling correction prompt.
SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]/}

# --------------------
# Module configuration
# --------------------

#
# completion
#

# Set a custom path for the completion dump file.
# If none is provided, the default ${ZDOTDIR:-${HOME}}/.zcompdump is used.
#zstyle ':zim:completion' dumpfile "${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[comment]='fg=10'

# ------------------
# Initialize modules
# ------------------

if [[ ${ZIM_HOME}/init.zsh -ot ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
	# Update static initialization script if it's outdated, before sourcing it
	source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
	bindkey ${terminfo[kcuu1]} history-substring-search-up
	bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# }}} End configuration added by Zim install

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# load the aliases file
if [ -f ~/.aliases ]; then
	. ~/.aliases
fi

export PATH="/home/csraghunandan/.pyenv/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

# opam configuration
# test -r /home/csraghunandan/.opam/opam-init/init.sh && . /home/csraghunandan/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

function vterm_printf() {
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
	vterm_prompt_end() {
		vterm_printf "51;A$(whoami)@$(hostname):$(pwd)"
	}
	PROMPT=$PROMPT'%{$(vterm_prompt_end)%}'
fi

if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
	alias clear='vterm_printf "51;Evterm-clear-scrollback";tput clear'
fi

# Change umask to make directory sharing easier
umask 0002

# hook for direnv
eval "$(direnv hook zsh)"

# load the script for broot to work
source /home/csraghunandan/.config/broot/launcher/bash/br

# zsh-bd
. $HOME/.zsh/plugins/bd/bd.zsh

# (Rich Enchanced Shell History)
# to setup resh, run: curl -fsSL https://raw.githubusercontent.com/curusarn/resh/master/scripts/rawinstall.sh | bash
# enable binding for C-r by running the below lines:
# reshctl enable ctrl_r_binding_global
# reshctl disable ctrl_r_binding_global
[ -f ~/.resh/shellrc ] && source ~/.resh/shellrc # this line was added by RESH

# completions for reshctl
. <(reshctl completion zsh) && compdef _reshctl reshctl

# initiate z.lua
eval "$(lua /usr/share/z.lua/z.lua --init zsh enhanced once fzf)"
# integrate z.lua with the native module for faster performance
source ~/src/clang/czmod/czmod.zsh

# fix some docsets not rendering on Zeal. Run this command whenever you run into
# an issue with zeal docsets
zeal-docs-fix() {
	pushd "$HOME/.local/share/Zeal/Zeal/docsets" >/dev/null || return
	find . -iname 'react-main*.js' -exec rm '{}' \;
	popd >/dev/null || exit
}

# integration with zsh for navi
# press C-g to open Navi
source <(navi widget zsh)

# Search and install packages with yay and fzf
yi() {
	SELECTED_PKGS="$(yay -Slq | fzf --header='Install packages' -m --height 100% --preview 'yay -Si {1}')"
	if [ -n "$SELECTED_PKGS" ]; then
		yay -S $(echo $SELECTED_PKGS)
	fi
}

# Search and remove packages with yay and fzf
yr() {
	SELECTED_PKGS="$(yay -Qsq | fzf --header='Remove packages' -m --height 100% --preview 'yay -Si {1}')"
	if [ -n "$SELECTED_PKGS" ]; then
		yay -Rns $(echo $SELECTED_PKGS)
	fi
}

# auto-completion for s
if [ -f /usr/share/bash-completion/completions/s ]; then
	. /usr/share/bash-completion/completions/s
fi

# start the shell with a new fortune cookie :)
fortune
echo
