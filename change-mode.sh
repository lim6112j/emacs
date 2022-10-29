#!/bin/bash
if [ -d "./.emacs.d.pure" ]
then
echo "changing to pure emacs"
mv ~/.emacs.d ~/.emacs.d.doom
mv ~/.emacs.d.pure ~/.emacs.d
mv ~/.emacs.bak ~/.emacs
else
echo "changing to doom emacs"
mv ~/.emacs.d ~/.emacs.d.pure
mv ~/.emacs.d.doom ~/.emacs.d
mv ~/.emacs ~/.emacs.bak
fi
