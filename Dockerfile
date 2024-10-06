ARG DB_ROOT_FILE_PATH=yc-db/db-root.crt
ARG JAVA_IMAGE=openjdk:17-oracle
FROM ${JAVA_IMAGE}
WORKDIR /opt/application

RUN mkdir /opt/application/.postgresql
COPY ${DB_ROOT_FILE_PATH} /opt/application/.postgresql/root.crt
RUN chmod 0600 /opt/application/.postgresql/root.crt

USER nobody
COPY target/*.jar /opt/application/application.jar
ENTRYPOINT java $JAVA_OPTS -jar /opt/application/application.jar $JAVA_ARGS