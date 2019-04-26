#!/bin/bash

# Usage: hoge [options] [dir]
#
# Options:
#   command:
#
#    "Prod : sh deploy.sh prod --deploy"
#    "Prod DryRun: sh deploy.sh prod --dry"
#
#    "Stg : sh deploy.sh stg --deploy"
#    "Stg DryRun: sh deploy.sh stg --dry"
#
# argument:
#
#   stg
#   prod
#
#   --dry        : DryRun
#   --deploy     : 本番デプロイ
#

set -ue

function usage()
{
    sed -rn '/^# Usage/,${/^#/!q;s/^# ?//;p}' "$0"
    exit 1
}

# Usage Da Yo!
usage

echo "\$0（スクリプト名）: $0"
echo "\$1（1番目の引数）: $1"
echo "\$2（番目の引数）: $2"

if [ $1 = prod ]; then
    ansible-playbook -i prod prod/tasks/playbook.yml --check
  else
    echo "引数が間違っています"
  fi
    if [ $2 = --deploy ]; then
      ansible-playbook -i prod prod/tasks/playbook.yml
    else
      echo "prodにdeployできません"
    fi



if [ $1 = stg ]; then
  if [ $2 = --dry ]; then
    ansible-playbook -i stg stg/tasks/playbook.yml --check
  else
    echo "引数が間違っています"
  fi
    if [ $2 = --deploy ]; then
      ansible-playbook -i stg stg/tasks/playbook.yml
    else
      echo "stgにdeployできません"
    fi
fi
