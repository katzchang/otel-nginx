FROM nginx:1.18

RUN apt-get update ; apt-get install unzip
#RUN cd /opt ; unzip opentelemetry-webserver-sdk-x64-linux.tgz.zip; tar xvfz opentelemetry-webserver-sdk-x64-linux.tgz
#RUN cd /opt/opentelemetry-webserver-sdk; ./install.sh
#ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/opentelemetry-webserver-sdk/sdk_lib/lib
#RUN echo "load_module /opt/opentelemetry-webserver-sdk/WebServerModule/Nginx/ngx_http_opentelemetry_module.so;\n$(cat /etc/nginx/nginx.conf)" > /etc/nginx/nginx.conf

COPY otel_ngx_module.so /usr/share/nginx/modules/otel_ngx_module.so

COPY otel-nginx.toml /etc/
COPY nginx.conf /etc/nginx/

