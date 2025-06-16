FROM golang:1.22-alpine AS builder

WORKDIR /app
COPY . .

RUN go build -o toolbox main.go

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/toolbox /app/toolbox

EXPOSE 8080
CMD ["/app/toolbox"]
