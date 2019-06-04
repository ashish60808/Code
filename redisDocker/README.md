## Exercise 3
### Write a Dockerfile for redis
* That uses the latest Ubuntu LTS Docker image as its base
* That accepts port configuration from an environment variable when the server
  is started
* That accepts memory limit configuration from an environment variable when the
  server is started


I have created the Dockerfile, using which we can build the container that uses the latest Ubuntu LTS Docker image.
2 environment variables are used MEMORYLIMIT and PORT to accept configuration from command line when docker is run.

## How to Build the docker container.
docker build -t redis:latest .

## How to Run the docker container.
docker run  -it -e MEMORYLIMIT=2mb -e PORT=4000  redis:latest

## How to connect to docker and verify the things.
docker exec -it <Container ID>  redis-cli -p 4000 info memory
