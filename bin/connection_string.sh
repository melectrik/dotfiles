source ~/bin/.connect.rc

CREDENTIALS=~/.authinfo

function help()
{
    echo "USAGE:"
    echo "${0} <ssh|mytop> ID"
    echo "EXAMPLE:"
    echo "${0} ssh 1"
    echo "${0} mytop 2"
}

if [ "$#" -ne 2 ]; then
    echo "Wrong parameters count"
    help
    exit
fi

function mytop()
{
    machine=$(get_credentials_machine ${CREDENTIALS} ${1})
    login=$(get_credentials_login ${CREDENTIALS} ${1})
    password=$(get_credentials_password ${CREDENTIALS} ${1})
    port=$(get_credentials_port ${CREDENTIALS} ${1})
    
    echo mytop -h ${machine} --port ${port} -u ${login} --prompt -p
}

function ssh()
{
    machine=$(get_credentials_machine ${CREDENTIALS} ${1})
    port=$(get_credentials_port ${CREDENTIALS} ${1})

    echo ssh ${machine} -p ${port}
}

MODE=${1}

case "${MODE}" in
    mytop)
    mytop ${2}
    ;;

    ssh)
    ssh ${2}
    ;;

    *)
    help
    exit 1
esac
