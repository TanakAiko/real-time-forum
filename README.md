# real-time-forum
To see the project, click [here](https://github.com/01-edu/public/tree/master/subjects/real-time-forum)


- for deleting the containers : `docker rm -f $(docker ps -aq)`

- for deleting the volumes : `docker volume rm $(docker volume ls -q)`

- for deleting the images : `docker rmi -f $(docker images -q)`

- for building the app : `docker-compose up --build`