# Use Ubuntu as the base image
FROM ubuntu:latest

# Install OpenJDK Java Development Kit
RUN apt-get update && apt-get install -y openjdk-11-jdk

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the Java source code into the container
COPY F.java .

# Compile the Java program
RUN javac F.java

# Run the Java program when the container starts
CMD ["java", "F"]
