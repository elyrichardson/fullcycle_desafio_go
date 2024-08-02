FROM golang:1.20-alpine AS builder

WORKDIR /app

COPY main.go .

RUN GO111MODULE=off go build -o main .

FROM scratch

COPY --from=builder /app/main .

CMD ["./main"]