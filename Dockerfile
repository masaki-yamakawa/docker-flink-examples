# syntax=docker/dockerfile:experimental
FROM maven:3.8.4-openjdk-8-slim as builder
COPY . /build/
WORKDIR /build
RUN --mount=type=cache,target=/root/.m2,rw mvn clean package

FROM flink:scala_2.12-java11
WORKDIR /opt/flink
RUN mkdir -p ./app/batch/ \
    && mkdir -p ./app/streaming/
COPY --from=builder /build/flink-examples-batch/target/batch/*.jar ./app/batch
COPY --from=builder /build/flink-examples-streaming/target/streaming/*.jar ./app/streaming
CMD ["bash"]
