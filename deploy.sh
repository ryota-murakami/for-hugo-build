#!/bin/bash

# Usage

function usage() {
cat <<_EOT_
Usage:
  $0 [-h] commit_comment ...

Description:
  push to github

Options:
  -h  help

_EOT_
exit 1
}

if [ "$OPTIND" = 1 ]; then
  while getopts h OPT
  do
    case $OPT in
      h)
        usage
        ;;
      \?)
        echo "Try to enter the h option." 1>&2
        ;;
    esac
  done
else
  echo "No installed getopts-command." 1>&2
  exit 1
fi

# Main

function set_commit_comment() {
  if [[ -n $@ ]]; then
    for str in $@
    do
      COMMIT_COMMNET="${COMMIT_COMMNET} $str"
    done
  else
    COMMIT_COMMNET="update `date`"
  fi
}

readonly HUGO_ROOT_DIR=$(cd $(dirname $0);pwd)
readonly PUBLIC_DIR="${HUGO_ROOT_DIR}/public"

set_commit_comment $@

cd $PUBLIC_DIR

git add --all

git commit -m "$COMMIT_COMMNET"

git push -f origin master

cd $HUGO_ROOT_DIR

git add --all

git commit -m "$COMMIT_COMMNET"

git push -f origin master
