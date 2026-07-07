#!/bin/bash
set -e

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [[ ! -f "${ZINIT_HOME}/zinit.zsh" ]]; then
  command mkdir -p "$(dirname ${ZINIT_HOME})"
  command git clone https://github.com/zdharma-continuum/zinit "${ZINIT_HOME}"
  echo "Zinit installed"
else
  echo "Zinit already installed"
fi
