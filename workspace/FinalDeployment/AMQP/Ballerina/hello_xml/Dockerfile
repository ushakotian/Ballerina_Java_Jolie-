FROM ballerina/ballerina:1.2.3
WORKDIR /home/ballerina
COPY hello_xml.jar /home/ballerina
COPY ballerina.conf /home/ballerina
EXPOSE 9090 
CMD ballerina run hello_xml.jar --b7a.config.file=/home/ballerina/ballerina.conf