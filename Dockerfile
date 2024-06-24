# Sử dụng hình ảnh cơ bản của Alpine Linux
FROM alpine:latest

# Cài đặt các gói cần thiết
RUN apk add --no-cache \
    iptables \
    ip6tables \
    curl \
    bash \
    openrc

# Thêm repository của Tailscale và cài đặt Tailscale
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk update && \
    apk add --no-cache tailscale

# Tạo thư mục cấu hình
RUN mkdir -p /var/lib/tailscale

# Tạo script khởi động
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Mở các cổng cần thiết
EXPOSE 41641/udp

# Khởi động script
ENTRYPOINT ["/entrypoint.sh"]
