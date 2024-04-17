#! /bin/bash

# check the status of onepassword cli tool if present on system
function op_status {
  if [[ $(command -v op) ]]; then
    return 0
  else
    return 1
}

function tsh_status {
  if [[ $(command -v tsh) ]]; then
    return 0
  else
    return 1
  fi
}
