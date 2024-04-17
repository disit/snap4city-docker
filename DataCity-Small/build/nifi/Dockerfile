ARG NIFI_TAG
FROM maven:3-openjdk-8 as maven-builder

RUN git clone https://github.com/disit/snap4city
RUN cd snap4city/NIFI-processors/enrich-data && \
    mvn package
RUN cd snap4city/NIFI-processors/ingest-data && \
    mvn package
RUN cd snap4city/NIFI-processors/ && \
    mkdir nars && \
    cp */*-nar/target/*.nar nars && \
    echo nars: && \
    ls -l nars

#################### SNAP4NIFI ##########################
FROM apache/nifi:$NIFI_TAG
COPY --from=maven-builder snap4city/NIFI-processors/nars/* /opt/nifi/nifi-current/extensions/

