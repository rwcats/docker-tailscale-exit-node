#!/bin/bash

# Khởi động dịch vụ Tailscale
tailscaled --state=/var/lib/tailscale/tailscaled.state &

# Đợi Tailscale khởi động
sleep 5

# Đăng nhập vào Tailscale
tailscale up --advertise-exit-node --authkey=${TAILSCALE_AUTH_KEY}

# Giữ container chạy
tail -f /dev/null
