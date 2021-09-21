# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%(3~|.../%2~|%~)%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
setopt interactive_comments

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zsh_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

#------------------------------
# Variables
#------------------------------
export BROWSER="firefox"
export EDITOR="nvim"
export PDF="zathura"

LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
export LS_COLORS

#------------------------------
# Alias stuff
#------------------------------
alias ls='ls --color=auto'
alias v='nvim'
alias zt='tabbed -c zathura -e &'
alias work='cd ~/Documents/work/'
alias sicp='cd ~/Programming/SICP/SICP_with_racket/'
alias corp='cd ~/Dropbox/National_corpus/'
alias hexl='cd ~/Programming/Hexlet/'
alias morph='cd ~/Documents/turoyo/noun_dictionary/'

# git
alias gs='git status'
alias gsu='git status -uno'

# ps 1 + git
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '[%b]'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST

# Color
PROMPT='%{$fg[yellow]%}%n%{$fg[red]%}@%{$fg[magenta]%}%m%{$fg[green]%} %(3~|.../%2~|%~)% %{$fg[magenta]%}${vcs_info_msg_0_}%{$reset_color%}> '
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%(3~|.../%2~|%~)%{$fg[red]%}]%{$reset_color%}$%b "

#fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
