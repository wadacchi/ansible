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

if [ $1 = --help ]; then
    usage
fi

echo "\$0（スクリプト名）: $0"
echo "\$1（1番目の引数）: $1"
echo "\$2（番目の引数）: $2"

if [ $2 = --deploy ]; then
	if [ $1 = prod ]; then
           ansible-playbook -i prod prod/tasks/playbook.yml
	fi
        else if [ $1 = stg ]; then
          ansible-playbook -i stg stg/tasks/playbook.yml
	fi
fi

if [ $2 = --dry ]; then
        if [ $1 = prod ]; then
           ansible-playbook -i prod prod/tasks/playbook.yml --check
	fi
        else if [ $1 = stg ]; then
          ansible-playbook -i stg stg/tasks/playbook.yml --check
	fi
fi

set -ue

function usage()
{
    sed -rn '/^# Usage/,${/^#/!q;s/^# ?//;p}' "$0"
    exit 1
}

# Usage Da Yo!

if [ $1 = --help ]; then
    usage
fi

