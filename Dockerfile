# Base image
FROM amazonlinux:2

# Description
LABEL Description="Dockerfile to contenerize an apache app"

# Update all packages
RUN yum -y update

# Install apache on the container
RUN yum install -y httpd

# Copy the app + dependencies inside the container
COPY index.html /var/www/html

# Port on which the container should listen on
EXPOSE 80

# systemctl start/enable httpd
ENTRYPOINT [ "/usr/sbin/httpd" ]

# Run the container in background
CMD [ "-D", "FOREGROUND" ]
