docker rm -f $(docker ps -aq)
docker volume rm $(docker volume ls -q)
docker rmi -f $(docker images -q)

echo "It might take a little longer for the first time\n"

docker-compose up --build
