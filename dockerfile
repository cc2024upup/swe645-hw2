# Use the Nginx image
FROM nginx:alpine

# Delete the default homepage file to prevent it from being overwritten.
RUN rm -rf /usr/share/nginx/html/*

# Copy all local static files to the default directory of Nginx.
COPY . /usr/share/nginx/html

# Default exposure of port 80
EXPOSE 80


