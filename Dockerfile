FROM golang:1.23.6 AS builder
WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM gcr.io/distroless/static:nonroot
WORKDIR /app
COPY --from=builder /app/main .

ENV GIN_MODE=release
ENV PORT=80
EXPOSE 80
CMD ["/app/main"]