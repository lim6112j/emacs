#!/bin/bash
if [ -d "./.config/nvim.bak.normal" ]
then
  echo "changing to nvim normal"
  mv ~/.config/nvim ~/.config/nvim.bak.astro
  mv ~/.local/share/nvim ~/.local/share/nvim.bak.astro
  mv ~/.config/nvim.bak.normal ~/.config/nvim
  mv ~/.local/share/nvim.bak.normal ~/.local/share/nvim
elif [ -d "./.config/nvim.bak.astro" ]
then
  echo "changing to nvim astro"
  mv ~/.config/nvim ~/.config/nvim.bak.normal
  mv ~/.local/share/nvim ~/.local/share/nvim.bak.normal
  mv ~/.config/nvim.bak.astro ~/.config/nvim
  mv ~/.local/share/nvim.bak.astro ~/.local/share/nvim
else
  echo "no change ! some error"
fi
