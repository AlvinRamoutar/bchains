

## Setup Environment

### Install Redis Server

1. `docker pull redis`
2. `docker run --name bchain-files -p 6379:6379 -d redis redis-server --appendonly yes`

### Install RabbitMQ Server (docker)

1. `docker pull rabbitmq`
2. `docker run -p 4369:4369 -p 5671:5671 -p 5672:5672 -p 15691:15691 -p 15692:15692 -p 25672:25672 -d --hostname monorabbitmq --name bchain-queue rabbitmq:3`

### Install MongoDB (docker)

1. `docker pull mongo`
2. `docker run --name bchain-data -p 27017:27017 -d mongo`