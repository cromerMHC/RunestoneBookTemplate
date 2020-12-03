#!/bin/bash

#move to script directory
#DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
DIR=$(dirname "$0")
#echo $DIR
cd $DIR

#get folder name (used when build runestone book)
folderName=${PWD##*/}

#update git
git reset --hard
gitStatus=$(git pull)

#if changes are detected, rebuild and deploy
if [ "$gitStatus" != "Already up to date." ]
then
        echo "Runestone book change detected. Rebuilding..."
        docker exec runestoneserver_runestone_1 sh -c "cd /srv/web2py/applications/runestone/books/$folderName ; runestone build --all deploy"
        echo "Done."
else
        echo "No Changes detected. Done."
fi
