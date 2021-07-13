FROM centos:8

RUN curl -sL https://rpm.nodesource.com/setup_12.x | bash -
RUN dnf install -y epel-release
RUN dnf install -y \
    jq \
    nodejs \
    openssl \
    gettext \
    bind-utils \
    net-tools
RUN dnf clean all
ADD traffic_portal.rpm /
RUN rpm -Uvh /traffic_portal.rpm && rm /traffic_portal.rpm

EXPOSE 443

ADD run.sh /

CMD /run.sh