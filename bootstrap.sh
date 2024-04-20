#! /bin/bash
#
# central bash bootstrapping script

declare -a packages=()

function initateSystem() {
  # ensure ellipsis and ellipsis-packages are present on system
  # ellipsis is a small, but powerfull dotfile manager
  # https://github.com/ellipsis/ellipsis
  if [[ ! $(command -v ellipsis) ]]; then
    curl ellipsis.sh | sh
    export PATH=~/.ellipsis/bin:$PATH
  else
    if [[ ! $(ls -A ./ellipsis/packages) ]]; then
      for pkg in "${packages[@]}"; do
        if [[ ${pkg} == "*/*" ]]; then
          pkg = $( echo ${pkg} | cut -d "/" -f 2)
        fi
        if [[ ! -d "./ellipsis/packages/${pkg}" ]]; then
          echo "installing ellipsis package ${pkg}"
          ellipsis install ${pkg}
        fi
      done
    fi
  fi
}

source ./commands.sh
