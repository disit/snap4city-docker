FROM alpine
COPY dashboard_frontend/wsServer-go/wsServer-go /websocketserver/wsServer-go/wsServer-go
COPY dashboard_frontend/conf /websocketserver/conf

CMD sh -c "cd /websocketserver/wsServer-go; ./wsServer-go"

