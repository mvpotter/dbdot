FROM golang:1.21-alpine3.18 as build
WORKDIR /go/dbdot
COPY ./ ./
RUN mkdir target
RUN go build -tags osusergo,netgo -o target ./cmd/dbdot/

FROM alpine:3.18.0
WORKDIR /opt/bin/
COPY --from=build /go/dbdot/target/dbdot ./
ENTRYPOINT ["/opt/bin/dbdot"]
