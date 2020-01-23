#!/bin/bash
if [ $# -ne 1 ]; then
  echo "usage: ${0} newuser" 1>&2
  exit 1
fi

sudo adduser ${1}
./add_user_groups.sh  ${1}
