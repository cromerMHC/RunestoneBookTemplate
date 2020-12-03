
folderName=${PWD##*/}
docker exec runestoneserver_runestone_1 sh -c "cd /srv/web2py/applications/runestone/books/$folderName ; runestone build --all deploy"