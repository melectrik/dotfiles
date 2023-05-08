"""
This is a generic Python start script,
designed to start almost every kind of python processing.
Please feel free to edit according to your needs.
"""

# ╔════════════════════════════════════════════════════════════════════════════════╗
# ║ Version:                                                                   0.1 ║
# ║ Date of Version:                                                    23.09.2022 ║
# ║ Owner:                                                         First Last Name ║
# ║ Classification:                                                       Internal ║
# ║ Distribution:                                                        All Staff ║
# ╚════════════════════════════════════════════════════════════════════════════════╝

import os
import sys
from dotenv import load_dotenv
# from pathlib import Path
# dotenv_path = Path('path/to/.env')
# load_dotenv(dotenv_path=dotenv_path)
# sys.path.append(script_path + "/../t1/")

"""Caution: the following is indifferent to and not safe when you already did a os.chdir()"""
script_path = os.path.dirname(os.path.realpath(__file__))

"""to get the current working dir after an os.chdir()"""
cwd = os.getcwd()


def fn1():
    print("fn1()")


def fn2():
    print("fn2()")


def usage():
    out = """
    Usage:
    \t{} <subcommand>

    Subcommands:
    \t{}\t\t{}
    """.format(sys.argv[0],
               "--fn1", "Does awesome magic!",
               "--fn2", "Does awesome magic!")

    print(out)


def main(argument):
    """
    This function handles the input parameters and calls the proper functions accordingly
    """

    load_dotenv()

    print("{} \n {}".format(
        os.getenv('ENV_VAR_1'),
        os.getenv('ENV_VAR_2')))

    if(argument == "--fn1"):
        fn1()
    elif(argument == "--fn2"):
        fn2()
    else:
        usage()


if __name__ == "__main__":
    argument = sys.argv[1] if sys.argv[1] else "usage"
    main(argument)

