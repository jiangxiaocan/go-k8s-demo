FROM golang:1.16 as builder
ENV GOPROXY=https://goproxy.cn
WORKDIR $GOPATH/src/gin-demo
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o main .

FROM scratch
ENV GIN_MOD=release
WORKDIR /gin-demo
COPY --from=builder /go/src/gin-demo/main .

EXPOSE 9090

ENTRYPOINT ["./main"]