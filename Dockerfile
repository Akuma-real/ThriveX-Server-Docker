# 使用Alpine版本的Java 8作为基础镜像，体积更小
FROM openjdk:8-jdk-alpine

# 设置工作目录
WORKDIR /app

# 复制JAR文件到容器中
COPY blog.jar /app/blog.jar

# 暴露8080端口
EXPOSE 8080

# 启动命令
ENTRYPOINT ["java", "-jar", "blog.jar"] 