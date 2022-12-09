#!/bin/bash

function main(){
    local -r MIN_ARG=3
    if [ $# -lt "${MIN_ARG}" ]; then
        echo "usage: ${FUNCNAME[0]} publisher extensionname version" 1>&2
        return 1
    fi
    
    local -r publisher="${1}"
    local -r extensionname="${2}"
    local -r version="${3}"
    
    echo "https://${publisher}.gallery.vsassets.io/_apis/public/gallery/publisher/${publisher}/extension/${extensionname}/${version}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage"
}

main "$@"
