#!/bin/bash
if [ -d "./.config/vanilaemacs" ]
then
echo "changing to pure emacs"
mv ~/.config/emacs ~/.config/doomemacs
mv ~/.config/vanilaemacs ~/.config/emacs
else
echo "changing to doom emacs"
mv ~/.config/emacs ~/.config/vanilaemacs
mv ~/.config/doomemacs ~/.config/emacs
fi
