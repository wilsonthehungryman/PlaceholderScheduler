FROM nginx

#RUN rm /etc/nginx/conf.d/default.conf

#RUN rm /etc/nginx/conf.d/examplessl.conf

#COPY content /usr/share/nginx/html

COPY ./nginx.conf /etc/nginx

#RUN rm /etc/nginx/sites-enabled/default
#ADD placeholder.conf /etc/nginx/sites-enabled/placeholder.conf

RUN mkdir /app/
RUN mkdir /app/placeholder
COPY ./* /app/placeholder
