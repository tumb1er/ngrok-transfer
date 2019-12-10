FROM wernight/ngrok
COPY --from=dutchcoders/transfer.sh /go/bin/transfersh /bin/
ENV NGROK_AUTH=""
ENTRYPOINT \
    /bin/transfersh --listener :8080 --provider local --basedir=/tmp & \
    /bin/ngrok http --authtoken "$NGROK_AUTH" 8080
