FROM centos:8
# app stearm internal mirrorlist: No URLs in mirrorlist
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
LABEL maintainer="Sai Deepak"
# dnf default package manager
RUN dnf update -y
RUN dnf upgrade -y
RUN dnf install epel-release -y
RUN dnf install nginx -y
COPY . /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
