### Zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -f "${ZINIT_HOME}/zinit.zsh" ]]; then
  command mkdir -p "$(dirname ${ZINIT_HOME})"
  command git clone https://github.com/zdharma-continuum/zinit "${ZINIT_HOME}" 2>/dev/null
fi
source "${ZINIT_HOME}/zinit.zsh"

### Plugins
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit ice wait'0' lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

### History
HISTSIZE=500000
SAVEHIST=500000
HISTFILE="$HOME/.zsh_history"
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_REDUCE_BLANKS

### zoxide — smarter cd
eval "$(zoxide init zsh)"

### fzf
source <(fzf --zsh) 2>/dev/null
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

### Keep Emacs $PATH aligned
[[ "$EMACS" != "t" ]] && export PATH="$HOME/.local/bin:$PATH"

### starship prompt
eval "$(starship init zsh)"

### Aliases
alias ls='eza --icons=auto' 2>/dev/null || alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -A'
alias lt='ls --tree'
alias cat='bat --paging=never' 2>/dev/null
alias grep='rg' 2>/dev/null
alias vim='emacs' 2>/dev/null
alias pac='sudo pacman'
alias pacs='pacman -Ss'
alias pacu='sudo pacman -Syu'
alias ff='fastfetch'
alias cm='/usr/sbin/cmatrix -a -C green'
alias cmt='/usr/sbin/cmatrix -a -C cyan'
alias yay='yay --sudoloop'
alias tre='tre -s'
alias help='tldr'
alias rainbow='lolcat'

### Autopair
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

### vi mode
bindkey -v

### Node/NPM
export NVM_DIR="$HOME/.nvm"

### Cheatsheet (type `cheat` to show)
cheatsheet() {
  cat <<'SHEET'
╭──────────────────────────────────────────────────────────────╮
│  TOOL          WHAT IT DOES                  EXAMPLE         │
├──────────────────────────────────────────────────────────────┤
│  ls            colored ls with icons         ls -la          │
│  lt            directory tree                lt              │
│  tre           git-aware directory tree      tre             │
│  cat           syntax-highlighted cat        cat file.py     │
│  rg            grep files fast               rg "TODO"       │
│  tldr          simplified man pages          tldr tar        │
│  navi          interactive cheatsheets       navi            │
│  rainbow       rainbows on anything          echo hi|rainbow │
│  Ctrl+R        fuzzy search history          press, type     │
│  Ctrl+T        fuzzy find file path          press, pick     │
│  z <dir>       jump to learned dir           z pro-vox       │
│  ff            system info (fastfetch)       ff              │
│  ll            detailed file listing         ll              │
│  sl            steam locomotive              sl              │
│  pipes.sh      color pipe screensaver        pipes.sh        │
│  boxes         draw ASCII boxes              echo hi|boxes   │
│  nyancat       rainbow cat                   nyancat         │
│  cmatrix       Matrix rain                   cmatrix         │
│  asciiquarium  ASCII fish tank               asciiquarium    │
│  lolcat        rainbow text                  echo hi|lolcat  │
╰──────────────────────────────────────────────────────────────╯
SHEET
}
alias cheat='cheatsheet'

export PATH="$HOME/.config/emacs/bin:$PATH"
# GGUF LLM shortcut
alias llm="~/llm.sh"

