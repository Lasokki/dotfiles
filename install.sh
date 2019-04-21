#!/usr/bin/env bash

# Emacs symlinks
ln -s emacs/init.el $HOME/.emacs.d/init.el
ln -s emacs/emacs-init.org $HOME/.emacs.d/emacs-init.org

# Xmonad and Xmobar symlinks
ln -s xmonad/xmonad.hs $HOME/.xmonad/xmonad.hs
ln -s xmonad/xmobarrc  $HOME/.xmobarrc
