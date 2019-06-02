FROM ubuntu:18.04

EXPOSE 80/tcp

RUN apt update && apt upgrade -y && apt install -y nginx python-pip curl && \
  pip install --user markdown && \
  curl -o README.md https://raw.githubusercontent.com/the-works/quickest-CD-pipeline/master/README.md && \
  python -m markdown README.md > readme.html && \
  rm /var/www/html/index.nginx-debian.html && \
  cp readme.html /var/www/html/index.nginx-debian.html

CMD service nginx restart && tail -f /var/log/nginx/error.log
