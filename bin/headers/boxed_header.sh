#!/bin/bash

# ╔════════════════════════════════════════════════════════════════════════════════╗
# ║ Version:                                                                   0.4 ║
# ║ Date of Version:                                                    17.07.2022 ║
# ║ Owner:                                                            Malek Temimi ║
# ║ Classification:                                                         Public ║
# ║ Distribution:                                                         Internet ║
# ╚════════════════════════════════════════════════════════════════════════════════╝

# Ref.: ASCII Chars: https://gist.github.com/xero/59c8a62ff1fe564264f9
function paint_boxed()
{
    boxes \
	-d pound-cmt \
	-i none \
	boxed_message.txt # -d shell -d pound-cmt -d headline
}

function paint_h_line()
{
    let h_line_width=${1}
    for i in $(seq ${h_line_width}); do echo -n "═"; done
}

function paint_top_h_line_w_corners()
{
    let h_line_width=$1

    echo -n "╔"
    paint_h_line ${h_line_width}
    echo -n "╗"
}

function paint_bottom_h_line_w_corners()
{
    let h_line_width=${1}

    echo -n "╚"
    paint_h_line ${h_line_width}
    echo "╝"
}

# function paint_mid_part()
# {
#     let h_line_width=${2}
#     printf "║%-*s║" ${h_line_width} "${1}" #
# }

# function paint_mid_part_measure_max_padding()
# {   
#     WIDTH_PADDING_MAX=1

#     while (("${#}")); do
#         measure="${1}${2}"
#         if (( ${#measure} > $WIDTH_PADDING_MAX )); then WIDTH_PADDING_MAX=${#measure}; fi 
        
#         shift
#         shift
#     done

#     echo $WIDTH_PADDING_MAX
# }

function paint_mid_part_padded()
{
    let h_line_width=${2}
    
    printf "║ %s%*s%s ║" "${1}" ${h_line_width} "${3}"
}
# paint_mid_part_padded "hello:" 30 "world"

function paint_mid_part_padded2()
{
    let h_line_width=${2}

    printf "║ %s" "${1}"
    printf "%*s" $((${h_line_width}-${#1}-${#3}-2))
    printf "%s ║" "${3}"
}


function paint_hello_world_boxed()
{
    h_line_width=80

    paint_top_h_line_w_corners $h_line_width
    echo
    # paint_mid_part "hello world" $h_line_width
    paint_mid_part_padded "hello:" $h_line_width "world"
    echo
    paint_bottom_h_line_w_corners $h_line_width
}

function paint_multi_lined_boxed()
{
    h_line_width=${1:-80}
    shift

    paint_top_h_line_w_corners $h_line_width
    echo

    while (("${#}")); do
	paint_mid_part "${1}" $h_line_width
	echo
	shift
    done
    
    paint_bottom_h_line_w_corners $h_line_width
}

function paint_multi_lined_boxed_padded()
{
    h_line_width=${1:-80}
    shift
    paint_top_h_line_w_corners $h_line_width
    echo

    while (("${#}")); do
	paint_mid_part_padded2 "${1}" $(($h_line_width)) "${2}"
	echo
	shift
    shift
    done
    paint_bottom_h_line_w_corners $h_line_width
}

#paint_boxed
#example2

line_width=${1}
shift

paint_multi_lined_boxed_padded ${line_width} "${@}" | boxes \
						   -d pound-cmt \
						   -i none
