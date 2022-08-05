#!/usr/bin/env bash

set -e

base_dir=$(dirname "$(realpath "$0")")

source "$base_dir"/functions.sh

if [[ -f "$base_dir"/config ]]; then
    source "$base_dir"/config
fi

cd "$base_dir"/modules

for module in *; do
    module_install_toggle=dotfiles_install_${module}

    if [ "${!module_install_toggle}" = "" ]; then
        read -r -p "install module '$module'? [y/N] "
        install_module="$REPLY"
    else
        install_module=${!module_install_toggle}
    fi

    if [ "$install_module" = "y" ] || [ "$install_module" = "Y" ] || [ "$install_module" = "1" ]; then
        cd "$module"
        [[ -f "./install" ]] && source ./install
        cd ..
    fi
done
