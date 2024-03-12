FROM golang:1.18 as builder

RUN git clone https://github.com/disit/dashboard-builder
RUN cd dashboard-builder/dashboard_frontend/wsServer-go && \
    CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo

#############################################
FROM alpine:latest
COPY --from=builder dashboard-builder/dashboard_frontend/wsServer-go/wsServer-go /websocketserver/wsServer-go/wsServer-go
#COPY dashboard_frontend/conf /websocketserver/conf
RUN adduser -u 1001 -S wsserver
USER wsserver
CMD sh -c "cd /websocketserver/wsServer-go; ./wsServer-go"
