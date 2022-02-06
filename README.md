# docker-flink-examples

This is a fork of flink-examples that is used to run the flink example applications.
The source code version is 1.14.3.

## Build Flink example applications

Build Flink example applications
```
docker-compose build
```

## Launch Flink cluster

Launch Flink cluster
```
docker-compose up -d
```

To check the logs for all Flink components, execute the following command.
```
docker-compose logs -f
```

## Run SocketWindowWordCount Flink application

Launch SocketServer in port 9000.
```
docker exec -it socketserver ash
nc -l 9000
```

Submit the SocketWindowWordCount Flink application.
```
docker exec -it jobmanager bash
./bin/flink run ./app/streaming/SocketWindowWordCount.jar --port 9000 --hostname socketserver
```
