#! /bin/bash
#
# @author: Gregor A. Segner
# @brief: central bootstrapping script for dotfiles
#
# This script uses the "Google Shell Style Guide"
# --> https://google.github.io/styleguide/shellguide.html

declare -a packages=()

#######################################
# This will install the ellipsis package manager and will also ask, if the 
# usser will install additional packages. If the user decide to install
# packages, the function will assemble the list of packages and will install
# them.
#
# For more information about ellipsis, please visit the project git-repo
# --> https://github.com/ellipsis/ellipsis
#
# GLOBALS
#   packages
#
# ARGUMENTS
#   None
#######################################
function installEllipsis() {
  curl ellipsis.sh | sh
  export PATH=~/.ellipsis/bin:$PATH

  # the following block will configure ellipsis packages by
  # modifying $packages
  echo "Do you want select ellipsis-packages?"
  select uchoice in "Yes" "No"; do
    case $uchoice in
      Yes ) 
        echo "Do you want install g4s/ellipsis-git package?"
        select uchoice in "Yes" "No"; do
          case $uchoice in
            Yes ) packages+=('g4s/ellipsis-git'); break;;
            No ) break;;
        break;;
      No ) break;;
    esac
  done

  # installing configured packages
  for pkg in "${packages[@]}"; do
    if [[ "${pkg}" == "*/*" ]]; then
      pkg=$(echo ${pkg} | cut -d "/" -f 2)
    fi
    ellipsis install "${pkg}"
  done
}


#######################################
# initiate dotfile deployment
#
# GLOBALS
#   None
#
# ARGUMENTS
#   None
#######################################
function dis() {
  echo "welcome to DIS - dotfile initiate system"
  echo ""
  echo "Do you want to install ellipsis dotfile manager?"
  select uchoice in "Yes" "No"; do
    case $uchoice in
      Yes ) installEllipsis; break;;
      No ) break;;
    esac
  done
}

### ENTRYPOINT
source ${0}         # this will source the current script and provide
                    # access to the defined functions.
