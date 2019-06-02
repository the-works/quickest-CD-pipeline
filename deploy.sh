#!/bin/sh

docker_user="@1"
docker_pw="@2"

docker login --username=${docker_user} --password=${docker_pw} > /dev/null 2>&1
docker rmi -f $(docker images -aq)
docker pull triplagent/zsoltsayshi
docker stop main
docker rm main
docker run --name main -p 80:80/tcp triplagent/zsoltsayshi &
