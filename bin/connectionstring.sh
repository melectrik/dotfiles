. ${0}.rc

function usage()
{
    printf "%-10s %s <tool> <env>\n" "USAGE:" ${0}
    printf "%-12s where tool could for example be ssh\n" "USAGE:"
    printf "%-12s and env is defined in rc file %s\n" "USAGE:" ${0}.rc
    printf "%-10s %s ssh env1\n" "EXAMPLE:" ${0}
}

if [ "$#" -lt 2 ]; then
    printf "%-10s Wrong parameters count\n" "ERROR:"
    usage
    exit
fi

function render_connection_string_ssh()
{
    for line in ${environments["${1}"]}
    do
	~/bin/connection_string.sh ssh ${line}
    done
}

FUNC=${1}
ENV=${2}

case "${FUNC}" in
    ssh)
	render_connection_string_ssh ${ENV}
	;;

    *)
    usage
    exit 1
esac

