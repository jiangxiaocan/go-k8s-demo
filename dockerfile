FROM golang:1.14-alpine
ENV GOPROXY=https://goproxy.cn
WORKDIR /build
COPY . .
EXPOSE 9090
RUN mkdir /app
RUN  go mod tidy
RUN go build -o /app/gin-demo main.go
WORKDIR /app
CMD ["/app/main"]