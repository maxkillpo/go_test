# Dockerfile References: https://docs.docker.com/engine/reference/builder/

# Start from the latest golang base image
FROM golang:latest
ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64

RUN apk update && apk upgrade && \
  apk add --no-cache ca-certificates git openssh-client

RUN mkdir -p /test-api
WORKDIR /test-api

ADD . /test-api
RUN go build -mod vendor

# Expose port 8080 to the outside world
EXPOSE 80

# Command to run the executable
CMD ["./test-api"]
