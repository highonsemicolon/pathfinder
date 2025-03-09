FROM golang:1.23.6 AS builder
WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o main .

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/main .

ENV GIN_MODE=release
ENV PORT=80
EXPOSE 80
CMD ["/app/main"]