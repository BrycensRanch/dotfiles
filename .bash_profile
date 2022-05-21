#!/usr/bin/env bash
# -*- coding: utf-8 -*-

## ------------------------------------------------------------------------ ##
## .bash_profile                                                 2022-05-21 ##
## ------------------------------------------------------------------------ ##
##      https://github.com/nberlette/dotfiles/blob/main/.bash_profile       ##
## ------------------------------------------------------------------------ ##
##              MIT © Nicholas Berlette <nick@berlette.com>                 ##
## ------------------------------------------------------------------------ ##

if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
  [ -z "${DOTFILES_INITIALIZED:+x}"] && . "$HOME/.bashrc"
fi
