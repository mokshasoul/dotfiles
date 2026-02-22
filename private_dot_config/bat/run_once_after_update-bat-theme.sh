#!/usr/bin/env bash
curl -Lo "$(bat --config-dir)/themes/Catppuccin Latte.tmTheme" \
  https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Latte.tmTheme
bat cache --build
