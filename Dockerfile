FROM golang:1.23.6 AS builder
WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o main .

FROM gcr.io/distroless/static:nonroot
WORKDIR /app
COPY --from=builder /app/main .
CMD ["/app/main"]
