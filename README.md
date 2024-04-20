# dotfile repo with a twist

This repo is my personal attempt to get a highly flexible framework to assemble my so called dotfiles. The primary
intention was to provide a simple way to deploy this configs to new machines and/or to workingspaces like 
gitpod/coder.com/github codespaces

## How it works
simply by combining various things:
  * [ellipsis](https://github.com/ellipsis/ellipsis) for modularize the dotfiles
  * [envsubst](https://linux.die.net/man/1/envsubst) for templating config files and scripts
  * a collection of scripts and templates

If you want to deploy this framework to your workspace, it is necessary to fetch this repository into your workspace,
source the bootstrap.sh script and calling the dis() function. Afterwards it will configure your system.
