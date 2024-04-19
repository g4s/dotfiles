#! /bin/bash
#
# central bash bootstrapping script

# ensure ellipsis and ellipsis-packages are present on system
# ellipsis is a small, but powerfull dotfile manager
# https://github.com/ellipsis/ellipsis
declare -a packages=()
if [[ ! $(command -v ellipsis) ]]; then
  curl ellipsis.sh | sh
else
  for pkg in "${packages[@]}"; do
    ellipsis install ${pkg}
  done
fi

source ./commands.sh
