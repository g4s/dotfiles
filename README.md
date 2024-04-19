# dotfile repo with a twist

This repo is my personal attempt to get a highly flexible framework to assemble my so called dotfiles. The primary
intention was to provide a simple way to deploy this configs to new machines and/or to workingspaces like 
gitpod/coder.com/github codespaces

## How it works
simply by combining various things:
  * [ellipsis](https://github.com/ellipsis/ellipsis) for modularize the dotfiles
  * envsubset for templating config files and scripts
  * a collection of scripts and templates

If you want to deploy this framework to your worksace, it is necessary to fetch this repository into your workspace,
source the bootstrap.sh script and calling the initiateSyste() function. Afterwards it will configure your system.
