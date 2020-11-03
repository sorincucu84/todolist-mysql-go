FROM golang:1.15-alpine

# Set the Current Working Directory inside the container
WORKDIR /playground.ion/todolist

# We want to populate the module cache based on the go.{mod,sum} files.
COPY go.mod .
COPY go.sum .

RUN go mod download

COPY . .

# Build the Go app
RUN go build -o ./out/todolist .


# This container exposes port 8080 to the outside world
EXPOSE 3000

RUN chmod +x ./out/todolist

# Run the binary program produced by `go install`
CMD ["./out/todolist"]