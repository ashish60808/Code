# How to Build the docker container.
docker build -t redis:latest .

# How to Run the docker container.
docker run  -it -e MEMORYLIMIT=2mb -e PORT=4000  redis:latest

# How to connect to docker and verify the things.
docker exec -it 199a031a7003  redis-cli -p 4000 info memory
