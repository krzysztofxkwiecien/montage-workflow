FROM mhart/alpine-node:12
MAINTAINER Bartosz Balis <balis@agh.edu.pl>

RUN apk add python3 libpcap libpcap-dev util-linux git

ADD software/Montage.tar.gz /
ENV PATH $PATH:/Montage_v3.3_patched_4/bin

RUN npm install -g log4js
RUN git clone https://github.com/krzysztofxkwiecien/hyperflow-job-executor.git /executor
WORKDIR /executor
RUN npm install express
RUN npm install

COPY software/libnethogs.so.0.8.5-63-g68033bf /usr/local/lib
COPY software/nethogs-wrapper.py /usr/local/bin 
RUN chmod +x /usr/local/bin/nethogs-wrapper.py

EXPOSE 8080

CMD ["node", "/executor/hflow-job-listener.js"]
