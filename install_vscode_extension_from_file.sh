#!/bin/bash

function main(){
  local -r MIN_ARG=3
  if [ $# -lt "${MIN_ARG}" ]; then
    echo "usage: ${FUNCNAME[0]} publisher extensionname version" 1>&2
    return 1
  fi
  
  local -r FILE=`./download_vscode_extension.sh "$@"`
  local -r EXTENSION_NAME="${FILE%.*}"
  
  if [ $? = 0 ]; then
    mkdir -p ${HOME}/.vscode-server/extensions
    unzip -o ${FILE} -d /tmp/${EXTENSION_NAME}
    mv /tmp/${EXTENSION_NAME}/extension ${HOME}/.vscode-server/extensions/${EXTENSION_NAME}
    rm -f ${FILE}
  else
    return 1
  fi
  return 0
}

main "$@"
