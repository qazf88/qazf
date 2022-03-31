FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive
#RUN apt-get --no-cache git

RUN apt-get update && apt-get upgrade -y && apt-get install -y apt-utils && apt-get install -y build-essential 
 RUN apt-get install -y ca-certificates
RUN apt-get install -y mosquitto && apt-get install -y mosquitto-clients && apt-get install -y mc

WORKDIR /
COPY ./default/mosquitto/conf.d/default.conf /etc/mosquitto/conf.d/default.conf
 COPY ./default/mosquitto/mosquitto.conf /etc/mosquitto/mosquitto.conf

# COPY go.mod .
# COPY go.sum .
# RUN go mod download
# COPY . .
# RUN go build -o ./app/camera .

# FROM alpine:3.9 
# RUN apk add ca-certificates
# RUN  apk update  && apk upgrade &&   apk add gphoto2  && apk add libgphoto2-dev
# COPY --from=build_base /tmp/photobox-camera-app/app/camera /usr/bin/camera

# EXPOSE ${CAMERA_PORT}
