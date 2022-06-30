#!/usr/bin/env bash
# -*- coding: utf-8 -*-

## ------------------------------------------------------------------------ ##
## .bashrc                                    Nicholas Berlette, 2022-06-30 ##
## ------------------------------------------------------------------------ ##
##         https://github.com/nberlette/dotfiles/blob/main/.bashrc          ##
## ------------------------------------------------------------------------ ##
##              MIT © Nicholas Berlette <nick@berlette.com>                 ##
## ------------------------------------------------------------------------ ##

shell="$(which bash)"
export SHELL="$shell"

# shellcheck source=/dev/null
. ~/.bashrc.d/core.sh || exit $?;

# shellcheck source=/dev/null
[ -r ~/.path ] && . ~/.path || exit $?;

src ~/.bashrc.d/gpg.sh

srx ~/.env ~/.extra

src ~/.exports ~/.functions ~/.bash_aliases

src ~/.rvm/scripts/rvm ~/.cargo/env ~/.nix-profile/etc/profile.d/nix.sh

src "$HOMEBREW_PREFIX/etc/bash_completion.d" 2>/dev/null

which lesspipe &>/dev/null && eval "$(SHELL="$shell" lesspipe)"

# dircolors: attractive color coded output for ls, grep, etc.
if which dircolors &>/dev/null; then
  [ -r ~/.dircolors ] &&
    eval "$(dircolors -b ~/.dircolors 2>/dev/null)" ||
      eval "$(dircolors -b)";
fi

# make sure our gitconfig is in order
if [ -z "$(git config --global user.name)" ]; then
  if [ -n "$GIT_COMMITTER_NAME" ] || [ -n "$GIT_AUTHOR_NAME" ]; then
    git config --global user.name "${GIT_COMMITTER_NAME:-"$GIT_AUTHOR_NAME"}"
  fi
fi
if [ -z "$(git config --global user.email)" ]; then
  if [ -n "$GIT_COMMITTER_EMAIL" ] || [ -n "$GIT_AUTHOR_EMAIL" ]; then
    git config --global user.email "${GIT_COMMITTER_EMAIL:-"$GIT_AUTHOR_EMAIL"}"
  fi
fi
if [ -z "$(git config --global user.signingkey)" ]; then
  git config --global user.signingkey "${GPG_KEY_ID:-"$GIT_COMMITTER_EMAIL"}"
fi

eval "$(starship init bash)"
