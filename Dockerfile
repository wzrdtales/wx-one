FROM nginxinc/nginx-unprivileged:1.22

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY public/ /usr/share/nginx/html/
