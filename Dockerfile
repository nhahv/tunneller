FROM golang:alpine as builder
WORKDIR /app
COPY . . 
RUN go build


FROM alpine:latest
COPY --from=builder /app/tunneller /bin/
ENV MQ_HOST mosquitto
ENV MQ_PORT 1883
ENV HOST 127.0.0.1
ENV PORT 8080
#CMD ["sleep", "infinity"]
EXPOSE 8080
CMD env
CMD [ "tunneller", "serve" ]

