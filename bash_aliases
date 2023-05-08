alias ec="emacsclient"
alias ngrep="grep -n"
alias igrep="igrep -i"
alias rgrep="igrep -R"
alias nigrep="grep -n -i"
alias nirgrep="grep -n -i -R -H"
alias gd="git diff"
alias cat_special_chars="cat -e -t -v"

function gec()
{
    FILENAME=$1
    LINES=$2

    emacsclient +${LINES} ${FILENAME}
}

function gcode()
{
    FILENAME=$1
    LINES=$2

    code -g  ${FILENAME}:${LINES}
}

function print_download_test_files()
{
	echo "https://speed.hetzner.de/100MB.bin"
	echo "https://speed.hetzner.de/1GB.bin"
	echo "https://speed.hetzner.de/10GB.bin"
}

function make_separation()
{
	echo "########################################################################################################################"
	echo "########################################################################################################################"
	echo "########################################################################################################################"	
}


function ssh_setup()
{
	eval $(ssh-agent -s)
	ssh-add ~/.ssh/id_rsa_sp
	export GPG_TTY=$(tty)
}

