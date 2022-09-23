#!/bin/bash

# ╔════════════════════════════════════════════════════════════════════════════════╗
# ║ Version:                                                                   0.1 ║
# ║ Date of Version:                                                    12.09.2022 ║
# ║ Owner:                                                         First Last Name ║
# ║ Classification:                                                       Internal ║
# ║ Distribution:                                                        All Staff ║
# ╚════════════════════════════════════════════════════════════════════════════════╝

# ╔════════════════════════════════════════════════════════════════════════════════╗
# ║ Description:                                                 This script <...> ║
# ╚════════════════════════════════════════════════════════════════════════════════╝

set -eu -o pipefail
# set -o errexit   # abort on nonzero exitstatus
# set -o nounset   # abort on unbound variable
# set -o pipefail  # don't hide errors within pipes

script_path=$(realpath "${BASH_SOURCE[0]}")
script_path="${script_path%/*}"
cd "${script_path}"

# source "${0}.env"

{
    function usage() {
        printf "Usage:\n"
        printf "\t%s <subcommand>\n\n" ${0}
        printf "Subcommands:\n"
        printf "\t%10s\t\t%s\n" "--fn1" "Does awesome magic!"
    }

    function fn1() {
        echo "TBI"
    }

    function main() {
        case ${1-usage} in
        --fn1)
            fn1
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
