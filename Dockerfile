# 使用Alpine版本的Java 8作为基础镜像，体积更小
FROM openjdk:8-jdk-alpine

# 设置工作目录
WORKDIR /app

# 复制JAR文件到容器中
COPY blog.jar /app/blog.jar

# 暴露8080端口
EXPOSE 8080

# 启动命令，使用环境变量传递参数
ENTRYPOINT ["sh", "-c", "java -jar blog.jar \
    --PORT=${PORT:-8080} \
    --DB_INFO=${DB_INFO:-mysql:3306/thrivex} \
    --DB_USERNAME=${DB_USERNAME:-root} \
    --DB_PASSWORD=${DB_PASSWORD:-123456} \
    --EMAIL_HOST=${EMAIL_HOST:-smtp.qq.com} \
    --EMAIL_PORT=${EMAIL_PORT:-465} \
    --EMAIL_USERNAME=${EMAIL_USERNAME:-none} \
    --EMAIL_PASSWORD=${EMAIL_PASSWORD:-none}"] 