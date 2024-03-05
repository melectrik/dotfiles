#!/bin/bash

# ╔════════════════════════════════════════════════════════════════════════════════╗
# ║ Version:                                                                   0.1 ║
# ║ Date of Version:                                                    05.03.2024 ║
# ║ Owner:                                                                      SD ║
# ║ Classification:                                                       Internal ║
# ║ Distribution:                                                        All Staff ║
# ╚════════════════════════════════════════════════════════════════════════════════╝

set -eu -o pipefail
set -o posix
# set -o errexit   # abort on nonzero exitstatus
# set -o nounset   # abort on unbound variable
# set -o pipefail  # don't hide errors within pipes

script_path=$(realpath "${BASH_SOURCE[0]}")
script_path="${script_path%/*}"
cd "${script_path}"

# source "${0}.env"

{
    function usage(){
        printf "Usage:\n"
        printf "\t%s <subcommand>\n\n" ${0}
        printf "Subcommands:\n"
        printf "\t%10s\t\t%s\n" "--install" "Does the job"
    }

    function install_k9s(){
	local URI="https://github.com/derailed/k9s/releases/download/v0.32.1/k9s_linux_amd64.deb"
    	ofile="k9s_linux_amd64.deb"
	wget ${URI} --output-file=${ofile}
	echo dpkg -i ${ofile}
    }

    # SRC: https://github.com/cli/cli/blob/trunk/docs/install_linux.md
    function install_gh_cli(){
	curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
	echo sudo apt-get update
	echo sudo apt-get install gh
    }

    function main(){
        case ${1-usage} in
            --install)
		false
		# install_k9s
		# install_gh_cli
		;;
            *)
		usage
		;;
        esac
    }
}

{
    main "${@}"
    exit 0
}
