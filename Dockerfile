FROM mosipid/openjdk-17-jre
WORKDIR /appContainer
COPY ./target/bsampleappc.jar /appContainer
EXPOSE 9190
CMD ["java","-jar","bsampleappc.jar"]