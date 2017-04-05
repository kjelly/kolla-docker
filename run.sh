#!/bin/bash
docker rm -f kolla-docker
docker run -d --net=host --privileged --name kolla-docker kolla-docker
