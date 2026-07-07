# Powerlevel10k config — Classic Powerline style
# Generated for prateek

# Temporarily change options.
'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases' ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob' ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

() {
  emulate -L zsh -o extended_glob

  # Unset all configuration options
  unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'

  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    context                   # user@host
    dir                       # current directory
    vcs                       # git status
  )

  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    status                    # exit code
    command_execution_time    # duration
    time                      # current time
  )

  typeset -g POWERLEVEL9K_MODE=nerdfont-complete
  typeset -g POWERLEVEL9K_ICON_PADDING=none
  typeset -g POWERLEVEL9K_BACKGROUND=clear
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_{LEFT,RIGHT}_WHITESPACE=
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SUBSEGMENT_SEPARATOR=' '
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SEGMENT_SEPARATOR=

  # Context — user@host
  typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,ROOT}_{TEMPLATE,CONTENT}=$'%{\F09C%}' # 
  typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,ROOT}_BACKGROUND=036
  typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,ROOT}_FOREGROUND=231
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE='%n@%m'
  typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n@%m'
  typeset -g POWERLEVEL9K_CONTEXT_PREFIX=''

  # Directory
  typeset -g POWERLEVEL9K_DIR_BACKGROUND=239
  typeset -g POWERLEVEL9K_DIR_FOREGROUND=231
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
  typeset -g POWERLEVEL9K_SHORTEN_DELIMITER='…'
  typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=60
  typeset -g POWERLEVEL9K_DIR_ANCHORS=0

  # Git status
  typeset -g POWERLEVEL9K_VCS_BACKGROUND=242
  typeset -g POWERLEVEL9K_VCS_FOREGROUND=231
  typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND=242
  typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=231
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=214
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=0
  typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=196
  typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=231
  typeset -g POWERLEVEL9K_VCS_PREFIX='on '
  typeset -g POWERLEVEL9K_VCS_{GIT,HG,BRANCH}_ICON=

  # Status
  typeset -g POWERLEVEL9K_STATUS_OK=false
  typeset -g POWERLEVEL9K_STATUS_ERROR_BACKGROUND=196
  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=231
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL=true
  typeset -g POWERLEVEL9K_STATUS_SHOW_PIPESTATUS=true

  # Command execution time
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=2
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=238
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=231

  # Time
  typeset -g POWERLEVEL9K_TIME_BACKGROUND=236
  typeset -g POWERLEVEL9K_TIME_FOREGROUND=250
  typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M}'
  typeset -g POWERLEVEL9K_TIME_UPDATE_ON_COMMAND=true
}

# Restore options.
(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'
