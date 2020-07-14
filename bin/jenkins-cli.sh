#!/bin/bash

. ${0}.rc
java -jar ${JENKINS_CLI_JAR_PATH} -s ${JENKINS_URL} -auth @${HOME}/.jenkins-cli ${@}

usage()
{
    echo "${0} <command> <command> ..."
}

