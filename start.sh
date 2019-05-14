#1/bin/bash
read -sp "Password: " passwd

docker run  \
    -d \
    --user root \
    -e GRANT_SUDO=yes \
    -e NB_UID=`id -u` \
    -e NB_GID=`id -g` \
    -e TZ=Asia/Tokyo \
    -p 8888:8888 \
    --name notebook \
    -v ~/github/jupyter/work:/home/jovyan/work \
    jupyter/datascience-notebook \
    start-notebook.sh \
    --NotebookApp.password='sha1:'$passwd
