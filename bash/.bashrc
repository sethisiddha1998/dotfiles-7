# Dylan's .bashrc

# Set the prompt.
# $USER ~/path/to/dir >
export PS1="$USER \w \[$(tput setaf 5)\]>\[$(tput sgr0)\]"

# Set nvim as editor.
export EDITOR="nvim"

# Add ~/bin to path
PATH="$PATH:$HOME/bin"

# Set XDG_CONFIG_HOME
export XDG_CONFIG_HOME="$HOME/.config"


# ALIASES

alias steam="steam-native"
alias sxiv="sxiv -b -s f"
