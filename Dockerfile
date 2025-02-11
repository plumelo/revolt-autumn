# Build Stage
FROM ghcr.io/revoltchat/base:latest AS builder
FROM debian:12 AS debian

# Bundle Stage
FROM gcr.io/distroless/cc-debian12:nonroot
COPY --from=builder /home/rust/src/target/release/revolt-autumn ./
COPY --from=mwader/static-ffmpeg:7.0.2 /ffmpeg /usr/local/bin/
COPY --from=mwader/static-ffmpeg:7.0.2 /ffprobe /usr/local/bin/
COPY --from=debian /usr/bin/uname /usr/bin/uname

EXPOSE 14704
USER nonroot
CMD ["./revolt-autumn"]
