source ~/bin/.connect.rc

CREDENTIALS=~/.authinfo

function usage()
{
    echo "USAGE:"
    echo "${0} <ssh|mytop> ID"
    echo "EXAMPLE:"
    echo "${0} ssh 1"
    echo "${0} mytop 2"
}

if [ "$#" -lt 2 ]; then
    echo "Wrong parameters count"
    usage
    exit
fi

function mytop()
{
    line=${1}
    machine=$(get_credentials_machine ${CREDENTIALS} ${1})
    login=$(get_credentials_login ${CREDENTIALS} ${1})
    password=$(get_credentials_password ${CREDENTIALS} ${1})
    port=$(get_credentials_port ${CREDENTIALS} ${1})
    remotehost=$(get_credentials_remotehost ${CREDENTIALS} ${1})
    remoteport=$(get_credentials_remoteport ${CREDENTIALS} ${1})
    
    printf "mytop -h %s --port %s -u %s --prompt -p # line %-5s # LocalForward %s %s:%s\n" ${machine} ${port} ${login} ${line} ${port} ${remotehost} ${remoteport}
}

function ssh()
{
    machine=$(get_credentials_machine ${CREDENTIALS} ${1})
    port=$(get_credentials_port ${CREDENTIALS} ${1})
    remotehost=$(get_credentials_remotehost ${CREDENTIALS} ${1})
    remoteport=$(get_credentials_remoteport ${CREDENTIALS} ${1})

    printf "ssh %s -p %s # line %-5s # LocalForward %s %s:%s\n" ${machine} ${port}  ${1} ${port} ${remotehost} ${remoteport}
}


function mysql()
{
    machine=$(get_credentials_machine ${CREDENTIALS} ${1})
    login=$(get_credentials_login ${CREDENTIALS} ${1})
    port=$(get_credentials_port ${CREDENTIALS} ${1})

    printf "mysql -h %s -u %s --port %s -p\n" ${machine} ${login} ${port}
}


MODE=${1}
LINE=${2}
shift
shift

case "${MODE}" in
    mytop)
	mytop ${LINE}
	;;

    ssh)
	ssh ${LINE}
	;;
    
    mysql)
	mysql ${LINE}
	;;

    mysql_benchmark_myslap)
	
	mysql_benchmark_myslap ${LINE} $@
	;;
    
    *)
    usage
    exit 1
esac
