FROM debian:12 AS debian
FROM ghcr.io/revoltchat/autumn:20250210-1 AS target
COPY --from=debian /usr/bin/uname /usr/bin/uname
