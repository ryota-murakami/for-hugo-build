#!/bin/bash
ROOT_DIR=$(cd $(dirname $0);pwd)
PUBLIC_DIR="${ROOT_DIR}/public";

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

echo $COMMIT_COMMNET;

cd $PUBLIC_DIR

git add --all

git commit -m "update `date`"

git push

cd $ROOT_DIR

git add --all

git commit -m "update `date`"

git push
