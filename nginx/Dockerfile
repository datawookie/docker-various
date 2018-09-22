# =============================================================================
# NGINX DOCKER IMAGE
# =============================================================================

# To run:
#
# $ docker run -d -p 80:80 -v <path>:/usr/share/nginx/html:ro nginx:latest
#
# where <path> is the absolute path to the web site files on the host.

FROM nginx
MAINTAINER Andrew Collier <andrew@exegetic.biz>
#
# Enable directory listing.
#
RUN sed -i '30i\\    autoindex on;' /etc/nginx/nginx.conf
