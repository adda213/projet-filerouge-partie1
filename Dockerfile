FROM python:3.6-alpine
WORKDIR /opt
MAINTAINER POZOS
RUN apk update
RUN apk add git
RUN pip install flask==1.1.2
ENV ODOO_URL="https://www.odoo.com/" 
ENV PGADMIN_URL="https://www.pgadmin.org/"
EXPOSE 8080
RUN git clone https://github.com/sadofrazer/ic-webapp.git
ENTRYPOINT ["python", "ic-webapp/app.py"]