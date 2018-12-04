#!/bin/bash

if [[ `echo "$(docker ps -a -f status=exited -q -f status=created -q)"|awk 'NF'|wc -l` > 0 ]];then echo "Removed below docker containers" ; docker rm -f $(docker ps -a -f status=exited -f status=created -q);else echo "There is no container to delete";fi

echo "=========================================================="

if [[ `echo "$(docker volume ls -q -f 'dangling=true')"|awk 'NF'|wc -l` > 0 ]];then echo "Removed below docker volume" ; docker volume rm $(docker volume ls -q -f 'dangling=true');else echo "There is no unused volume to remove";fi

echo "=========================================================="

if [[ `echo "$(docker images -q -f 'dangling=true')"|awk 'NF'|wc -l` > 0 ]];then echo "Removed below docker images" ; docker rmi $(docker images -q -f 'dangling=true');else echo "There is no unused images to remove";fi
