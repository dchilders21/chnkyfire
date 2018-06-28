#FROM dchilders21/node-vim-nginx
FROM node:9
RUN apt-get update && apt-get install nginx vim -yqq
# Copy the contents of the dist directory over to the home
COPY ./ ./
# Remove the default nginx index.html
RUN rm -rf /var/www/html
# Move static files to nginx web root
RUN mv ./ /var/www/html
# Replace nginx config
RUN rm /etc/nginx/sites-enabled/default
RUN cp ./.nginx.site.conf /etc/nginx/conf.d/site.conf
# Expose the public http port
EXPOSE 80
# Start server
CMD ["nginx", "-g", "daemon off;"]
