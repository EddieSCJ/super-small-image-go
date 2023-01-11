FROM golang as BUILD_STAGE

WORKDIR /app
COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o go-challenge .


FROM gcr.io/distroless/static-debian11 as RUN_STAGE

COPY --from=BUILD_STAGE /app .

ENTRYPOINT ["./go-challenge"]


