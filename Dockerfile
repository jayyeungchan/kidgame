FROM nginx:1.27-alpine

LABEL org.opencontainers.image.title="kidgame 宝贝学乐园" \
      org.opencontainers.image.description="粤语儿童启蒙小游戏 - 静态单页应用" \
      org.opencontainers.image.licenses="MIT"

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://127.0.0.1/ >/dev/null 2>&1 || exit 1

CMD ["nginx", "-g", "daemon off;"]
