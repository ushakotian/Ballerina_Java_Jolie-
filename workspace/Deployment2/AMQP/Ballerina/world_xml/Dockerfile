FROM ballerina/ballerina:1.2.3
WORKDIR /home/ballerina
COPY world_xml.jar /home/ballerina
COPY ballerina.conf /home/ballerina
EXPOSE 5672
CMD ballerina run world_xml.jar --b7a.config.file=/home/ballerina/ballerina.conf