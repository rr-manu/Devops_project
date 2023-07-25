FROM golang:latest
WORKDIR /app
COPY go.sum go.mod ./
RUN go mod download
COPY *.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -o /ping
EXPOSE 8080
CMD ["/ping"]