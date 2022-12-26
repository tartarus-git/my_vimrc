This repo contains my .vimrc file as well as a symlink to that .vimrc file, which is labeled as custom_vim_environment.vim. The symlink is so that one can
source it from one's existing .vimrc file and get updates without having to cp the .vimrc everytime.

The code should not only be sourcable from one's .vimrc, but also sourcable from anywhere at anytime any number of times.
The script sources defaults.vim at the top, which AFAIK has no problem with being sourced over and over, that might be a little tiny bit slow though.
