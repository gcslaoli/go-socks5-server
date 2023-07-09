# 第一阶段：构建应用程序
FROM golang:1.17-alpine AS builder

WORKDIR /app

COPY . .

RUN go build -o main .


# 第二阶段：构建最终镜像
FROM alpine:latest

WORKDIR /app

# 从第一阶段复制编译好的可执行文件到最终镜像
COPY --from=builder /app/main .

# 可选：如果你的应用程序需要监听某个特定的端口，可以使用 EXPOSE 命令指定要暴露的端口号
EXPOSE 3128
EXPOSE 1080

# 运行应用程序
CMD ["./main"]
