alias ec="emacsclient"
alias ngrep="grep -n"
alias igrep="igrep -i"
alias rgrep="igrep -R"
alias nigrep="grep -n -i"
alias nirgrep="grep -n -i -R"

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
