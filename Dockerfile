###
# vert.x docker example using a Java verticle packaged as a fatjar
# To build:
#  docker build -t test/cicd-test .
# To run:
#   docker run -t -i -p 8080:8080 test/cicd-test
###

FROM openjdk:10-jre-slim

ENV VERTICLE_FILE cicd-test-fat.jar

# Set the location of the verticles
ENV VERTICLE_HOME /usr/verticles

EXPOSE 8080

# Copy your fat jar to the container
COPY build/libs/$VERTICLE_FILE $VERTICLE_HOME/

# Launch the verticle
WORKDIR $VERTICLE_HOME
ENTRYPOINT ["sh", "-c"]
CMD ["exec java -jar $VERTICLE_FILE"]
