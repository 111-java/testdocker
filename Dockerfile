FROM openjdk:17-jdk-slim
WORKDIR /appContainer
COPY ./target/bsampleappc.jar /appContainer
EXPOSE 9190
CMD ["java","-jar","bsampleappc.jar"]