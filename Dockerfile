FROM ubuntu:18.04

EXPOSE 80/tcp

RUN apt update && apt upgrade -y && apt install -y nginx python-pip curl
RUN pip install --user markdown
RUN curl -o README.md https://raw.githubusercontent.com/the-works/quickest-CD-pipeline/master/README.md
RUN python -m markdown README.md > readme.html

RUN rm /var/www/html/index.nginx-debian.html
RUN cp readme.html /var/www/html/index.nginx-debian.html
CMD service nginx restart && tail -f /var/log/nginx/error.log
