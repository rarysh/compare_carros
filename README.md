Pre requisites:

    - GraalVM 19.1.1        OR        JDK 1.8+              installed with JAVA_HOME configured appropriately
    - Apache Maven 3.5.3+       OR      //Gradle
    
Install GraalVM

    Download from https://www.graalvm.org/downloads/  (Community Edition)
    (extract files)
    $ export PATH=/home/rarysh/Downloads/graalvm-ce-java8-19.3.0/bin:$PATH
    (check if you are using Graal)
    $ echo $PATH
    
    $ export JAVA_HOME=/home/rarysh/Downloads/graalvm-ce-java8-19.3.0

    $ gu install native-image


    $ sudo apt-get install zlib1g-dev build-essential
To run:

    (on project directory)
    $ ./mvnw compile quarkus:dev
    
Link to swagger

    http://localhost:8080/swagger-ui/
