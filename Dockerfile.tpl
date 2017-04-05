FROM ubuntu:16.04
MAINTAINER Kuo-tung Kao


RUN apt-get update && \
    apt-get install -y --force-yes git fish python-pip vim libssl-dev && \
    apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common


RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

RUN add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

RUN apt-get update && apt-get install -y docker-ce && \
    git clone https://github.com/openstack/kolla /kolla -b {version} && \
    pip install -r /kolla/requirements.txt

ADD kolla-build.sh /bin/kb

RUN chmod +x /bin/kb

CMD ["/bin/sleep", "infinity"]

