FROM golang:alpine as builder

COPY . /go/src/codeeducation
WORKDIR /go/src/codeeducation

RUN go get ./
RUN go build -ldflags "-s -w" -o /go/bin/codeeducation

FROM scratch
COPY --from=builder /go/bin/codeeducation /go/bin/codeeducation
CMD chmod +x /go/bin/codeeducation
ENTRYPOINT ["/go/bin/codeeducation"]