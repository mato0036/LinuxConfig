# Path to your oh-my-zsh installation.
export ZSH="/home/mjancek/.oh-my-zsh"

ZSH_THEME="spaceship"

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_COLOR_SUCCESS="cyan"
SPACESHIP_EXIT_CODE_SHOW=true

SPACESHIP_PROMPT_ORDER=(
#    time        # Time stamps section 
    user          # Username section
    dir           # Current directory section
    host          # Hostname section
    git           # Git section (git_branch + git_status)
#    hg            # Mercurial section (hg_branch  + hg_status)
    package     # Package version 
#    node          # Node.js section
#    ruby          # Ruby section
#    elixir        # Elixir section
#    xcode       # Xcode section 
#    swift         # Swift section
#    golang        # Go section
#    php           # PHP section
#    rust          # Rust section
#    haskell       # Haskell Stack section
    # julia       # Julia section 
     docker      # Docker section 
#    aws           # Amazon Web Services section
    venv          # virtualenv section
    conda         # conda virtualenv section
    pyenv         # Pyenv section
#    dotnet        # .NET section
#    ember       # Ember.js section 
#    kubecontext   # Kubectl context section
#    terraform     # Terraform workspace section
    exec_time     # Execution time
    line_sep      # Line break
    battery       # Battery level and status
#    vi_mode     # Vi-mode indicator 
    jobs          # Background jobs indicator
    exit_code     # Exit code section
    char          # Prompt character
)

setopt SHARE_HISTORY

# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git colorize command-not-found zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export EDITOR=vim

alias vimhelp="vim ~/Documents/vim_commands.md"
alias dots='/usr/bin/git --git-dir=$HOME/.dotFiles/ --work-tree=$HOME'
