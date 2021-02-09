param(
   [string] $Action
)

if ($Action -eq "start") {
    docker start bchain-files bchain-data bchain-queue
} elseif ($Action -eq "stop") {
    docker stop bchain-files bchain-data bchain-queue
} elseif ($Action -eq "create") {
    docker rm --force bchain-files bchain-data bchain-queue
    docker run --name bchain-files -p 6379:6379 -d redis redis-server --appendonly yes
    docker run -p 4369:4369 -p 5671:5671 -p 5672:5672 -p 15691:15691 -p 15692:15692 -p 25672:25672 -p 8080:15672 -d --hostname monorabbitmq --name bchain-queue rabbitmq:3-management
    docker run --name bchain-data -p 27017:27017 -d mongo
}