FROM golang:1.9

RUN mkdir /echo
RUN main.go /echo

CMD ["go", "run", "/echo/main.go"]
